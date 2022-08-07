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

L = pd.read_csv("L.txt", sep=",",header=None)

S = pd.read_csv("S.txt", sep=",",header=None)

Mo = pd.read_csv("Mo.txt", sep=",",header=None)

CC = pd.read_csv("CC.txt", sep=",",header=None)

BC = pd.read_csv("BC.txt", sep=",",header=None)

k=[1,2,3,4]

l1 = [22.13,22.13,22.13,22.13]

s1 = [0.3902,0.3902,0.3902,0.3902]

mo1 = [0.7470,0.7470,0.7470,0.7470]

cc1 = [0.4087,0.4087,0.4087,0.4087]

bc1 = [63.75,63.75,63.75,63.75]


fig1, ax1 = plt.subplots()

bplots1 = plt.boxplot(L,showfliers=False,labels=['5%', '10%', '15%','20%'],patch_artist = True)
ax1.plot(k,l1,'ro',linewidth=7, label="QG original")
legend_elements = [Line2D([0], [0],marker='o' ,color='w',  label='Método QG',markerfacecolor='r',markersize=10),
                   Patch(facecolor='lightgreen', edgecolor='grey', linewidth=1.5,
                         label='Método proposto')]
ax1.legend(handles=legend_elements,facecolor='white')
ax1.tick_params(labelsize=15)
ax1.set_xlabel(r'Incertezas $\delta$', fontsize=20)
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
plt.savefig('L.png', dpi=300)
plt.show()


fig2, ax2 = plt.subplots()

bplots2 = plt.boxplot(S,showfliers=False,labels=['5%', '10%', '15%','20%'],patch_artist = True)
plt.plot(k,s1,'ro',linewidth=7, label="QG original")
legend_elements = [Line2D([0], [0],marker='o' ,color='w',  label='Método QG',markerfacecolor='r',markersize=10),
                   Patch(facecolor='lightgreen', edgecolor='grey', linewidth=1.5,
                         label='Método proposto')]
ax2.legend(handles=legend_elements,facecolor='white')
ax2.tick_params(labelsize=15)
ax2.set_xlabel(r'Incertezas $\delta$', fontsize=20)
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
plt.savefig('S.png', dpi=300)
plt.show()

fig3, ax3 = plt.subplots()

bplots3 = plt.boxplot(Mo,showfliers=False,labels=['5%', '10%', '15%','20%'],patch_artist = True)
plt.plot(k,mo1,'ro',linewidth=7, label="QG original")
legend_elements = [Line2D([0], [0],marker='o' ,color='w',  label='Método QG',markerfacecolor='r',markersize=10),
                   Patch(facecolor='lightgreen', edgecolor='grey', linewidth=1.5,
                         label='Método proposto')]
ax3.legend(handles=legend_elements,facecolor='white')
ax3.tick_params(labelsize=15)
ax3.set_xlabel(r'Incertezas $\delta$', fontsize=20)
ax3.set_ylabel(r'$M_o(k)$', fontsize=20)
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
plt.savefig('Mo.png', dpi=300)
plt.show()

fig4,ax4= plt.subplots()

bplots4 = plt.boxplot(CC,showfliers=False,labels=['5%', '10%', '15%','20%'],patch_artist = True)
plt.plot(k,cc1,'ro',linewidth=7, label="QG original")
legend_elements = [Line2D([0], [0],marker='o' ,color='w',  label='Método QG',markerfacecolor='r',markersize=10),
                   Patch(facecolor='lightgreen', edgecolor='grey', linewidth=1.5,
                         label='Método proposto')]
ax4.legend(handles=legend_elements,facecolor='white')
ax4.tick_params(labelsize=15)
ax4.set_xlabel(r'Incertezas $\delta$', fontsize=20)
ax4.set_ylabel(r'$CC(k)$', fontsize=20)
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
plt.savefig('CC.png', dpi=300)
plt.show()

fig5, ax5 = plt.subplots()

bplots5 = plt.boxplot(BC,showfliers=False,labels=['5%', '10%', '15%','20%'],patch_artist = True)
plt.plot(k,bc1,'ro',linewidth=7, label="QG original")
legend_elements = [Line2D([0], [0],marker='o' ,color='w',  label='Método QG',markerfacecolor='r',markersize=10),
                   Patch(facecolor='lightgreen', edgecolor='grey', linewidth=1.5,
                         label='Método proposto')]
ax5.legend(handles=legend_elements,facecolor='white')
ax5.tick_params(labelsize=15)
ax5.set_xlabel(r'Incertezas $\delta$', fontsize=20)
ax5.set_ylabel(r'$BC(k)$', fontsize=20)
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
plt.savefig('BC.png', dpi=300)
plt.show()