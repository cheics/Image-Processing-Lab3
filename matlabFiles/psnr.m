function [ outPsnr ] = psnr( f, g, maxVal)
%psnr Peak Signal-to-noise ratio
%   Operates on images that are [0,1]

outPsnr=10*log10(maxVal/mean2((f-g).^2));

end

