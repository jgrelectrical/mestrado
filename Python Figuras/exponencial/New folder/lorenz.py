# -*- coding: utf-8 -*-
"""
Created on Wed Jun  1 09:06:40 2022

@author: jgrel
"""

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

lorenz = pd.read_csv("serie.dat", sep=",",header=None)

lorenz = lorenz.to_numpy()

lorenz = lorenz[:,0]

t  = np.linspace(0.1, 42,4200)
# t  = t[0:4999:5]


fig1, ax1 = plt.subplots()



# bplots1 = plt.boxplot(L,showfliers=False,patch_artist = True,labels=['1'])
plt.plot(t,lorenz,'g-',linewidth=1)
ax1.tick_params(labelsize=15)
ax1.set_xlabel(r'Tempo $(s)$', fontsize=20)
ax1.set_ylabel(r'Variável $x$', fontsize=20)
ax1.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)
plt.xlim(0, 42)




#fig1.set_facecolor('white')

ax1.set_facecolor("white")
plt.setp(ax1.spines.values(), color='k')


fig1.tight_layout()
plt.savefig('serielorenz.png', dpi=300)
plt.show()