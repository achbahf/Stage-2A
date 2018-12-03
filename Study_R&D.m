clc
close all

%%Frequency to depth
%Frequency to depth

m1=1400 ; %micrometre
m2=1800 ; %micrometre
n=15 ; %steps
lam=91 ; %thermal conductivity [W/(m.K)]
Cp=0.44e3;%specific heat[J/(kg.K)]
gho=7.14e3;% density [kg/(m^3)]
a=lam/(Cp*gho) ; %thermal diffusivity of chrome:  m^2*s^(-1)
% d=linspace(m1,m2,n);%en micrometre
% f=zeros(1,n);
% for i=1:n
%    f(i)=a/(pi*((d(i)*10^(-6))^2));
% end
 f=[0.021 0.028 0.038 0.055 0.071 0.093 0.126 0.182];
 m=length(f);
 d=zeros(1,m);
 for i=1:m
  d(i)=10^(3)*sqrt(a/(pi*f(i)));  %depth in mm
 end
ax1 = subplot(1,1,1);
plot(ax1,f,d,'r-o')
xlabel(ax1,'frequency(Hz)')
ylabel(ax1,'depth(μm)')

%% Calculate maximum and average of temperature from different files:
%This code help understand the problems with each file in addition had help me detect the
%problems of chosen frequency.

n=50 ; %number of files it chabges whenever we chabge test object
temperatureFile = cell(1,n); %cell of csv files % n is the total of csv files
mintemperature=[]*n;
MAXtemperature=[]*n;
for k = 1:n %n %loop to read and open csv files with matlab
  name = sprintf('%i.xlsx',k);
  temperatureFile{k} = xlsread(name,'A17:WJ476');
  mintemperature(k)=min( temperatureFile{k}(:));
  MAXtemperature(k)=max( temperatureFile{k}(:));
end
show temperature profil of each pixel
Temp=zeros(y,x);  %temperature
for i=1:y
  for j=1:x
    Temp(i,j)=temperatureFile{1}(i+ymin,j+xmin)-IniTemp;%data
    Temp(i,j)=temperatureFile{25}(i+ymin,j+xmin)-IniTemp;%data
    Temp(i,j)=temperatureFile{50}(i+ymin,j+xmin)-IniTemp;%data
end end
    figure
    mesh(X,Y,Temp)%plot it
    title(['temperature profil t=' num2str(1)])
    figure
    mesh(X,Y,Temp)%plot it
    title(['temperature profil t=' num2str(25)])
    figure
    mesh(X,Y,Temp)%plot it
    title(['temperature profil t=' num2str(50)])
figure
plot(1:50,MAXtemperature)
hold on
plot(1:50,mintemperature)

%% Calculate FFT and phase and amplitude of the data using all files:

%This code was useful before discovering that the IR camera can do all this work. This script
%process all the data which are quite tiring and take a lot of time and sometimes Matlab crush
%because it cannot handle all this data.

tic
n=50; %number of files
IniTemp=0; %The initial temperature that before mesuring
temperatureFile = cell(1,n); %cell of csv files % n is the total of csv files
for k = 1:n %n %loop to read and open csv files with matlab
  name = sprintf('Experience(1)%i.csv',k);
  temperatureFile{k} = xlsread(name,'A17:XP528');
end
toc
tic
I=imagesc(temperatureFile{1}); % I is the image that display all the
temperature contain in the csv file
[I2, rect] = imcrop(I); % I2 is the cropped image of I and rect gives us the
coordination of I2
%the coordination can be float for that reason we need to round it since
%pixels are integer
xmin=round(rect(1))-1 ;ymin= round(rect(2))-1; longueur=round(rect(3))-1
;largeur= round(rect(4))-1;
xmax=xmin+longueur; ymax=ymin+largeur;
%axis
X=xmin-1:xmax-1 ; % X pixels : pixels in the X axis
Y=ymin-1:ymax-1 ; % Y pixels : pixels in the Y axis
% length of each axis
x=length(X);  %lentgh of X axis
y=length(Y);  %lentgh of Y axis
%This part of the script is to see the chosen rectangle and if it is
%compatible with your expectations you can delete it if you want
hold on;
rectangle('Position',rect,...
         'LineWidth',2,'LineStyle','--')
grid minor
toc
% the objective of this small script is to show temperature profil of each
% pixel
Temp=zeros(y,x);  %temperature
for k=1:20:n %to avoid show all th files and thus crashes our code
  for i=1:y
  for j=1:x
    Temp(i,j)=temperatureFile{k}(i+ymin,j+xmin)-IniTemp;%data
  end
end
    figure
    mesh(X,Y,Temp)%plot it
    title(['temperature profil t=' num2str(k)])
end
fs=1;                  %sampling frequency Hz
%ts=1;                 %sampling period s
T=n*[];                %array of temperature of a given pixel
F=cell(y,x);           %cell of fft of each pixel
M=cell(y,x);           %cell of magnitude of each pixel
P=cell(y,x);           %cell of phase of each pixel
t=0:89;               %duration of the experiment
l=n;                   %length of the signal
f=(-l/2:l/2-1)/l*fs; %frequency Hz
%loop that calculate the fft, phase and magnitude of each pixels during t
for j=1:x
for i=1:y
 for k=1:n
    T(k)=temperatureFile{k}(i+ymin,j+xmin); % temperature of each pixels
during t
end
end end
% plot of phase and magnitude of the pixel (1,2)
% example
figure
plot(f,M{1,2})      %example
xlabel 'Frequency (Hz)'
ylabel '|F|'
figure
plot(f,P{1,2})      %example
xlabel 'Frequency (Hz)'
ylabel 'Phase'
F{i,j}=abs(fft(T));                 %FFT of T of the pixel (i,j)
M{i,j}=((F{i,j}));  %magnitude of the last FFT
P{i,j}=unwrap(angle(F{i,j}));  %phase of the last fft

grid
phase=cell(1,n);    %cell of phases that regroupes the phases of each pixel at
a giving frequence
amplitude=cell(1,n);%cell of amplitudes that regroupes the amplitudes of each
pixel at a giving frequence
for k=1:n
for j=1:x
for i=1:y
  phase{k}(i,j)= P{i,j}(k);    %the difference between 'phase' and 'P' is
parametrazation: 'P' is the phase of a given pixel for all frequencies and
'phase' the phase of all pixels for a given frequency
  amplitude{k}(i,j)=M{i,j}(k); %the difference between 'amplitude' and 'M' is
parametrazation :'M' is the amplitude of a given pixel for all frequencies and
'amplitude' the phase of all pixels for a given frequency
end
end end
% testing : f=0,02 ; f=0 ; f=0,1
% example
e=find(f==0.1);
m=find(f==0);
p=find(f==0.02);
figure
imagesc(phase{e})
title('phase image for f=0,1 Hz')
figure
imagesc(amplitude{e})
title('amplitude image for f=0,1 Hz')
figure
imagesc(phase{m})
title('phase image for f=0 Hz')
figure
imagesc(amplitude{m})
title('amplitude image for f=0 Hz')
figure
imagesc(phase{p})
title('phase image for f=0,02  Hz')
figure
imagesc(amplitude{p})
title('amplitude image for f=0,02 Hz')



