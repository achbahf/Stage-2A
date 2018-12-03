function [R,x,y,z]=pores(phi,a,b,depth,rm)
% i is the number of pores
% a,b and depth are the dimensions of our chrome layer
%this function gives us the radius "r" of each pore and its coordinates
(x,y,z)
%generation of random spheres inside a cuboid %
i=0;
%phi is the porosity of the chrome layer
%a and b are fixed dimensions and depth is a variable one, it varies between
100μm and 300μm
%rm is the mean radius that will gives us a hypothetical total number of pores
%this function guives us the total number of iterations/pores
%assuming that all defects have the same diameter
Vt=a*b*depth; %volume expression mm^3
v=phi*Vt;
x=(3*v)/(4*pi*(rm^3));
     while i<=x
        i=i+1;
end
n = rand(i, 3) * diag([a, b, depth]);
r=abs(normrnd(0.005,0.05,[1 i])); %mu=0,005 mm ==>5μm
x=n(:,1);
y=n(:,2);
z=n(:,3);
R=r'; % to have the same size and to be able to concatenate the 4 matrices
End
function i = numofpores( phi,a,b,depth,rm )
%phi is the porosity of the chrome layer
%a and b are fixed dimensions and depth is a variable one, it varies between
100μm and 300μm
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