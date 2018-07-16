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
% filename = '.\data\xiaoning.xlsx';
filename = '.\data\datakongguan.xlsx';
% filename = '.\data\DrGUO.xls';
sheet = 1;
% xlRange = 'B2:B6000';
xlRange = 'C2:C6000';
% xlRange = 'D2:D6000';
% xlRange = 'E2:E6000';
data = xlsread(filename, sheet, xlRange);
sigma = std(data(1:100))*2;

% data = data + randn(1, length(data))*20;


%% 
% sigma = 2;
% [data] = SignalGen(sigma);
% x = 1:length(data);

%% smooth



%% normalization

%% alg1
% [pks,locs] = findpeaks(data,x);
% figure(1)
% plot(x, data)
% text(locs+.02,pks,num2str((1:numel(pks))'))
% findpeaks(data,x,'MinPeakProminence',4,'Annotate','extents')

%% alg2
% [k,v]=findpeaksD(data,'q', 600)
% figure(2)
% plot(x, data)
% hold on
% plot(k, v, 'o')
%% alg3
[maxtab, mintab] = localPeaks(data, sigma*10);
figure(3)
plot(data)
hold on; 
plot(maxtab(:,1), maxtab(:,2), 'rv');

