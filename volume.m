
function [v,Dt]=volume(r,i,a,b,depth,phi)
%this function gives us the volume of each pore the total valume of all
%pores and the error of the difference between the phi we predicted and the
%real phi
%"i" is the numver of pores and "r" is the radius of each pore
%a,b and depth are the dimensions of our chrome layer and phi is the
%hypothetical porosity
v=i*[];
V=0;
Vt=a*b*depth; %total volume of the crome layer mm^3
for k=1:i
     v(k)=(4*pi*(r(k)^3))/3; %te volume of each pores
     V=V+v(k); %the total volume of defects
end
Phi=(V/Vt); %the real porosity
Dt=(Phi-phi)*100; %the percentage of the error between the real prorosity and
the hypothetical porosity
end