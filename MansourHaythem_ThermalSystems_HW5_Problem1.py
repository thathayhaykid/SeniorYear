# Thermal Systems Design
# By: Haythem Mansour

# Import Libraries
import numpy as np
from numpy import log
from matplotlib import pyplot as plt

# Define f(vdot)
def funcVdot(Vdot, argList):
    ''' This function is a function for fVdot '''
    Ti, Tf, Tin, Qdot, density, Cp, Vt, t = argList[0], argList[1], argList[2], argList[3], argList[4], argList[5], argList[6], argList[7]

    Tss = Tin + (Qdot / (Vdot * density * Cp))
    delTf = Tf - Tss
    delTi = Ti - Tss

    tau = Vt / Vdot
    
    fVdot = log(delTf / delTi) + (t / tau)
    return fVdot

def newtonMethod(function, argList, initialGuess):
    ''' This performs the newton method'''

    addInc = 0.0000001

    eps = 1
    while eps > 1e-6:
        oldVal = initialGuess
        funcVal = function(initialGuess, argList)
        funcValwithInc = function((initialGuess+addInc), argList)
        print('old Func Val', funcVal)
        print('new Func Val', funcValwithInc)
        slope = (funcValwithInc - funcVal) / addInc

        delFunc = -funcVal / slope
        initialGuess = initialGuess + delFunc

        eps = np.abs(delFunc/oldVal)

    return initialGuess

if __name__ == '__main__':
    #Define Givens
    Tf = 105 #degrees F
    Ti = 110 #degrees F
    Tin = 70 #degrees F
    Qdot = 12000 #Btu / hr
    density = 61.991 #lbm/ft^3
    Cp = 0.99893 #btu / lbm * R
    Vt = 9 #Gallons
    t = 3 #minutes

    #Convert time and total volume to appropriate units
    Vt = Vt * (0.0353147 / 0.264172) #ft^3
    t = t / 60 #hours

    argList = [Ti, Tf, Tin, Qdot, density, Cp, Vt, t]
    vDot = newtonMethod(funcVdot, argList,100)

    #vdotVals = np.arange(0, 200, .1)
    #values = np.array([funcVdot(vdot, argList) for vdot in vdotVals])
    #plt.plot(vdotVals, values)
    #plt.show()

    print('Vdot: ', vDot, 'ft^3 / hr')


