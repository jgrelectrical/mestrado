# -*- coding: utf-8 -*-
"""
Created on Thu Jul 28 02:17:32 2022

@author: jgrel
"""

# -*- coding: utf-8 -*-
"""
Created on Wed Jul 27 23:30:58 2022

@author: jgrel
"""

import numpy as np
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D



# Lorenz paramters and initial conditions.
sigma, beta, rho = 16, 4, 45.92
u0, v0, w0 = 1, 0.5, 0.9

# Maximum time point and total number of time points.
tmax, n = 100, 10000

def lorenz1(t, X, sigma, beta, rho):
    """The Lorenz equations."""
    u, v, w = X
    up = -sigma*(u - v)
    vp = rho*u - v - u*w
    wp = -beta*w + u*v
    return up, vp, wp

def lorenz2(t, X, sigma, beta, rho):
    """The Lorenz equations."""
    u, v, w = X
    up = -sigma*(u - v)
    vp = u*(rho-w) - v
    wp = -beta*w + u*v
    return up, vp, wp

# Integrate the Lorenz equations.
soln = solve_ivp(lorenz1, (0, tmax), (u0, v0, w0), args=(sigma, beta, rho),
                 dense_output=True)
# Interpolate solution onto the time grid, t.
t1 = np.linspace(0, tmax, n)
x1, y1, z1 = soln.sol(t1)



# Integrate the Lorenz equations.
soln = solve_ivp(lorenz2, (0, tmax), (u0, v0, w0), args=(sigma, beta, rho),
                 dense_output=True)
# Interpolate solution onto the time grid, t.
t2 = np.linspace(0, tmax, n)
x2, y2, z2 = soln.sol(t2)




start=0
LBE=abs(y1[start:n]-y2[start:n])/2
graf_LBE=np.log(LBE)


vec1=900
vec2=2500
num1=vec2-vec1
vecN=np.linspace(t1[vec1],t1[vec2],num=num1)

LLE=np.polyfit(vecN,graf_LBE[vec1:vec2],1)
LLE1=LLE[0]
LLE2=LLE[1]


#%%

plt.figure(figsize=(8,4))
plt.plot(t1,y1,color='black',linewidth=1)
plt.plot(t1,y2,color='g',linewidth=1,alpha=1)
plt.axis([40, 80, -26, 26])
plt.yticks(fontsize=16)
plt.xticks(fontsize=16)
plt.xlabel('N',fontsize=16)
plt.ylabel('F(x$_n$) , G(x$_n$)',fontsize=16)
plt.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)
plt.tight_layout()
plt.savefig('lorenzEX.pdf', dpi=300)


#%%
#Numpy
plt.figure(figsize=(8, 6))
plt.plot(t1,graf_LBE,color='k',linewidth=4,marker=",",alpha=0.9)
# plt.axvline(x=0, color='black',linestyle="solid")
# plt.axhline(y=-17, color='black',linestyle="solid")
#plt.vlines(0, 4000, -20, linestyles ="solid", colors ="k")
# plt.axis([0, 100, -17, 1])
plt.yticks(fontsize=16)
plt.xticks(fontsize=16)
plt.xlabel('N',fontsize=17)
plt.ylabel('log$_{2}|\delta_{α,n}|$',fontsize=17)
plt.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)
# plt.box(False)
plt.savefig('mapalogLBE.png', dpi=300)



#%%

# Numpy
plt.figure(figsize=(8, 6))
plt.plot(t1,graf_LBE,color='black',linewidth=2,marker=".",alpha=0.3)
plt.plot(vecN,np.polyval(LLE,vecN),color='g',linewidth=4.3)
# plt.axvline(x=0, color='black',linestyle="solid")
# plt.axhline(y=-17, color='black',linestyle="solid")
plt.text(25, -9, '%0.3fn'%LLE1,fontsize=17 )
plt.text(40, -9, '%0.3f'%LLE2 ,fontsize=17 )
#plt.vlines(0, 4000, -20, linestyles ="solid", colors ="k")
# plt.axis([0, 160, -17, 1])
plt.yticks(fontsize=16)
plt.xticks(fontsize=16)
plt.xlabel('N',fontsize=17)
plt.ylabel('log$_{2}|\delta_{α,n}|$',fontsize=17)
plt.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)
# plt.box(False)
plt.savefig('mapalogLLE.png', dpi=300)









