# -*- coding: utf-8 -*-
"""
Created on Tue May 31 09:09:46 2022

@author: jgrel
"""

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

L = pd.read_csv("boxL.txt", sep=",",header=None)

S = pd.read_csv("boxS.txt", sep=",",header=None)

Mo = pd.read_csv("boxMo.txt", sep=",",header=None)

CC = pd.read_csv("boxCA.txt", sep=",",header=None)

BC = pd.read_csv("boxBC.txt", sep=",",header=None)



QGL = pd.read_csv("QGL.txt", sep=",",header=None)

QGL=QGL.to_numpy()

QGS = pd.read_csv("QGS.txt", sep=",",header=None)

QGS=QGS.to_numpy()

QGMo = pd.read_csv("QGMo.txt", sep=",",header=None)

QGMo=QGMo.to_numpy()

QGCC = pd.read_csv("QGCA.txt", sep=",",header=None)

QGCC=QGCC.to_numpy()

QGBC = pd.read_csv("QGBC.txt", sep=",",header=None)

QGBC=QGBC.to_numpy()

k = np.linspace(1,20,20)



fig1, ax1 = plt.subplots()

bplots1 = plt.boxplot(L,showfliers=False,patch_artist = True)
ax1.tick_params(labelsize=15)
ax1.set_xlabel(r'$k$', fontsize=20)
ax1.set_ylabel(r'$L(k)$', fontsize=20)
ax1.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)




# Cor do corpo do boxplot
for i, bplot in enumerate(bplots1['boxes']):
    bplot.set(color='g', linewidth=2)
    bplot.set(facecolor = 'lightgreen')

# Linhas de contorno
for whisker in bplots1['whiskers']:
    whisker.set(color='g', linewidth=2)

for cap in bplots1['caps']:
    cap.set(color='g', linewidth=2)

for median in bplots1['medians']:
    median.set(color='g', linewidth=2)


#fig1.set_facecolor('white')

ax1.set_facecolor("white")
plt.setp(ax1.spines.values(), color='k')


plt.plot(k,QGL[0,::],'r--.',linewidth=1, label="QG original")



for i, tick in enumerate(ax1.xaxis.get_ticklabels()):
    if i % 2 != 0:
        tick.set_visible(False)
# for i, tick in enumerate(ax1.yaxis.get_ticklabels()):
#     if i % 2 != 0:
#         tick.set_visible(False)        


fig1.tight_layout()
plt.savefig('lorenzcurvasL.png', dpi=300)
plt.show()


fig2, ax2 = plt.subplots()

bplots2 = plt.boxplot(S,showfliers=False,patch_artist = True)
ax2.tick_params(labelsize=15)
ax2.set_xlabel(r'$k$', fontsize=20)
ax2.set_ylabel(r'$\Delta(k)$', fontsize=20)
ax2.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)


# Cor do corpo do boxplot
for i, bplot in enumerate(bplots2['boxes']):
    bplot.set(color='g', linewidth=2)
    bplot.set(facecolor = 'lightgreen')

# Linhas de contorno
for whisker in bplots2['whiskers']:
    whisker.set(color='g', linewidth=2)

for cap in bplots2['caps']:
    cap.set(color='g', linewidth=2)

for median in bplots2['medians']:
    median.set(color='g', linewidth=2)

ax2.set_facecolor("white")
plt.setp(ax2.spines.values(), color='k')



plt.plot(k,QGS[0,::],'r--.',linewidth=1, label="QG original")

for i, tick in enumerate(ax2.xaxis.get_ticklabels()):
    if i % 2 != 0:
        tick.set_visible(False)

fig2.tight_layout()
plt.savefig('lorenzcurvasS.png', dpi=300)
plt.show()

fig3, ax3 = plt.subplots()

bplots3 = plt.boxplot(Mo,showfliers=False,patch_artist = True)
ax3.tick_params(labelsize=15)
ax3.set_xlabel(r'$k$', fontsize=20)
ax3.set_ylabel(r'$M_o$(k)', fontsize=20)
ax3.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)

# Cor do corpo do boxplot
for i, bplot in enumerate(bplots3['boxes']):
    bplot.set(color='g', linewidth=2)
    bplot.set(facecolor = 'lightgreen')

# Linhas de contorno
for whisker in bplots3['whiskers']:
    whisker.set(color='g', linewidth=2)

for cap in bplots3['caps']:
    cap.set(color='g', linewidth=2)

for median in bplots3['medians']:
    median.set(color='g', linewidth=2)


ax3.set_facecolor("white")
plt.setp(ax3.spines.values(), color='k')


plt.plot(k,QGMo[0,::],'r--.',linewidth=1, label="QG original")


for i, tick in enumerate(ax3.xaxis.get_ticklabels()):
    if i % 2 != 0:
        tick.set_visible(False)

fig3.tight_layout()
plt.savefig('lorenzcurvasMo.png', dpi=300)
plt.show()

fig4,ax4= plt.subplots()

bplots4 = plt.boxplot(CC,showfliers=False,patch_artist = True)
ax4.tick_params(labelsize=15)
ax4.set_xlabel(r'$k$', fontsize=20)
ax4.set_ylabel(r'$CC(k)$', fontsize=20)
ax4.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)




# Cor do corpo do boxplot
for i, bplot in enumerate(bplots4['boxes']):
    bplot.set(color='g', linewidth=2)
    bplot.set(facecolor = 'lightgreen')

# Linhas de contorno
for whisker in bplots4['whiskers']:
    whisker.set(color='g', linewidth=2)

for cap in bplots4['caps']:
    cap.set(color='g', linewidth=2)

for median in bplots4['medians']:
    median.set(color='g', linewidth=2)

ax4.set_facecolor("white")
plt.setp(ax4.spines.values(), color='k')


plt.plot(k,QGCC[0,::],'r--.',linewidth=1, label="QG original")


for i, tick in enumerate(ax4.xaxis.get_ticklabels()):
    if i % 2 != 0:
        tick.set_visible(False)

fig4.tight_layout()
plt.savefig('lorenzcurvasCC.png', dpi=300)
plt.show()

fig5, ax5 = plt.subplots()

bplots5 = plt.boxplot(BC,showfliers=False,patch_artist = True)
ax5.tick_params(labelsize=15)
ax5.set_xlabel(r'$k$', fontsize=20)
ax5.set_ylabel(r'$BC(k)$', fontsize=20)
ax5.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)



# Cor do corpo do boxplot
for i, bplot in enumerate(bplots5['boxes']):
    bplot.set(color='g', linewidth=2)
    bplot.set(facecolor = 'lightgreen')

# Linhas de contorno
for whisker in bplots5['whiskers']:
    whisker.set(color='g', linewidth=2)

for cap in bplots5['caps']:
    cap.set(color='g', linewidth=2)

for median in bplots5['medians']:
    median.set(color='g', linewidth=2)


ax5.set_facecolor("white")
plt.setp(ax5.spines.values(), color='k')

plt.plot(k,QGBC[0,::],'r--.',linewidth=1, label="QG original")

for i, tick in enumerate(ax5.xaxis.get_ticklabels()):
    if i % 2 != 0:
        tick.set_visible(False)

fig5.tight_layout()
plt.savefig('lorenzcurvasBC.png', dpi=300)
plt.show()