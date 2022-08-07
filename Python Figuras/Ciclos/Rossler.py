# -*- coding: utf-8 -*-
"""
Created on Thu Jul 28 06:06:28 2022

@author: jgrel
"""

import numpy as np
import matplotlib.pyplot as plt
a = 0.2
b = 0.2
c = 5.7
t = 0
tf = 200
h = 0.1
def derivative(r,t):
    x = r[0]
    y = r[1]
    z = r[2]
    return np.array([- y - z, x + a * y, b + z * (x - c)])


time = np.array([])
x = np.array([])
y = np.array([])
z = np.array([])
r = np.array([0.1, 0.1, 0.1])

while (t <= tf ):
    
        time = np.append(time, t)
        z = np.append(z, r[2])
        y = np.append(y, r[1])
        x = np.append(x, r[0])
        
        k1 = h*derivative(r,t)
        k2 = h*derivative(r+k1/2,t+h/2)
        k3 = h*derivative(r+k2/2,t+h/2)
        k4 = h*derivative(r+k3,t+h)
        r += (k1+2*k2+2*k3+k4)/6
        
        t = t + h
fig1,ax1 = plt.subplots(figsize = (15, 5))

ax1.plot(time,x)

ax1.set_ylabel(r'$x$', fontsize=20)
ax1.set_xlabel(r'$t$', fontsize=20)

fig1.tight_layout()
plt.show()





import matplotlib.pyplot as plt
import pandas as pd
from scipy.signal import argrelextrema

# Generate a noisy AR(1) sample


xs = []
for r in x:
    xs.append(r)
df = pd.DataFrame(xs, columns=['data'])

n = 5  # number of points to be checked before and after

# Find local peaks

df['min'] = df.iloc[argrelextrema(df.data.values, np.less_equal,
                    order=n)[0]]['data']
df['max'] = df.iloc[argrelextrema(df.data.values, np.greater_equal,
                    order=n)[0]]['data']

# Plot results

fig2,ax2 = plt.subplots(figsize = (15, 5))

# ax2.plot(df.index, df['data'],c='g',linewidth=2)


ax2.plot(time, df['data'],c='g',linewidth=2)
ax2.scatter(time, df['min'], c='r', marker='o',linewidth=4)
ax2.set_ylabel(r'$x$', fontsize=20)
ax2.set_xlabel(r'$t$', fontsize=20)



#ax2.scatter(df.index, df['max'], c='r')


plt.savefig('Rossler.pdf', dpi=300)

plt.show()




lista = list(df[df['min'].notnull()].stack().index)

# lista = np.argwhere(df[df['min'].notnull()].values).tolist()

localizar=[]

c = 0

for linha in lista:
    
    localizar.append(linha)
    c=c+1

# d=0.3


