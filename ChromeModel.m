%% Chrome layer Modelisation 
%Chrome layer modelization is not a simple task for that reason the following code will only
%give us a chrome layer with spherical pores.



a=10; % mm
b=10; % mm
depth=0.3; %mm
phi=0.02; %porosity
rm=0.005; %mm ==> 5 μ
%generatin of random spheres inside a cuboid %
e=numofpores( phi,a,b,depth,rm );
[r,x,y,z]=pores(phi,a,b,depth,rm);
M=[r,x,y,z]; % The matrix m gives us the informnations about each pore
[v,Dt]=volume(r,e,a,b,depth,phi);
%%different plots of volume radius and coordination
%chrome layer
scatter3(x,y,z,r,'fill','r')
title('Example of a chrome layer filled with spheric defects and pores')
xlabel('a "mm"')
ylabel('b "mm"')
zlabel('Depth "mm"')
%volume
figure
plot(v)
title('the volume "v" of each sphere inside the cuboid')
xlabel('Number t of pores')
ylabel('volume of the pore "mm^3"')
%radius
norm=normpdf(r,0,1);
figure;
plot(r,norm,'.')
title('normal distribution of the radius "r" of each sphere')
%x,y,z
figure
subplot(3,1,1),histogram(x) title('histogram of the axis x') subplot(3,1,2),histogram(y) title('histogram of the axis y') subplot(3,1,3),histogram(z) title('histogram of the axis z')

