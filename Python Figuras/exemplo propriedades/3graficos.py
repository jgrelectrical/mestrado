# -*- coding: utf-8 -*-
"""
Created on Wed May 18 12:47:15 2022

@author: jgrel
"""

import matplotlib.pyplot as plt
import networkx as nx
import numpy as np



A=np.matrix([[0 ,1 ,1 ,1, 1],
             [1, 0 ,1, 0 ,0],
             [1, 1 ,0, 0, 0],
             [1, 0, 0, 0, 0],
             [1, 0, 0, 0, 0],])




G=nx.from_numpy_matrix(A,create_using=nx.Graph())


pos = nx.spring_layout(G)

options = {"edgecolors": "tab:gray", "node_size":2000, "alpha": 1}
nodes=nx.draw_networkx_nodes(G, pos, node_color="tab:green", **options)
nodes.set_edgecolor('k')

# edges
lista = list(nx.get_edge_attributes(G,'weight').values())
peso = np.array(lista)
nx.draw_networkx_edges(G, pos,width=3, alpha=1,min_source_margin=80,min_target_margin=80)

# G.edges(data=True)

#nx.draw(G,node_color='green')

label = {}
label[0] = "1"
label[1] = "2"
label[2] = "3"
label[3] = "4"
label[4] = "5"

nx.draw_networkx_labels(G, pos,label,font_color="whitesmoke")


plt.tight_layout()
plt.axis("off")
plt.savefig('naodireto.png', dpi=300)
plt.show()