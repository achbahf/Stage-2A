function i = numofpores( phi,a,b,depth,rm )
%phi is the porosity of the chrome layer
%a and b are fixed dimensions and depth is a variable one, it varies between
%100μm and 300μm
%rm is the mean radius that will gives us a hypothetical total number of pores
%this function gives us the total number of iterations/pores
%assuming that all defects have the same diameter
i=0;
Vt=a*b*depth; %volume expression mm^3
v=phi*Vt;
x=(3*v)/(4*pi*(rm^3));
     while i<=x
        i=i+1;
end end