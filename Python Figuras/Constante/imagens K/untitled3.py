# -*- coding: utf-8 -*-
"""
Created on Thu May 26 07:19:52 2022

@author: jgrel
"""

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

k = np.linspace(1, 20,20)


T = pd.read_csv("Jerk_circ.txt", sep=",",header=None)

T = T.to_numpy()
T = T[0:4999:5]