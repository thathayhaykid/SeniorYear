# Thermal Systems Design
# By: Haythem Mansour

# Import Libraries
import numpy as np

# Define f(vdot)
def funcVdot(Vdot, Ti, Tf, Tin, Qdot, density, Cp, Vt, t):
    ''' This function is a function for fVdot'''

    Tss = Tin + (Qdot / (Vdot * density * Cp))
    delTf = Tf - Tss
    delTi = Ti - Tss

    tau = Vt / Vdot

    fVdot = np.log(delTf / delTi) + (t / tau)
    return fVdot

def newtonMethod(function, initialGuess, ):
    ''' This performs the newton method'''
    eps = 1
    while eps > 1e-6:
        
