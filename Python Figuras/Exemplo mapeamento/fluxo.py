# -*- coding: utf-8 -*-
"""
Created on Sun Jun  5 22:38:47 2022

@author: jgrel
"""





# # plt.figure(figsize=(8,8))
# G=nx.DiGraph()

# pos = {0:[0.5,0],1:[0.6,0],2:[0.7,0]}
# options = {"edgecolors": "tab:gray", "node_size": 5000, "alpha": 0.9}
# nx.draw_networkx_nodes(G, pos, nodelist=[0, 1, 2], node_color="tab:red",node_shape = 's', **options)

# nx.draw_networkx_edges(
#     G,
#     pos,
#     edgelist=[(0,1),(1,2)],
#     width=8,
#     alpha=0.9,
#     edge_color="k",
# )

# # G.add_edges_from([(0,1),(1,2)])

# # nx.draw_networkx(G,pos=po)

# plt.tight_layout()
# plt.axis("off")

# plt.savefig("path.png")

import matplotlib.pyplot as plt
import networkx as nx
import numpy as np


fig1, ax1 = plt.subplots()


G=nx.DiGraph()




pos = {0:[0.5,0],1:[0.56,0]}


options = {"edgecolors": "tab:gray", "node_size":8700, "alpha": 0.9}
nodes=nx.draw_networkx_nodes(G, pos,nodelist=[0, 1], node_shape = 's',node_color=["lightgreen"], **options)
nodes.set_edgecolor('k')

# edges
lista = list(nx.get_edge_attributes(G,'weight').values())
#peso = np.array(lista)
#nx.draw_networkx_edges(G, pos,width=peso, alpha=1,arrowstyle='-|>',arrowsize=20,min_source_margin=23,min_target_margin=20)
nx.draw_networkx_edges(
    G,
    pos,
    edgelist=[(0,1)],
    width=7,
    alpha=0.9,
    edge_color="k",arrowstyle='-|>',arrowsize=20,min_source_margin=48,min_target_margin=44)


label = {}
label[0] = "$x(2)$"
label[1] = "x(3)"



edge_labels={(0, 1): 'AB'}

nx.draw_networkx_labels(G, pos,label,font_color="k",font_size=22)
nx.draw_networkx_edge_labels(
    G, pos,
    edge_labels=edge_labels,
    font_color='k',
    font_size=22
)

plt.tight_layout()

ax1.set_xlim([0.47, 0.58])
ax1.set_ylim([-0.001, 0.001])

plt.axis("off")
plt.savefig('fluxograma.png', dpi=300)
plt.show()