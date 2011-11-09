lenaBase=double(rgb2gray(imread('D:\Program Files\MATLAB\R2010b\toolbox\images\imdemos\lena.tif')))/(255.0);

lenaNoisy=(imnoise(lenaBase, 'gaussian', 0, 0.005));
psnr(lenaBase,lenaNoisy); %23.02

imPath='C:\Users\cheics\Documents\LatexFiles\Image-Processing-Lab2\images\question5\';

fftLenaBase=fftshift(fft2(lenaBase));
lenaBase_log_FS=log(abs(fftLenaBase));

fftLenaNoisy=fftshift(fft2(lenaNoisy));
lenaNoisy_log_FS=log(abs(fftLenaNoisy));

%% BATCH 1
prefix=strcat(imPath,'1_');

imwrite(lenaBase,  strcat(prefix, 'lenaBase','.jpg'));
imwrite(normalizeImage(lenaBase_log_FS), strcat(prefix, 'lenaBase_fft','.jpg'));

imwrite(lenaNoisy,  strcat(prefix, 'lenaNoisy','.jpg'));
imwrite(normalizeImage(lenaNoisy_log_FS), strcat(prefix, 'lenaNoisy_fft','.jpg'));

%% BATCH 2
prefix=strcat(imPath,'2_');

[hh, ww]=size(fftLenaNoisy);
r=60;
h=fspecial('disk', r); h(h>0)=1;
h_freq=zeros(hh,ww);
h_freq([hh/2-r:ww/2+r],[ww/2-r:ww/2+r])=h;

lena_freq_LPF=real(ifft2(ifftshift(fftLenaNoisy.*h_freq)));

imwrite(lena_freq_LPF,  strcat(prefix, 'lena_LFP_60','.jpg'));
psnr(lena_freq_LPF, lenaBase); %27.90

%% BATCH 3
prefix=strcat(imPath,'3_');

[hh, ww]=size(fftLenaNoisy);
r=20;
h=fspecial('disk', r); h(h>0)=1;
h_freq=zeros(hh,ww);
h_freq([hh/2-r:ww/2+r],[ww/2-r:ww/2+r])=h;

lena_freq_LPF=real(ifft2(ifftshift(fftLenaNoisy.*h_freq)));

imwrite(lena_freq_LPF,  strcat(prefix, 'lena_LFP_20','.jpg'));
psnr(lena_freq_LPF, lenaBase); %23.11

%% BATCH 4
prefix=strcat(imPath,'4_');

[hh, ww]=size(fftLenaNoisy);
h=fspecial('gaussian', [hh ww], 60);
h_norm=(h-min(min(h)))./(max(max(h))-min(min(h)));

lena_freq_LPF=real(ifft2(ifftshift(fftLenaNoisy.*h_norm)));

imwrite(lena_freq_LPF,  strcat(prefix, 'lena_LFP_gauss60','.jpg'));
psnr(lena_freq_LPF, lenaBase); %29.53

