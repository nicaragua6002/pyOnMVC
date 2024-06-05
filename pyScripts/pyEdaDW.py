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

# Mostrar las primeras filas del DataFrame
print(df.head().to_html(index=False, classes='table table-striped table-bordered'))

# Resumen estadístico de las columnas numéricas
print(df.describe())

# Información sobre el DataFrame
print(df.info())
