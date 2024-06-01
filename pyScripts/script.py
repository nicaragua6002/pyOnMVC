# Librerías a utilizar
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import os

# Definir la ruta del archivo CSV y la ruta de la imagen
current_dir = os.path.dirname(os.path.abspath(__file__))
csv_path = os.path.join(current_dir, 'Mall_Customers.csv')
image_path = os.path.join(current_dir, '../Content/pyImg/scatter_plot.png')

# Leer el dataset
dataset = pd.read_csv(csv_path)


#print(dataset) # ver datos de dataset

matriz = dataset.iloc[:, [3, 4]].values

#print(matriz)

plt.figure(figsize=(8, 5))
plt.scatter(matriz[:, 0], matriz[:, 1], color='green', marker='*')
plt.title('Scatter Plot')
plt.xlabel('Ganancias anuales (k$) ')
plt.ylabel('Puntaje gastos (1-100)')
plt.grid(True)
#plt.show()

# Guardar el gráfico como una imagen
plt.savefig(image_path)

# Imprimir la ruta de la imagen
print("pyImg/scatter_plot.png")
