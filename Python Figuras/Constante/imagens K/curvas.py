# -*- coding: utf-8 -*-
"""
Created on Wed May 25 23:00:05 2022

@author: jgrel
"""

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

L = pd.read_csv("Lcurvas.txt", sep=",",header=None)

L = L.to_numpy()

S = pd.read_csv("Scurvas.txt", sep=",",header=None)

S = S.to_numpy()

Mo = pd.read_csv("Mocurvas.txt", sep=",",header=None)

Mo = Mo.to_numpy()

CC = pd.read_csv("CCcurvas.txt", sep=",",header=None)

CC = CC.to_numpy()

BC = pd.read_csv("BCcurvas.txt", sep=",",header=None)

BC = BC.to_numpy()


k = np.linspace(1, 20,20)

##figuras

fig1, ax1 = plt.subplots()

ax1.plot(k,L[::,0],label='0%')
ax1.plot(k,L[::,1],label='5%')
ax1.plot(k,L[::,2],label='10%')
ax1.plot(k,L[::,3],label='15%')
ax1.plot(k,L[::,4],label='20%')
plt.legend(loc='upper right');
ax1.set_xlim([1, 20])
ax1.tick_params(labelsize=15)
ax1.set_xlabel(r'Valores de $k$', fontsize=20)
ax1.set_ylabel(r'$L(k)$', fontsize=20)
ax1.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)

fig1.tight_layout()
plt.savefig('Lcurvas.png', dpi=300)

plt.show()


fig2, ax2 = plt.subplots()

ax2.plot(k,S[::,0],label='0%')
ax2.plot(k,S[::,1],label='5%')
ax2.plot(k,S[::,2],label='10%')
ax2.plot(k,S[::,3],label='15%')
ax2.plot(k,S[::,4],label='20%')
plt.legend(loc='upper left');
ax2.set_xlim([1, 20])
ax2.tick_params(labelsize=15)
ax2.set_xlabel(r'Valores de $k$', fontsize=20)
ax2.set_ylabel(r'$\Delta(k)$', fontsize=20)
ax2.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)

fig2.tight_layout()
plt.savefig('Scurvas.png', dpi=300)

plt.show()




fig3, ax3 = plt.subplots()

ax3.plot(k,Mo[::,0],label='0%')
ax3.plot(k,Mo[::,1],label='5%')
ax3.plot(k,Mo[::,2],label='10%')
ax3.plot(k,Mo[::,3],label='15%')
ax3.plot(k,Mo[::,4],label='20%')
plt.legend(loc='upper right');
ax3.set_xlim([1, 20])
ax3.tick_params(labelsize=15)
ax3.set_xlabel(r'Valores de $k$', fontsize=20)
ax3.set_ylabel(r'$M_o(k)$', fontsize=20)
ax3.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)

fig3.tight_layout()
plt.savefig('Mocurvas.png', dpi=300)

plt.show()


fig4, ax4 = plt.subplots()

ax4.plot(k,CC[::,0],label='0%')
ax4.plot(k,CC[::,1],label='5%')
ax4.plot(k,CC[::,2],label='10%')
ax4.plot(k,CC[::,3],label='15%')
ax4.plot(k,CC[::,4],label='20%')
plt.legend(loc='lower right');
ax4.set_xlim([1, 20])
ax4.tick_params(labelsize=15)
ax4.set_xlabel(r'Valores de $k$', fontsize=20)
ax4.set_ylabel(r'$CC(k)$', fontsize=20)
ax4.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)

fig4.tight_layout()
plt.savefig('CCcurvas.png', dpi=300)

plt.show()



fig5, ax5 = plt.subplots()

ax5.plot(k,BC[::,0],label='0%')
ax5.plot(k,BC[::,1],label='5%')
ax5.plot(k,BC[::,2],label='10%')
ax5.plot(k,BC[::,3],label='15%')
ax5.plot(k,BC[::,4],label='20%')
plt.legend(loc='upper right');
ax5.set_xlim([1, 20])
ax5.tick_params(labelsize=15)
ax5.set_xlabel(r'Valores de $k$', fontsize=20)
ax5.set_ylabel(r'$BC(k)$', fontsize=20)
ax5.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)

fig5.tight_layout()
plt.savefig('BCcurvas.png', dpi=300)

plt.show()









