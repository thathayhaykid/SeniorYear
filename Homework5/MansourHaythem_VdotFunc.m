function FVdot = MansourHaythem_VdotFunc(Vdot, argList)
    % This is the colebrook function to attempt learning how to use the
    % NewtonMethod!
    
    % Define argument list 
    Tf = argList(1);
    Ti = argList(2);
    Tin = argList(3);
    Qdot = argList(4);
    Density = argList(5);
    Cp = argList(6);
    Vt = argList(7);
    t = argList(8);
    
    % Define our Vdot equation
    Tss = Tin + (Qdot / (Vdot * Density * Cp * 8.02083));
    delTf = Tf - Tss;
    delTi = Ti - Tss;
    Tau = Vt / Vdot;
    
    % Get the function of Vdot
    FVdot = log(delTf / delTi) + (t / Tau);
end