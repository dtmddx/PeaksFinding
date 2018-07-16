function [Data] = SignalGen(sigma)

%%
SignalLength = 6000;
NumOfPeaks = 8;

DataArray= zeros(NumOfPeaks, SignalLength);

x = linspace(1, SignalLength, SignalLength)


MaxPeakAmp = 1000;
MaxPeakWidth = SignalLength/20;

PeaksPos = x(round(SignalLength * rand(1, NumOfPeaks)));
PeaksAmp = round(MaxPeakAmp * rand(1, NumOfPeaks));
PeaksWidth = round(MaxPeakWidth * rand(1, NumOfPeaks));

for n = 1:NumOfPeaks
    DataArray(n,:) =  PeaksAmp(n)*exp(-((x - PeaksPos(n))/PeaksWidth(n)).^2);
end

Data = sum(DataArray);
Data = Data + randn(1, SignalLength) * sigma;
figure
plot(x,DataArray,'--',x,Data)