# -*- coding: utf-8 -*-
"""
Created on Thu May 26 06:59:32 2022

@author: jgrel
"""

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

t  = np.linspace(0, 0.1,10000)
t  = t[0:4999:5]

T = pd.read_csv("Jerk_circ.txt", sep=",",header=None)

T = T.to_numpy()
T = T[0:4999:5]

fig1, ax1 = plt.subplots()

ax1.plot(t,T,color='k',linewidth=3)

ax1.set_xlim([0, 0.05])
ax1.tick_params(labelsize=15)
ax1.set_ylabel(r'Tensão(v)', fontsize=20)
ax1.set_xlabel(r'Tempo(s)', fontsize=20)
ax1.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)

fig1.tight_layout()
plt.savefig('Tjerkserie.png', dpi=300)

plt.show()