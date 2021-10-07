function fbob = MansourHaythem_ColebrookFunc(ffactor, reynolds, roughness)
% This is the colebrook function to attempt learning how to use the
% NewtonMethod!

fbob = (1 / sqrt(ffactor)) + (2*log10((roughness/3.7) + (2.51/(reynolds*sqrt(ffactor)))));

end