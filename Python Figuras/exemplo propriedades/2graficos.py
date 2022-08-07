# -*- coding: utf-8 -*-
"""
Created on Wed May 18 21:36:07 2022

@author: jgrel
"""

import matplotlib.pyplot as plt
import networkx as nx
import numpy as np



A=np.matrix([[0 ,2 ,0 ,2, 0],
             [0, 0 ,3, 0 ,0],
             [1, 0 ,0, 0, 0],
             [0, 0, 0, 0, 0],
             [1, 0, 0, 0, 0],])




G=nx.from_numpy_matrix(A,create_using=nx.MultiDiGraph())


pos = nx.spring_layout(G)

options = {"edgecolors": "tab:gray", "node_size":2000, "alpha": 0.9}
nodes=nx.draw_networkx_nodes(G, pos, node_color="tab:green", **options)
nodes.set_edgecolor('k')

# edges
lista = list(nx.get_edge_attributes(G,'weight').values())
peso = np.array(lista)
nx.draw_networkx_edges(G, pos,width=peso*2, alpha=1,arrowstyle='-|>',arrowsize=40,min_source_margin=23,min_target_margin=20)

# G.edges(data=True)

#nx.draw(G,node_color='green')

edge_labels = dict([((n1, n2), d['weight'])
                    for n1, n2, d in G.edges(data=True)])

label = {}
label[0] = "1"
label[1] = "2"
label[2] = "3"
label[3] = "4"
label[4] = "5"

nx.draw_networkx_labels(G, pos,label,font_color="whitesmoke")
nx.draw_networkx_edge_labels(
    G, pos,
    edge_labels=edge_labels,
    font_color='k'
)

plt.tight_layout()
plt.axis("off")
plt.savefig('direto.png', dpi=300)
plt.show()