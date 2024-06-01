import pandas as pd
from sqlalchemy import create_engine
import matplotlib.pyplot as plt
import seaborn as sns
import mpld3
import shutil
import tempfile
import zipfile
import os
from weasyprint import HTML

# Configurar la conexión con la base de datos AdventureWorksOLAP
server = 'localhost'
database = 'AdventureWorksOLAP'
connection_string = f'mssql+pyodbc://{server}/{database}?trusted_connection=yes&driver=ODBC+Driver+17+for+SQL+Server'
engine = create_engine(connection_string)

# Consulta SQL para obtener datos de la tabla Product
sql_query_product = """
SELECT * FROM [Product]
"""

# Consulta SQL para obtener datos de la tabla Sales
sql_query_sales = """
SELECT * FROM [Sales]
"""

# Ejecutar las consultas y cargar los datos en DataFrames de pandas
df_product = pd.read_sql(sql_query_product, engine)
df_sales = pd.read_sql(sql_query_sales, engine)

# Crear un directorio temporal para guardar los resultados
output_dir = tempfile.mkdtemp()

# Guardar las primeras filas de los DataFrames en archivos HTML
with open(os.path.join(output_dir, 'product_table.html'), 'w') as f:
    f.write("<h2>Product Table:</h2>")
    f.write(df_product.head().to_html(index=False, classes='table table-striped table-bordered'))

with open(os.path.join(output_dir, 'sales_table.html'), 'w') as f:
    f.write("<h2>Sales Table:</h2>")
    f.write(df_sales.head().to_html(index=False, classes='table table-striped table-bordered'))

# Guardar la descripción estadística en archivos HTML
with open(os.path.join(output_dir, 'product_description.html'), 'w') as f:
    f.write("<h2>Product Table Description:</h2>")
    f.write(df_product.describe().to_html(index=False, classes='table table-striped table-bordered'))

with open(os.path.join(output_dir, 'sales_description.html'), 'w') as f:
    f.write("<h2>Sales Table Description:</h2>")
    f.write(df_sales.describe().to_html(index=False, classes='table table-striped table-bordered'))

# Visualización de datos
# Gráfico de barras para visualizar la cantidad de productos por categoría
plt.figure(figsize=(10, 6))
sns.countplot(x='Category', data=df_product)
plt.title('Cantidad de productos por Categorias')
plt.xlabel('Categoria')
plt.ylabel('Cant.')
plt.xticks(rotation=45)
plt.tight_layout()
# Convertir el gráfico a HTML utilizando mpld3 y guardar en archivo
html_graph = mpld3.fig_to_html(plt.gcf())
with open(os.path.join(output_dir, 'product_category_count.html'), 'w') as f:
    f.write(html_graph)
plt.savefig(os.path.join(output_dir, 'product_category_count.png'))
plt.close()

# Gráfico de dispersión para visualizar la relación entre SalesAmount y OrderQuantity
plt.figure(figsize=(10, 6))
sns.scatterplot(x='SalesAmount', y='OrderQuantity', data=df_sales)
plt.title('Scatter Plot of SalesAmount vs. OrderQuantity')
plt.xlabel('SalesAmount')
plt.ylabel('OrderQuantity')
plt.tight_layout()
# Convertir el gráfico a HTML utilizando mpld3 y guardar en archivo
html_graph = mpld3.fig_to_html(plt.gcf())
with open(os.path.join(output_dir, 'sales_scatter_plot.html'), 'w') as f:
    f.write(html_graph)
    plt.savefig(os.path.join(output_dir, 'sales_scatter_plot.png'))
plt.close()

# Convertir archivos HTML a PDF
for root, _, files in os.walk(output_dir):
    for file in files:
        if file.endswith('.html'):
            html_path = os.path.join(root, file)
            pdf_path = os.path.splitext(html_path)[0] + '.pdf'
            HTML(html_path).write_pdf(pdf_path)

# Crear un archivo ZIP con todos los archivos generados
zip_path = shutil.make_archive(os.path.splitext(pdf_path)[0], 'zip', output_dir)

# Imprimir la ruta del directorio de salida
print(output_dir)
