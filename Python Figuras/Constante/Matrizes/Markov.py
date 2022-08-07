# -*- coding: utf-8 -*-
"""
Created on Thu May 26 14:06:01 2022

@author: jgrel
"""

import matplotlib.pyplot as plt
import networkx as nx
import numpy as np
import seaborn as sns
import pandas as pd


W = pd.read_csv("W4.txt", sep=",",header=None)


x_axis_labels = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
y_axis_labels = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

fig1, ax1 = plt.subplots()


ax1 = sns.heatmap(W,annot=False,cbar=True,cmap='hot_r',annot_kws={"size": 5}, linewidths=0.5, linecolor='white',xticklabels=6, yticklabels=6)
ax1.tick_params(labelsize=10)
ax1.set_xlabel(r'Vértice $i$', fontsize=17)
ax1.set_ylabel(r'Vértice $j$', fontsize=17)
ax1.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)

sns.set(font_scale=0.8)
fig1.tight_layout()

plt.savefig('W20.png', dpi=300)
plt.show()