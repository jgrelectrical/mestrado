# -*- coding: utf-8 -*-
"""
Created on Sat Jun  4 18:36:30 2022

@author: jgrel
"""

import numpy as np
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

DPI =100

# Lorenz paramters and initial conditions.
sigma, beta, rho = 10, 2.667, 28
u0, v0, w0 = 0, 0.1, 0.1

# Maximum time point and total number of time points.
tmax, n = 42, 4200

def lorenz(t, X, sigma, beta, rho):
    """The Lorenz equations."""
    u, v, w = X
    up = -sigma*(u - v)
    vp = rho*u - v - u*w
    wp = -beta*w + u*v
    return up, vp, wp

# Integrate the Lorenz equations.
soln = solve_ivp(lorenz, (0, tmax), (u0, v0, w0), args=(sigma, beta, rho),
                 dense_output=True)
# Interpolate solution onto the time grid, t.
t = np.linspace(0, tmax, n)
x, y, z = soln.sol(t)

# Plot the Lorenz attractor using a Matplotlib 3D projection.
fig = plt.figure(facecolor='w')




ax = fig.gca(projection='3d')
ax.set_facecolor('w')
fig.subplots_adjust(left=0, right=1, bottom=0, top=1)



# Make the line multi-coloured by plotting it in segments of length s which
# change in colour across the whole time series.
s = 10
cmap = plt.cm.winter
for i in range(0,n-s,s):
    ax.plot(x[i:i+s+1], y[i:i+s+1], z[i:i+s+1], color=cmap(i/n), alpha=0.7)

# Remove all the axis clutter, leaving just the curve.
ax.set_axis_off()

ax.set_xlim(-15, 15)
ax.set_ylim(-20, 23)
ax.set_zlim(17, 37)
#fig.tight_layout()
plt.savefig('lorenz.png', dpi=DPI)
plt.show()