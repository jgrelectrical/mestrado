# -*- coding: utf-8 -*-
"""
Created on Thu Jun  2 19:53:33 2022

@author: jgrel
"""

import matplotlib.pyplot as plt
import numpy as np


T = np.array([3.8,2.5,3.4,2.7,2.2,1.5,2.1,3.4,5.2])

t = np.array([1,2,3,4,5,6,7,8,9])

Tinf = T-T*0.2
Tsup = T*1.2

Q = 3;




fig1, ax1 = plt.subplots()

ax1.plot(t,T,'k-o')


ax1.tick_params(labelsize=15)
ax1.set_ylabel(r'$x(t)$', fontsize=20)
ax1.set_xlabel(r'$t$', fontsize=20)
ax1.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)




fig1.tight_layout()
plt.savefig('seriemapeamento.png', dpi=300)

plt.show()