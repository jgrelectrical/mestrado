# -*- coding: utf-8 -*-
"""
Created on Sun Jun 12 03:37:50 2022

@author: jgrel
"""

import matplotlib.pyplot as plt
import numpy as np
import scipy as sp


T = np.array([2,2.5,3,3.1,2.9,2.8,3,2.9,3.4,3.7,3.8,4.2,3.9,4.6,4.7])

t = np.array([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])







fig1, ax1 = plt.subplots()

ax1.plot(t,T,'k-o',alpha=0.9)



ax1.tick_params(labelsize=15)
ax1.set_ylabel(r'$x(t)$', fontsize=20)
ax1.set_xlabel(r'$t$', fontsize=20)
ax1.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)





#ax1.legend()

ax1.set_xlim([1, 15])
ax1.set_ylim([0, 7])

fig1.tight_layout()
plt.savefig('exemploserie.png', dpi=300)

plt.show()