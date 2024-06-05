import pandas as pd
import matplotlib.pyplot as plt
from sqlalchemy import create_engine
import calendar
import numpy as np
from io import StringIO

# Crea la cadena de conexión para SQLAlchemy
connection_string = 'mssql+pyodbc://@localhost/VentasDW?driver=ODBC+Driver+17+for+SQL+Server'

# Crear el motor de SQLAlchemy
engine = create_engine(connection_string)

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

# Leer los datos en un DataFrame de pandas usando el motor de SQLAlchemy
df = pd.read_sql(query, engine)

# Mostrar las primeras filas del DataFrame
print(df.head().to_html(index=False, classes='table table-striped table-bordered'))

# Resumen estadístico de las columnas numéricas
print(df.describe().to_html(index=False, classes='table table-striped table-bordered'))


