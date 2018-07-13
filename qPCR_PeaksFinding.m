% example of finding local maxima in qPCR data vector.
% Yulong Wang
% 2018/07/12
% v-0.1 
% untested

%%
close all 
clear 
clc

%% Data reading parameters
filename = '.\data\xiaoning.xlsx';
% filename = '.\data\DrGUO.xls';
sheet = 1;
xlRange = 'C2:C6004';

%% read xls data
data = xlsread(filename, sheet, xlRange);
% data = [3, 1, 555, 12, 11, 4, 5555, 4, 11, 22, 21, 22, 25, 16, 11]

% data = data + rand( length(data), 1) * 100;
% figure(1)
% plot(data)

%%
[maxtab, mintab] = localPeaks4(data, 55);
figure(99)
plot(data)
hold on; 
plot(maxtab(:,1), maxtab(:,2), 'rv');

%%
% ind = maxtab(:,1)
% indd = diff(ind)
% figure, plot(ind)
% figure,plot(indd)
