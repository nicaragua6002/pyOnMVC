# Librerías a utilizar
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import os

# Definir la ruta del archivo CSV y la ruta de la imagen
current_dir = os.path.dirname(os.path.abspath(__file__))
csv_path = os.path.join(current_dir, 'Mall_Customers.csv')

# Leer el dataset
dataset = pd.read_csv(csv_path)
print(dataset.head(10).to_html(index=False,classes='table table-striped table-bordered'))