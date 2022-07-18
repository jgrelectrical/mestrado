# -*- coding: utf-8 -*-
"""
Created on Thu Jun  2 19:11:27 2022

@author: jgrel
"""

import matplotlib.pyplot as plt
import networkx as nx
import numpy as np



A=np.matrix([[2 ,0 ,1],
             [1, 2 ,0],
             [0, 1 ,1],])




G=nx.from_numpy_matrix(A,create_using=nx.MultiDiGraph())


pos = nx.spring_layout(G)


options = {"edgecolors": "tab:gray", "node_size":1200, "alpha": 1}
nodes=nx.draw_networkx_nodes(G, pos, node_color=["red","green","blue"], **options)
nodes.set_edgecolor('k')

# edges
lista = list(nx.get_edge_attributes(G,'weight').values())
peso = np.array(lista)
nx.draw_networkx_edges(G, pos,width=peso, alpha=1,arrowstyle='-|>',arrowsize=20,min_source_margin=23,min_target_margin=20)

# G.edges(data=True)

#nx.draw(G,node_color='green')

label = {}
label[0] = "1"
label[1] = "2"
label[2] = "3"


edge_labels = dict([((n1, n2), d['weight'])
                    for n1, n2, d in G.edges(data=True)])

nx.draw_networkx_labels(G, pos,label,font_color="whitesmoke")
nx.draw_networkx_edge_labels(
    G, pos,
    edge_labels=edge_labels,
    font_color='k'
)

plt.tight_layout()
plt.axis("off")
plt.savefig('rede.png', dpi=300)
plt.show()