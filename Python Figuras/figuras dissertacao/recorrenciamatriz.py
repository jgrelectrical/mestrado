# -*- coding: utf-8 -*-
"""
Created on Sat May 21 04:15:35 2022

@author: jgrel
"""

import matplotlib.pyplot as plt
import networkx as nx
import numpy as np
import seaborn as sns


A=np.matrix([[0 ,0 ,0 ,0, 0, 0, 1, 0],
             [0 ,0 ,0 ,0, 0, 1, 0, 1],
             [0 ,0 ,0 ,1, 0, 0, 0, 0],
             [0 ,0 ,1 ,0, 1, 0, 0, 0],
             [0 ,0 ,0 ,1, 0, 0, 0, 1],
             [0 ,1 ,0 ,0, 0, 0, 0, 0],
             [1 ,0 ,0 ,0, 0, 0, 0, 0],
             [0 ,1 ,0 ,0, 1, 0, 0, 0],])


sns.heatmap(A,annot=True,cbar=False,cmap='Greens',annot_kws={"size": 20}, linewidths=1, linecolor='black')

sns.set(font_scale=2)

plt.savefig('recorrenciamatrix.png', dpi=300)
plt.show()