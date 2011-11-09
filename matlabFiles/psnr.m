function [ outPsnr ] = psnr( f, g)
%psnr Peak Signal-to-noise ratio
%   Operates on images that are [0,1]

outPsnr=10*log10(1/mean2((f-g).^2))

end

