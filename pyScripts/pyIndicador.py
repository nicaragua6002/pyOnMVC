import pandas as pd
import matplotlib.pyplot as plt
import pyodbc
import calendar
import numpy as np

# Conectar a la base de datos usando autenticación integrada de Windows
conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=localhost;'
    'DATABASE=VentasDW;'
    'Trusted_Connection=yes;'
)

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
df = pd.read_sql(query, conn)

# Cerrar la conexión
conn.close()

# Agrupar las ventas por mes y año
monthly_sales = df.groupby(['Year', 'Month']).agg({'SalesAmount': 'sum'}).reset_index()

# Ordenar por año y mes
monthly_sales = monthly_sales.sort_values(by=['Year', 'Month'])

# Calcular el incremento mensual en porcentaje
monthly_sales['MonthlyGrowth'] = monthly_sales['SalesAmount'].pct_change() * 100

# Meta de incremento del 5%
target_growth = 5

# Calcular las ventas esperadas con un crecimiento del 5% mensual
monthly_sales['ExpectedSales'] = monthly_sales['SalesAmount'].shift(1) * (1 + target_growth / 100)

# Obtener nombres de los meses en español
meses_esp = ["","Ene", "Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic"]
#months_spanish = [calendar.month_name[i].capitalize() for i in range(1, 13)]
months_spanish = [meses_esp[i].capitalize() for i in range(1, 13)]

# Crear índice para las barras
index = np.arange(len(monthly_sales))

# Ancho de las barras
bar_width = 0.35

# Color de las barras de ventas reales
colors = ['red' if real_sales < expected_sales else 'green' for real_sales, expected_sales in zip(monthly_sales['SalesAmount'], monthly_sales['ExpectedSales'])]

# Graficar las ventas reales vs las ventas esperadas como un gráfico de barras paralelas
plt.bar(index, monthly_sales['SalesAmount'], bar_width, color=colors, alpha=0.7, label='Ventas Reales')
plt.bar(index + bar_width, monthly_sales['ExpectedSales'], bar_width, color='orange', alpha=0.7, label='Ventas Esperadas')
plt.xlabel('Mes')
plt.ylabel('Ventas')
plt.title('Ventas Reales vs Ventas Esperadas')
plt.xticks(index + bar_width / 2, months_spanish, rotation=45, ha='right')
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()
//month_names = list(calendar.month_name)
//print(month_names)
