# -*- coding: utf-8 -*-
"""
Created on Mon May 30 15:45:01 2022

@author: jgrel
"""

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

n = np.linspace(1, 1000,1000)

BC = pd.read_csv("coverBC.txt", sep=",",header=None)

BC = BC.to_numpy()

BC = BC.reshape(1000)

fig1, ax1 = plt.subplots()

ax1.plot(n,BC,color='green',linewidth=2)


ax1.tick_params(labelsize=15)
ax1.set_ylabel(r'$BC$', fontsize=20)
ax1.set_xlabel(r'$N^o$ de Iterações $(n)$', fontsize=20)
ax1.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)

fig1.tight_layout()

plt.savefig('BCconverlorenz.png', dpi=300)

plt.show()


CC = pd.read_csv("coverCA.txt", sep=",",header=None)

CC = CC.to_numpy()

CC = CC.reshape(1000)

fig2, ax2 = plt.subplots()

ax2.plot(n,CC,color='green',linewidth=2)


ax2.tick_params(labelsize=15)
ax2.set_ylabel(r'$CC$', fontsize=20)
ax2.set_xlabel(r'$N^o$ de Iterações $(n)$', fontsize=20)
ax2.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)

fig2.tight_layout()

plt.savefig('CCconverlorenz.png', dpi=300)

plt.show()






L = pd.read_csv("coverL.txt", sep=",",header=None)

L = L.to_numpy()

L = L.reshape(1000)

fig3, ax3 = plt.subplots()

ax3.plot(n,L,color='green',linewidth=2)


ax3.tick_params(labelsize=15)
ax3.set_ylabel(r'$L$', fontsize=20)
ax3.set_xlabel(r'$N^o$ de Iterações $(n)$', fontsize=20)
ax3.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)

fig3.tight_layout()

plt.savefig('Lconverlorenz.png', dpi=300)

plt.show()



Mo = pd.read_csv("coverMo.txt", sep=",",header=None)

Mo = Mo.to_numpy()

Mo = Mo.reshape(1000)

fig4, ax4 = plt.subplots()

ax4.plot(n,Mo,color='green',linewidth=2)


ax4.tick_params(labelsize=15)
ax4.set_ylabel(r'$Mo$', fontsize=20)
ax4.set_xlabel(r'$N^o$ de Iterações $(n)$', fontsize=20)
ax4.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)

fig4.tight_layout()

plt.savefig('Moconverlorenz.png', dpi=300)

plt.show()


S = pd.read_csv("coverS.txt", sep=",",header=None)

S = S.to_numpy()

S = S.reshape(1000)

fig5, ax5 = plt.subplots()

ax5.plot(n,S,color='green',linewidth=2)


ax5.tick_params(labelsize=15)
ax5.set_ylabel(r'$\Delta$', fontsize=20)
ax5.set_xlabel(r'$N^o$ de Iterações $(n)$', fontsize=20)
ax5.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)

fig5.tight_layout()

plt.savefig('Sconverlorenz.png', dpi=300)

plt.show()
