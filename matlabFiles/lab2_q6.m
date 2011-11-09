camBase=double(imread('D:\Program Files\MATLAB\R2010b\toolbox\images\imdemos\cameraman.tif'))/(255.0);

imPath='C:\Users\cheics\Documents\LatexFiles\Image-Processing-Lab2\images\question6\';

%% BATCH 0
h = fspecial('disk', 4);
[hh, ww] =size(camBase);
h_freq = fft2(h, hh, ww);




%% BATCH 1
prefix=strcat(imPath,'1_');
imwrite(camBase,  strcat(prefix, 'camBase','.jpg'));

cam_blur=real(ifft2(h_freq.*fft2(camBase)));
imwrite(cam_blur,  strcat(prefix, 'cam_blur','.jpg'));
psnr(camBase,cam_blur) % 16.8964

cam_unblur=real(ifft2(fft2(cam_blur)./h_freq));
imwrite(cam_unblur,  strcat(prefix, 'cam_unblur','.jpg'));
psnr(camBase,cam_unblur) % 251.54 -- rounding errors

%% BATCH 2
prefix=strcat(imPath,'2_');
cam_blur_noisy=imnoise(cam_blur, 'gaussian', 0, 0.002);
imwrite(cam_blur_noisy,  strcat(prefix, 'cam_blur_noisy','.jpg'));
psnr(camBase,cam_blur_noisy) % 16.50

cam_unblur_noisy=real(ifft2(fft2(cam_blur_noisy)./h_freq));
imwrite(cam_unblur_noisy,  strcat(prefix, 'cam_unblur_noisy','.jpg'));
psnr(camBase,cam_unblur_noisy) % -35.24 -- nothing at all like

%% BATCH 3
prefix=strcat(imPath,'3_');

wnr_try=deconvwnr(cam_blur_noisy, h, 0.001); psnr(camBase,wnr_try); %5.11
imwrite(wnr_try, strcat(prefix, 'cam_wnr0_001','.jpg'));

wnr_try=deconvwnr(cam_blur_noisy, h, 0.01); psnr(camBase,wnr_try); %13.89
imwrite(wnr_try, strcat(prefix, 'cam_wnr0_01','.jpg'));

wnr_try=deconvwnr(cam_blur_noisy, h, 0.05); psnr(camBase,wnr_try); %16.00
imwrite(wnr_try, strcat(prefix, 'cam_wnr0_05','.jpg'));

wnr_try=deconvwnr(cam_blur_noisy, h, 0.10); psnr(camBase,wnr_try); %16.16
imwrite(wnr_try, strcat(prefix, 'cam_wnr0_10','.jpg'));

wnr_try=deconvwnr(cam_blur_noisy, h, 0.20); psnr(camBase,wnr_try); % 15.66
imwrite(wnr_try, strcat(prefix, 'cam_wnr0_20','.jpg'));

wnr_try=deconvwnr(cam_blur_noisy, h, 0.40); psnr(camBase,wnr_try); %14.05
imwrite(wnr_try, strcat(prefix, 'cam_wnr0_40','.jpg'));
