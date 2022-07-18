# -*- coding: utf-8 -*-
"""
Created on Sat May 21 03:49:47 2022

@author: jgrel
"""

import matplotlib.pyplot as plt
import networkx as nx
import numpy as np



A=np.matrix([[0 ,0 ,0 ,0, 0, 0, 1, 0],
             [0 ,0 ,0 ,0, 0, 1, 0, 1],
             [0 ,0 ,0 ,1, 0, 0, 0, 0],
             [0 ,0 ,1 ,0, 1, 0, 0, 0],
             [0 ,0 ,0 ,1, 0, 0, 0, 1],
             [0 ,1 ,0 ,0, 0, 0, 0, 0],
             [1 ,0 ,0 ,0, 0, 0, 0, 0],
             [0 ,1 ,0 ,0, 1, 0, 0, 0],])




G=nx.from_numpy_matrix(A,create_using=nx.Graph())


pos = nx.circular_layout(G)

options = {"edgecolors": "tab:gray", "node_size":2000, "alpha": 1}
nodes=nx.draw_networkx_nodes(G, pos, node_color="tab:green", **options)
nodes.set_edgecolor('k')



nx.draw_networkx_edges(G, pos,width=5, alpha=1,arrowstyle='-|>',arrowsize=40,min_source_margin=23,min_target_margin=20)


nx.draw_networkx_labels(G, pos,font_color="whitesmoke")


plt.tight_layout()
plt.axis("off")
plt.savefig('recorrencia.png', dpi=300)
plt.show()


