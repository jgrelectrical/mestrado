# -*- coding: utf-8 -*-
"""
Created on Thu Jul 28 08:54:57 2022

@author: jgrel
"""

import matplotlib.pyplot as plt
import networkx as nx
import numpy as np
import csv
import pandas as pd

# reader = csv.reader(open("A.csv", "rb"), delimiter=",")
# # x = list(reader)
# # result = np.array(x).astype("float")

# result = np.array(list(csv.reader(open("A.csv", "rb"), delimiter=","))).astype("float")


data = pd.read_csv('A.txt', sep=",", header=None)

A = data.to_numpy()



G=nx.from_numpy_matrix(A,create_using=nx.Graph())


pos = nx.spring_layout(G)

options = {"edgecolors": "tab:gray", "node_size":25, "alpha": 1}
nodes=nx.draw_networkx_nodes(G, pos, node_color="tab:green", **options)
nodes.set_edgecolor('k')



nx.draw_networkx_edges(G, pos,width=0.3, alpha=0.9,edge_color='grey')


#nx.draw_networkx_labels(G, pos,font_color="whitesmoke")


plt.tight_layout()
plt.axis("off")
plt.savefig('recorrencia.pdf', dpi=10)
plt.show()