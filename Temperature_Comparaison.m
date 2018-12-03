clc
close all
n=5; %number of files
% traditional hand to hand sctript
% plot temperature change depending on the index(and thus time)
index=0:49;
name1 = sprintf('chrom_0_1(2hz)1.csv');
name2 = sprintf('chrom_0_1(2hz)2.csv');
name3 = sprintf('chrom_0_1(2hz)3.csv');
name4 = sprintf('chrom_0_1(2hz)4.csv');
name5 = sprintf('chrom_0_02(2hz)1.csv');
name6 = sprintf('chrom_0_02(2hz)2.csv');
name7 = sprintf('chrom_0_02(2hz)3.csv');
name8 = sprintf('chrom_0_02(2hz)4.csv');
averageValues{1}= xlsread(name1,'B3:B52');
averageValues{2}= xlsread(name2,'B3:B52');
averageValues{3}= xlsread(name3,'B3:B52');
averageValues{4}= xlsread(name4,'B3:B1002');
averageValues{5}= xlsread(name5,'B3:B52');
averageValues{6}= xlsread(name6,'B3:B52');
averageValues{7}= xlsread(name7,'B3:B52');
averageValues{8}= xlsread(name8,'B3:B1002');
X=index;
Y1=(abs(averageValues{1}-averageValues{1}(1)))';
Y2=(abs(averageValues{2}-averageValues{2}(1)))';
Y3=(abs(averageValues{3}-averageValues{3}(1)))';
Y4=(abs(averageValues{4}-averageValues{4}(1)))';
Y5=(abs(averageValues{5}-averageValues{5}(1)))';
Y6=(abs(averageValues{6}-averageValues{6}(1)))';
Y7=(abs(averageValues{7}-averageValues{7}(1)))';
Y8=(abs(averageValues{8}-averageValues{8}(1)))';
%To do the regression

% a1=polyfit(X,Y1,1);
% a2=polyfit(X,Y2,1);
% a3=polyfit(X,Y3,1);
% a4=polyfit(X,Y4,1);
% a5=polyfit(X,Y5,1);
% a6=polyfit(X,Y6,1);
%
% y1=a1(1)*X+a1(2);
% y2=a2(1)*X+a2(2);
% y3=a3(1)*X+a3(2);
% y4=a4(1)*X+a4(2);
% y5=a5(1)*X+a5(2);
% y6=a6(1)*X+a6(2);

figure
subplot(2,1,1)
plot(index,abs(averageValues{1}-averageValues{1}(1)))
hold on
plot(index,abs(averageValues{2}-averageValues{2}(1)))
hold on
plot(index,abs(averageValues{3}-averageValues{3}(1)))
title('Comparison of results Chrome layer 0,1mm for 2 HZ')
xlabel('Index')
ylabel('\DeltaT')
legend('0,1mm test 1','0,1mm test 2','0,1mm test 3')
grid minor
subplot(2,1,2)
plot(0:999,abs(averageValues{4}-averageValues{4}(1)))
legend('test 4 0,1 mm 2 hz')
grid minor
figure
subplot(2,1,1)
plot(index,abs(averageValues{5}-averageValues{5}(1)))
hold on
plot(index,abs(averageValues{6}-averageValues{6}(1)))
hold on
plot(index,abs(averageValues{7}-averageValues{7}(1)))
legend('0,02 mm test 1','0,02 mm test 2','0,02 mm test 3')
title('Comparison of results Chrome layer 0,02mm for 2 HZ')
xlabel('Index')
ylabel('\DeltaT')
grid minor
subplot(2,1,2)
plot(0:999,abs(averageValues{8}-averageValues{8}(1)))
legend('test 4 0,02 mm 2 hz')
grid minor