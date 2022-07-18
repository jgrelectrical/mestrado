# -*- coding: utf-8 -*-
"""
Created on Sun Jun  5 21:28:58 2022

@author: jgrel
"""

import matplotlib.pyplot as plt
import numpy as np

fig, ax = plt.subplots()
#ax.plot(range(20))
ax.axvspan(0, 2.2, alpha=0.5, color='red')
ax.axvspan(2.2, 3.4, alpha=0.5, color='green')
ax.axvspan(3.4, 5.2, alpha=0.5, color='blue')

ax.set_xlim([1, 4.4])

ax.set_ylim([0.3, 0.76])




p1 = np.array([2,3])

p2 = np.array([2.72,4.08])

y1 = np.array([0.6,0.6])

y2 = np.array([0.4,0.4])

ax.plot(p1,y1,'k-x',alpha=1,linewidth=8)

ax.plot(p2,y2,'k-x',alpha=1,linewidth=8)



for x,y in zip(p1,y1):

    label = "{:.1f}".format(x)

    plt.annotate(label, # this is the text
                 (x,y), # these are the coordinates to position the label
                 textcoords="offset points", # how to position the text
                 xytext=(0,10), # distance from text to points (x,y)
                 ha='center',# horizontal alignment can be left, right or center
                 fontsize = 16) 
for x,y in zip(p2,y2):

    label = "{:.2f}".format(x)

    plt.annotate(label, # this is the text
                 (x,y), # these are the coordinates to position the label
                 textcoords="offset points", # how to position the text
                 xytext=(0,10), # distance from text to points (x,y)
                 ha='center',# horizontal alignment can be left, right or center
                 fontsize = 16,
                 color = 'k') 

plt.annotate('Quantil 1', xy = (1.2, 0.71), 
             fontsize = 16, xytext = (1.2, 0.71), 
             arrowprops = dict(facecolor = 'r'),
             color = 'k')

plt.annotate('Quantil 2', xy = (2.4, 0.71), 
             fontsize = 16, xytext = (2.4, 0.71), 
             arrowprops = dict(facecolor = 'g'),
             color = 'k')


plt.annotate('Quantil 3', xy = (3.5, 0.71), 
             fontsize = 16, xytext = (3.5, 0.71), 
             arrowprops = dict(facecolor = 'b'),
             color = 'k')


plt.text(2.2, 0.56, '$I(2) = [2,3]$', fontsize = 13)

plt.text(3.0, 0.36, '$I(3) = [2.72,4.08]$', fontsize = 13, color='k')


plt.axis('off')

fig.tight_layout()
plt.savefig('intervalos2.png', dpi=300, bbox_inches='tight')

plt.show()