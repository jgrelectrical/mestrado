# -*- coding: utf-8 -*-
"""
Created on Mon Jun  6 01:45:08 2022

@author: jgrel
"""

import matplotlib.pyplot as plt
import networkx as nx
import numpy as np



G = nx.read_edgelist("rede.csv", nodetype=int, data=(("weight", float),))

pos = nx.spectral_layout(G)

nx.draw(G,pos)