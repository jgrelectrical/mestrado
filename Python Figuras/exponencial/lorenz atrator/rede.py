# -*- coding: utf-8 -*-
"""
Created on Tue Jun 14 13:43:40 2022

@author: jgrel
"""

import matplotlib.pyplot as plt
import networkx as nx
import networkx.algorithms.community as nxcom
import community 
import numpy as np
import pandas as pd
import igraph as ig
import leidenalg as la


W = pd.read_csv("W0.txt", sep=",",header=None)

A = pd.read_csv("W4.txt", sep=",",header=None)


W = W.to_numpy()

A = A.to_numpy()
# G_karate = nx.karate_club_graph()

# communities = sorted(nxcom.greedy_modularity_communities(G_karate), key=len, reverse=True)


# print(f"The karate club has {len(communities)} communities.")

G = nx.DiGraph(W)
H = nx.DiGraph(A)

communities = sorted(nxcom.greedy_modularity_communities(G), key=len, reverse=True)
communities2 = sorted(nxcom.greedy_modularity_communities(H), key=len, reverse=True)


# M = nxcom.modularity(G,nxcom.label_propagation_communities(G))


# G = ig.Graph.Weighted_Adjacency(W)

# partition = la.find_partition(G, la.ModularityVertexPartition)


# ig.plot(partition) 

fig1, ax1 = plt.subplots()

pos1 = nx.fruchterman_reingold_layout(G)
plt.axis('off')
nx.draw_networkx_nodes(G, pos1, node_size=300, cmap=plt.cm.jet, node_color=[1,1,1,1,1,1,2,2,2,2,2,3,3,3,3,3,4,4,4,4])
nx.draw_networkx_edges(G,  pos1, edge_color='silver',alpha=1)
plt.savefig('redeW0.png', dpi=300)
plt.show()



fig2, ax2 = plt.subplots()

pos2 = nx.fruchterman_reingold_layout(H)
plt.axis('off')
nx.draw_networkx_nodes(H, pos2, node_size=300, cmap=plt.cm.jet, node_color=[1,1,1,1,1,1,2,2,2,2,3,3,3,3,3,4,4,4,4,4])
nx.draw_networkx_edges(H,  pos2, edge_color='darkgray',alpha=1)
plt.savefig('redeW20.png', dpi=300)
plt.show()

