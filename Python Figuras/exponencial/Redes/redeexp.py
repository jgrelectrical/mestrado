# -*- coding: utf-8 -*-
"""
Created on Tue Jun 14 17:35:31 2022

@author: jgrel
"""

import matplotlib.pyplot as plt
import networkx as nx
import networkx.algorithms.community as nxcom
import numpy as np
import pandas as pd



W = pd.read_csv("Wlorenz.csv", sep=",",header=None)

WI = pd.read_csv("WlorenzIn.csv", sep=",",header=None)




W = W.to_numpy()
WI = WI.to_numpy()



G = nx.DiGraph(W)
H = nx.DiGraph(WI)



communities = sorted(nxcom.greedy_modularity_communities(G), key=len, reverse=True)
communities2 = sorted(nxcom.greedy_modularity_communities(H), key=len, reverse=True)


#%%

fig1, ax1 = plt.subplots()

pos1 = nx.spectral_layout(G)
plt.axis('off')
nx.draw_networkx_nodes(G, pos1, node_size=300, cmap=plt.cm.jet, node_color=[7,7,1,1,1,1,1,1,2,2,2,2,2,6,6,6,5,5,5,5,3,3,3,3,3,4,4,4,4,4])
nx.draw_networkx_edges(G,  pos1, edge_color='silver',alpha=1)
plt.savefig('redelorenz.png', dpi=300)
plt.show()


#%%
fig2, ax2 = plt.subplots()

pos2 = nx.spectral_layout(H)
plt.axis('off')
nx.draw_networkx_nodes(H, pos2, node_size=300, cmap=plt.cm.jet, node_color=[1,1,1,1,1,1,1,1,3,3,3,3,3,2,2,2,2,2,2,2,4,4,4,4,4,5,5,5,5,5])
nx.draw_networkx_edges(H,  pos2, edge_color='darkgray',alpha=1)
plt.savefig('redelorenzIn.png', dpi=300)
plt.show()

