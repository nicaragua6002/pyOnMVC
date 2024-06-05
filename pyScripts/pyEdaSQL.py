import edaSQL  # Importa la biblioteca edaSQL para el análisis exploratorio de datos
import pandas as pd  # Importa pandas para el manejo de datos
import pyodbc  # Importa pyodbc para la conexión con la base de datos SQL Server
import matplotlib.pyplot as plt  # Importa Matplotlib para la visualización de datos

# Configuración de la conexión a la base de datos
server = 'localhost'  # Nombre del servidor SQL Server
database = 'VentasDW'  # Nombre de la base de datos
driver = 'ODBC Driver 17 for SQL Server'  # Controlador ODBC utilizado para la conexión

# Intenta establecer la conexión utilizando autenticación de Windows
try:
    conn = pyodbc.connect(
        f'DRIVER={{{driver}}};'
        f'SERVER={server};'
        f'DATABASE={database};'
        'Trusted_Connection=yes;'
    )
except Exception as e:
    print(f"Error al conectar a la base de datos: {e}")

# Query SQL para extraer los datos de la base de datos
query = """
SELECT 
    fs.SalesID, 
    fs.SalesAmount, 
    fs.OrderQuantity,
    dt.Year,
    dt.Month,
    dt.Date,
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

# Lee los datos en un DataFrame de pandas desde la base de datos
data = pd.read_sql(query, conn)

# Muestra las primeras filas del DataFrame en formato HTML
print("<h2>Primeras 10 filas</h2>")
print(data.head(5).to_html(index=False, classes='table table-striped table-bordered'))

# Resumen estadístico de las columnas numéricas
#print(data.describe().to_html(index=False, classes='table table-striped table-bordered'))

# Usa edaSQL para generar un análisis exploratorio de datos (EDA)
eda_report = edaSQL.EDA(dataFrame=data).dataInsights()

# Formatea el informe EDA en formato HTML
print("<h2>Informe EDA con edaSQL</h2>")
#print(eda_report)
html_report = "<table border='1' class='table table-striped table-bordered'>"
for key, value in eda_report.items():
    if isinstance(value, dict):
        html_report += f"<tr><th colspan='2'>{key}</th></tr>"
        for k, v in value.items():
            html_report += f"<tr><td>{k}</td><td>{v}</td></tr>"
    else:
        html_report += f"<tr><td>{key}</td><td>{value}</td></tr>"
html_report += "</table>"
print(html_report)

# Realiza un análisis de correlación de Pearson utilizando edaSQL
eda = edaSQL.EDA(dataFrame=data)
eda.pearsonCorrelation()

# Muestra el gráfico de la correlación de Pearson utilizando Matplotlib
plt.show()



