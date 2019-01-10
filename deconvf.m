function [deconf] = deconvf(s,r,t,ep)
% water-level deconvolution interferometry in frequency domain
% Muhammad F. Akbar @ 2018
%
% s = nx1 vector/trace at pseudosource location 
% r = receivers trace
% deconf = pseudoshot gather of pseudosource at s position
% ep = stabilization parameter

[~,nx] = size(r);
[nt,~] = size(t);

npad = round(nt);
rp = padarray(r,npad);
sp = padarray(s,npad);
rp = rp(1:2*nt,:);
sp = sp(1:2*nt,:);

wr = fft(rp);
ws = fft(sp);

deconff = zeros(nt*2,nx);
OP = conj(ws)./(abs(ws).^2+(ep^2)*max(abs(ws).^2)); % default

for i = 1:nx
deconff(:,i) = wr(:,i).*OP;
end

decon = real(ifft(deconff,[],1));

deconf = decon(1:nt,:); % causal part of deconvolution result