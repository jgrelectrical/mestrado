# -*- coding: utf-8 -*-
"""
Created on Thu Jul 28 08:56:21 2022

@author: jgrel
"""

import matplotlib.pyplot as plt
import networkx as nx
import numpy as np
import seaborn as sns
import matplotlib.colors

import csv
import pandas as pd


data = pd.read_csv('A.txt', sep=",", header=None)

A = data.to_numpy()


# sns.heatmap(A,annot=True,cbar=False,cmap='Greens',annot_kws={"size": 20}, linewidths=1, linecolor='black')

# sns.set(font_scale=2)

# plt.savefig('recorrenciamatrix.pdf', dpi=300)
# plt.show()

cmap = matplotlib.colors.ListedColormap(['w', 'g'])

plt.imshow(A, cmap=cmap)


plt.tight_layout()
# plt.axis("off")
plt.savefig('matrizrecorrencia.pdf', dpi=300)
plt.show()

# plt.colorbar()

# plt.savefig('recorrenciamatrix.pdf', dpi=300)
# plt.show()