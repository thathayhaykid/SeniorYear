% Thermal Systems Design - Homework 5 - Question 1
% Using the Newton Method, Solve for Vdot

Re = 60000;
Roughness = 0.0017;

ff = 0.02;

addff = 0.000001;

eps = 1;

while eps > 1e-6
    
    oldff = ff;
    
    fcnff = MansourHaythem_ColebrookFunc(ff, Re, Roughness);
    
    fcnffaddff = MansourHaythem_ColebrookFunc(ff+addff, Re, Roughness);
    
    slope = (fcnffaddff - fcnff) / addff;
    
    delff = -fcnff / slope;
    ff = oldff + delff;
    
    eps = abs(delff/oldff);
    
end


ff

