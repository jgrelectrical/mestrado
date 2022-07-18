# -*- coding: utf-8 -*-
"""
Created on Thu Jun  2 17:56:32 2022

@author: jgrel
"""

import matplotlib.pyplot as plt
import numpy as np


T = np.array([3.8,2.5,3.4,2.7,2.2,1.5,2.1,3.5,5.2])

t = np.array([1,2,3,4,5,6,7,8,9])

Tinf = T-T*0.2
Tsup = T*1.2

Q = 3;




fig1, ax1 = plt.subplots()

ax1.plot(t,T,'k-o')
np.linspace(2.2, 2.2, num=9)
q1=2.2
q2=3.4
q3=5.2


ax1.tick_params(labelsize=15)
ax1.set_ylabel(r'$x(t)$', fontsize=20)
ax1.set_xlabel(r'$t$', fontsize=20)
ax1.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)






ax1.fill_between(x=t,y1= q1,where=t,color='red',alpha=0.2)

ax1.fill_between(x=t,y1= q1,y2=q2,where=t,color='green',alpha=0.2)

ax1.fill_between(x=t,y1= q2,y2=q3,where=t,color='blue',alpha=0.2)

ax1.set_xlim([1, 9])
ax1.set_ylim([0, 5.2])

fig1.tight_layout()
plt.savefig('ciclo.png', dpi=300)

plt.show()