# -*- coding: utf-8 -*-
"""
Created on Thu Jun  2 19:11:27 2022

@author: jgrel
"""

import matplotlib.pyplot as plt
import networkx as nx
import networkx.algorithms.community as nxcom
import numpy as np
import pandas as pd



W0 = pd.read_csv("W0.csv", sep=",",header=None)

W5 = pd.read_csv("W5.csv", sep=",",header=None)

W10 = pd.read_csv("W10.csv", sep=",",header=None)

W15 = pd.read_csv("W15.csv", sep=",",header=None)

W20 = pd.read_csv("W20.csv", sep=",",header=None)


W0 = W0.to_numpy()
W5 = W5.to_numpy()
W10 = W10.to_numpy()
W15 = W15.to_numpy()
W20 = W20.to_numpy()


G = nx.DiGraph(W0)
H = nx.DiGraph(W5)
I = nx.DiGraph(W10)
J = nx.DiGraph(W15)
K = nx.DiGraph(W20)


communities = sorted(nxcom.greedy_modularity_communities(G), key=len, reverse=True)
communities2 = sorted(nxcom.greedy_modularity_communities(H), key=len, reverse=True)
communities3 = sorted(nxcom.greedy_modularity_communities(I), key=len, reverse=True)
communities4 = sorted(nxcom.greedy_modularity_communities(J), key=len, reverse=True)
communities5 = sorted(nxcom.greedy_modularity_communities(K), key=len, reverse=True)

#%%

fig1, ax1 = plt.subplots()

pos1 = nx.fruchterman_reingold_layout(G)
plt.axis('off')
nx.draw_networkx_nodes(G, pos1, node_size=300, cmap=plt.cm.jet, node_color=[1,1,1,1,1,1,2,2,2,2,2,3,3,3,3,3,4,4,4,4])
nx.draw_networkx_edges(G,  pos1, edge_color='silver',alpha=1)
plt.savefig('redeW0.png', dpi=300)
plt.show()


#%%
fig2, ax2 = plt.subplots()

pos2 = nx.fruchterman_reingold_layout(H)
plt.axis('off')
nx.draw_networkx_nodes(H, pos2, node_size=300, cmap=plt.cm.jet, node_color=[1,1,1,1,1,1,2,2,2,2,3,3,3,3,3,4,4,4,4,4])
nx.draw_networkx_edges(H,  pos2, edge_color='darkgray',alpha=1)
plt.savefig('redeW5.png', dpi=300)
plt.show()


#%%
fig3, ax3 = plt.subplots()

pos3 = nx.fruchterman_reingold_layout(I)
plt.axis('off')
nx.draw_networkx_nodes(I, pos3, node_size=300, cmap=plt.cm.jet, node_color=[1,1,1,1,1,1,2,2,2,2,3,3,3,3,3,4,4,4,4,4])
nx.draw_networkx_edges(I,  pos3, edge_color='darkgray',alpha=1)
plt.savefig('redeW10.png', dpi=300)
plt.show()

#%%
fig4, ax4 = plt.subplots()

pos4 = nx.fruchterman_reingold_layout(J)
plt.axis('off')
nx.draw_networkx_nodes(J, pos4, node_size=300, cmap=plt.cm.jet, node_color=[1,1,1,1,1,1,1,2,2,2,3,3,3,3,3,4,4,4,4,4])
nx.draw_networkx_edges(J,  pos4, edge_color='darkgray',alpha=1)
plt.savefig('redeW15.png', dpi=300)
plt.show()


#%%
fig5, ax5 = plt.subplots()

pos5 = nx.fruchterman_reingold_layout(K)
plt.axis('off')
nx.draw_networkx_nodes(K, pos5, node_size=300, cmap=plt.cm.jet, node_color=[1,1,1,1,1,1,1,1,3,3,3,3,3,3,3,4,4,4,4,4])
nx.draw_networkx_edges(K,  pos5, edge_color='darkgray',alpha=1)
plt.savefig('redeW20.png', dpi=300)
plt.show()