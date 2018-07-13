function [localMax, localMin]=localPeaks4(v, delta)
% localPeaks finds local Maxima in qPCR data vector.

x = (1:length(v))';
localMax = [];
localMin = [];

tmpMin = Inf;
tmpMax = -Inf;
tmpMaxpos = NaN;

localReset = 0;

for i=1:length(v)
    currentValue = v(i);
    if currentValue > tmpMax
        tmpMax = currentValue;
        tmpMaxpos = x(i);
    end
    
    if currentValue < tmpMin
        tmpMin = currentValue;
    end
    
    if ~localReset
        if currentValue < tmpMax-delta
            localMax = [localMax;
                tmpMaxpos tmpMax];
            tmpMin = currentValue;
            localReset = 1;
        end
    else
        if currentValue > tmpMin+delta
            tmpMax = currentValue;
            tmpMaxpos = x(i);
            localReset = 0;
        end
    end
end