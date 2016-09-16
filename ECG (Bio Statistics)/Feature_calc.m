% Filteration with notch filter and calculation the 4 features.
function [energy,power,NL_energy,curve] = Feature_calc(f)

% Load data from file
cd 'C:\Users\Mego\Documents\wfdb\mcode\';
[tm,y,Fs]=rdsamp(f,2,4000,2000);       
%subplot(2,1,1);
%plot(tm,y);
%title('Non-Filterd')

% notch filter
wo = 60/(Fs/2);
bw = wo/100;

[b,a] = iirnotch(wo,bw);
%fvtool(b,a)
signal=filter(b,1,y);
%subplot(2,2,2);
%plot(tm,signal)
%title('Filterd')

% features
% energy
e= (signal.*signal);
energy=sum(e);
power=sum(e.*e);            % force power

s=0;
c=0;
x1=signal([1])^2;       % first term 

% non linear energy calculation
for i=3:length(signal)
    x=signal([i]);
    z=signal([i-1]);
    M=signal([i-2]);
    
    s=s+((-x.*M)+z^2);         % sum without the first term x1
end
NL_energy=s+x1;                        % total sum (after adding x1)

% curve length calculation
for j=2:length(signal)
    c=c+signal([j])-signal([j-1]);                % curve length without the first term
end
curve=c+sqrt(x1);                   % total sum (after adding x1)

end
