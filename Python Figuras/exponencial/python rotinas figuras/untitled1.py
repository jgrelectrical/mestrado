# -*- coding: utf-8 -*-
"""
Created on Mon May 23 05:49:33 2022

@author: jgrel
"""
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.patches import Patch
from matplotlib.lines import Line2D

L = pd.read_csv("boxL.txt", sep=",",header=None)

L = L.to_numpy()

L = L[0,:]

l1 = 184.85

S = pd.read_csv("boxS.txt", sep=",",header=None)

S = S.to_numpy()

S = S[0,:]

s1 = 0.3132

Mo = pd.read_csv("boxMo.txt", sep=",",header=None)

Mo = Mo.to_numpy()

Mo = Mo[0,:]

mo1 = 0.7976

CC = pd.read_csv("boxCA.txt", sep=",",header=None)

CC = CC.to_numpy()

CC = CC[0,:]

cc1 = 0.1715

BC = pd.read_csv("boxBC.txt", sep=",",header=None)

BC = BC.to_numpy()

BC = BC[0,:]

bc1 = 244.7


fig1, ax1 = plt.subplots()



bplots1 = plt.boxplot(L,showfliers=False,patch_artist = True,labels=['1'])
plt.plot(1,l1,'ro',linewidth=7, label="QG original")
legend_elements = [Line2D([0], [0],marker='o' ,color='w',  label='Método QG',markerfacecolor='r',markersize=10),
                   Patch(facecolor='lightgreen', edgecolor='grey', linewidth=1.5,
                         label='Método proposto')]
ax1.legend(handles=legend_elements,facecolor='white')
ax1.tick_params(labelsize=15)
ax1.set_xlabel(r'$k$', fontsize=20)
ax1.set_ylabel(r'$L(k)$', fontsize=20)
ax1.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)


# Cor do corpo do boxplot
for i, bplot in enumerate(bplots1['boxes']):
    bplot.set(color='gray', linewidth=2)
    bplot.set(facecolor = 'lightgreen')

# Linhas de contorno
for whisker in bplots1['whiskers']:
    whisker.set(color='gray', linewidth=2)

for cap in bplots1['caps']:
    cap.set(color='gray', linewidth=2)

for median in bplots1['medians']:
    median.set(color='gray', linewidth=2)


#fig1.set_facecolor('white')

ax1.set_facecolor("white")
plt.setp(ax1.spines.values(), color='k')


fig1.tight_layout()
plt.savefig('Llorenz.png', dpi=300)
plt.show()


fig2, ax2 = plt.subplots()

bplots2 = plt.boxplot(S,showfliers=False,patch_artist = True,labels=['1'])

plt.plot(1,s1,'ro',linewidth=7, label="QG original")
legend_elements = [Line2D([0], [0],marker='o' ,color='w',  label='Método QG',markerfacecolor='r',markersize=10),
                   Patch(facecolor='lightgreen', edgecolor='grey', linewidth=1.5,
                         label='Método proposto')]
ax2.legend(handles=legend_elements,facecolor='white')



ax2.tick_params(labelsize=15)
ax2.set_xlabel(r'$k$', fontsize=20)
ax2.set_ylabel(r'$\Delta(k)$', fontsize=20)
ax2.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)


# Cor do corpo do boxplot
for i, bplot in enumerate(bplots2['boxes']):
    bplot.set(color='gray', linewidth=2)
    bplot.set(facecolor = 'lightgreen')

# Linhas de contorno
for whisker in bplots2['whiskers']:
    whisker.set(color='gray', linewidth=2)

for cap in bplots2['caps']:
    cap.set(color='gray', linewidth=2)

for median in bplots2['medians']:
    median.set(color='gray', linewidth=2)

ax2.set_facecolor("white")
plt.setp(ax2.spines.values(), color='k')

fig2.tight_layout()
plt.savefig('Slorenz.png', dpi=300)
plt.show()

fig3, ax3 = plt.subplots()

bplots3 = plt.boxplot(Mo,showfliers=False,patch_artist = True,labels=['1'])

plt.plot(1,mo1,'ro',linewidth=7, label="QG original")
legend_elements = [Line2D([0], [0],marker='o' ,color='w',  label='Método QG',markerfacecolor='r',markersize=10),
                   Patch(facecolor='lightgreen', edgecolor='grey', linewidth=1.5,
                         label='Método proposto')]
ax3.legend(handles=legend_elements,facecolor='white')

ax3.tick_params(labelsize=15)
ax3.set_xlabel(r'$k$', fontsize=20)
ax3.set_ylabel(r'$M_o$(k)', fontsize=20)
ax3.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)

# Cor do corpo do boxplot
for i, bplot in enumerate(bplots3['boxes']):
    bplot.set(color='gray', linewidth=2)
    bplot.set(facecolor = 'lightgreen')

# Linhas de contorno
for whisker in bplots3['whiskers']:
    whisker.set(color='gray', linewidth=2)

for cap in bplots3['caps']:
    cap.set(color='gray', linewidth=2)

for median in bplots3['medians']:
    median.set(color='gray', linewidth=2)


ax3.set_facecolor("white")
plt.setp(ax3.spines.values(), color='k')

fig3.tight_layout()
plt.savefig('Molorenz.png', dpi=300)
plt.show()

fig4,ax4= plt.subplots()

bplots4 = plt.boxplot(CC,showfliers=False,patch_artist = True,labels=['1'])

plt.plot(1,cc1,'ro',linewidth=7, label="QG original")
ax4.legend(handles=legend_elements,facecolor='white')

ax4.tick_params(labelsize=15)
ax4.set_xlabel(r'$k$', fontsize=20)
ax4.set_ylabel(r'CC(k)', fontsize=20)
ax4.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)




# Cor do corpo do boxplot
for i, bplot in enumerate(bplots4['boxes']):
    bplot.set(color='gray', linewidth=2)
    bplot.set(facecolor = 'lightgreen')

# Linhas de contorno
for whisker in bplots4['whiskers']:
    whisker.set(color='gray', linewidth=2)

for cap in bplots4['caps']:
    cap.set(color='gray', linewidth=2)

for median in bplots4['medians']:
    median.set(color='gray', linewidth=2)

ax4.set_facecolor("white")
plt.setp(ax4.spines.values(), color='k')

fig4.tight_layout()
plt.savefig('CClorenz.png', dpi=300)
plt.show()

fig5, ax5 = plt.subplots()

bplots5 = plt.boxplot(BC,showfliers=False,patch_artist = True,labels=['1'])

plt.plot(1,bc1,'ro',linewidth=7, label="QG original")
legend_elements = [Line2D([0], [0],marker='o' ,color='w',  label='Método QG',markerfacecolor='r',markersize=10),
                   Patch(facecolor='lightgreen', edgecolor='grey', linewidth=1.5,
                         label='Método proposto')]
ax5.legend(handles=legend_elements,facecolor='white')


ax5.tick_params(labelsize=15)
ax5.set_xlabel(r'$k$', fontsize=20)
ax5.set_ylabel(r'BC(k)', fontsize=20)
ax5.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)



# Cor do corpo do boxplot
for i, bplot in enumerate(bplots5['boxes']):
    bplot.set(color='gray', linewidth=2)
    bplot.set(facecolor = 'lightgreen')

# Linhas de contorno
for whisker in bplots5['whiskers']:
    whisker.set(color='gray', linewidth=2)

for cap in bplots5['caps']:
    cap.set(color='gray', linewidth=2)

for median in bplots5['medians']:
    median.set(color='gray', linewidth=2)


ax5.set_facecolor("white")
plt.setp(ax5.spines.values(), color='k')

fig5.tight_layout()
plt.savefig('BClorenz.png', dpi=300)
plt.show()