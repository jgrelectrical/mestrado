# -*- coding: utf-8 -*-
"""
Created on Tue Jun  7 14:50:44 2022

@author: jgrel
"""

import matplotlib.pyplot as plt
import networkx as nx
import numpy as np


#            1  ,2 ,3 ,4, 5, 6, 7, 8, 9 
A=np.matrix([[0 ,1 ,1 ,0, 0, 0, 1, 0, 0],
             [1 ,0 ,1 ,0, 0, 0, 0, 0, 0],
             [1 ,1 ,0 ,1, 0, 1, 1, 0, 0],
             [0 ,0 ,1 ,0, 1, 1, 1, 0, 0],
             [0 ,0 ,0 ,1, 0, 1, 1, 0, 0],
             [0 ,0 ,1 ,1, 1, 0, 1, 0, 0],
             [1 ,0 ,1 ,1, 1, 1, 0, 1, 1],
             [0 ,0 ,0 ,0, 0, 0, 1, 0, 1],
             [0 ,0 ,0 ,0, 0, 0, 1, 1, 0],])


# (2, 0) or (2, 1) or (2, 3) or (2, 5) or (2, 6)

G=nx.from_numpy_matrix(A,create_using=nx.Graph())

mapping = {0: 1, 1: 2, 2: 3, 3: 4, 4: 5, 5: 6, 6: 7, 7: 8, 8: 9}

G = nx.relabel_nodes(G, mapping)


pos = nx.circular_layout(G)

color_map = []
for node in G:
    if node == 3:
        color_map.append('red')
    else: 
        color_map.append('green') 

options = {"edgecolors": "k", "node_size":2000, "alpha": 1}
nodes=nx.draw_networkx_nodes(G, pos, node_color=color_map, **options)
# nodes.set_edgecolor('k')

ecolor_map = []
for edges in G.edges:
    if edges ==(1, 3) or edges ==(2, 3) or edges ==(3, 4) or edges ==(3, 6) or edges ==(3, 7):
        ecolor_map.append('red')
    else: 
        ecolor_map.append('k') 

nx.draw_networkx_edges(G, pos,width=2, alpha=1,edge_color=ecolor_map)





nx.draw_networkx_labels(G, pos,font_color="whitesmoke")



plt.tight_layout()
plt.axis("off")
plt.savefig('visualrede.png', dpi=300)
plt.show()


