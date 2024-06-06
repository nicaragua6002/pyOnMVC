import pandas as pd
import matplotlib.pyplot as plt
import sqlalchemy
import calendar
import numpy as np
import mpld3  # Importar mpld3 para convertir gráficos matplotlib a HTML interactivo
import sys  # Importar sys para acceder a los argumentos del script
import argparse  # Importar argparse para manejar los argumentos del script

# Configurar argparse para manejar los argumentos del script
parser = argparse.ArgumentParser(description='Generar gráfico de ventas.')
parser.add_argument('output_file_path', type=str, help='Ruta del archivo de salida HTML')
parser.add_argument('target_growth', type=float, help='Meta de incremento mensual en porcentaje')
args = parser.parse_args()

output_file_path = args.output_file_path
target_growth = args.target_growth

# Crear una cadena de conexión utilizando SQLAlchemy
connection_string = 'mssql+pyodbc://localhost/VentasDW?driver=ODBC+Driver+17+for+SQL+Server'
engine = sqlalchemy.create_engine(connection_string)

# Query para obtener los datos de ventas con las dimensiones
query = """
SELECT 
    fs.SalesID, 
    fs.SalesAmount, 
    fs.OrderQuantity,
    dt.Year,
    dt.Month,
    dp.ProductCategory,
    dc.CustomerSegment,
    dsr.RegionName
FROM 
    dbo.FactSales fs
JOIN 
    dbo.DimTime dt ON fs.DateKey = dt.DateKey
JOIN 
    dbo.DimProduct dp ON fs.ProductID = dp.ProductID
JOIN 
    dbo.DimCustomer dc ON fs.CustomerID = dc.CustomerID
JOIN 
    dbo.DimSalesRegion dsr ON fs.RegionID = dsr.RegionID
"""

# Leer los datos en un DataFrame de pandas
df = pd.read_sql(query, engine)

# Agrupar las ventas por mes y año
monthly_sales = df.groupby(['Year', 'Month']).agg({'SalesAmount': 'sum'}).reset_index()

# Ordenar por año y mes
monthly_sales = monthly_sales.sort_values(by=['Year', 'Month'])

# Calcular el incremento mensual en porcentaje
monthly_sales['MonthlyGrowth'] = monthly_sales['SalesAmount'].pct_change() * 100

# Calcular las ventas esperadas con un crecimiento del target_growth mensual
monthly_sales['ExpectedSales'] = monthly_sales['SalesAmount'].shift(1) * (1 + target_growth / 100)

# Obtener nombres de los meses en español
meses_esp = ["", "Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"]
months_spanish = [meses_esp[i].capitalize() for i in range(1, 13)]

# Crear índice para las barras
index = np.arange(len(monthly_sales))

# Ancho de las barras
bar_width = 0.35

# Color de las barras de ventas reales
colors = ['red' if real_sales < expected_sales else 'green' for real_sales, expected_sales in zip(monthly_sales['SalesAmount'], monthly_sales['ExpectedSales'])]

# Crear la figura y el eje
fig, ax = plt.subplots()

# Graficar las ventas reales vs las ventas esperadas como un gráfico de barras paralelas
ax.bar(index, monthly_sales['SalesAmount'], bar_width, color=colors, alpha=0.7, label='Ventas Reales')
ax.bar(index + bar_width, monthly_sales['ExpectedSales'], bar_width, color='orange', alpha=0.7, label='Ventas Esperadas')
ax.set_xlabel('Mes')
ax.set_ylabel('Ventas')
ax.set_title('Ventas Reales vs Ventas Esperadas')
ax.set_xticks(index + bar_width / 2)
ax.set_xticklabels(months_spanish[:len(index)], rotation=45, ha='right')
ax.legend()
ax.grid(True)
plt.tight_layout()

# Convertir el gráfico a HTML usando mpld3
html_graph = mpld3.fig_to_html(fig)

# Guardar el HTML en el archivo de salida
with open(output_file_path, 'w', encoding='utf-8') as file:
    file.write("<h2>Ventas Reales vs Ventas Esperadas</h2>")
    file.write(html_graph)

# Mostrar el gráfico (opcional)
plt.show()
