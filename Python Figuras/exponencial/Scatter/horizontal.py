# -*- coding: utf-8 -*-
"""
Created on Tue Jun  7 16:46:22 2022

@author: jgrel
"""

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

t = np.linspace(1, 9,9)
t2= np.array([1,2,4, 5, 6, 7, 8, 9])
t1= np.array([3])
y2 = np.array([8,1,4,2,3,7,0,5])
y1 = np.array([6])

fig, ax = plt.subplots()

#linha1

t3 = np.array([1,3])
y3 = np.array([6,6])

plt.plot(t3,y3,'k--')


t4 = np.array([2,3])
y4 = np.array([1,1])

plt.plot(t4,y4,'k--')

t5 = np.array([3,4])
y5 = np.array([4,4])


plt.plot(t5,y5,'k--')


t6 = np.array([3,7])
y6 = np.array([6,6])


plt.plot(t6,y6,'k--')



plt.stem(t1, y1,'r', markerfmt='ro')
plt.stem(t2, y2,'g', markerfmt='go')


ax.tick_params(labelsize=15)
ax.set_ylabel(r'$x(t)$', fontsize=20)
ax.set_xlabel(r'$t(s)$', fontsize=20)
ax.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)

fig.tight_layout()

plt.savefig('visualhorizontal.png', dpi=300)

plt.show()