lenaBase=double(rgb2gray(imread('D:\Program Files\MATLAB\R2010b\toolbox\images\imdemos\lena.tif')))/(255);
%cameramanBase=imread('D:\Program Files\MATLAB\R2010b\toolbox\images\imdemos\cameraman.tif');

lena_noisy_gauss=imnoise(lenaBase, 'gaussian', 0, 0.002);
lena_noisy_sp=imnoise(lenaBase, 'salt & pepper', 0.05);

smoothingFilter3=fspecial('average', 3);
smoothingFilter7=fspecial('average', 7);
smoothingFilter_7_gauss=fspecial('gaussian', 7, 1);


lena_denoised_avg3 = imfilter(lena_noisy_gauss, smoothingFilter3); 
lena_denoised_avg7 = imfilter(lena_noisy_gauss, smoothingFilter7); 
lena_denoised_avg7_gauss = imfilter(lena_noisy_gauss, smoothingFilter_7_gauss); 

lena_denoised_sp_avg3 = imfilter(lena_noisy_sp, smoothingFilter3); 
lena_denoised_sp_avg7 = imfilter(lena_noisy_sp, smoothingFilter7); 
lena_denoised_sp_avg7_gauss = imfilter(lena_noisy_sp, smoothingFilter_7_gauss); 

lena_denoised_noisy_med=medfilt2(lena_noisy_gauss);
lena_denoised_sp_med=medfilt2(lena_noisy_sp);

imPath='C:\Users\cheics\Documents\LatexFiles\Image-Processing-Lab2\images\question3\';

%% BATCH 0
prefix0=strcat(imPath,'0_')
imwrite(lenaBase, strcat(prefix0, 'lenaBase','.jpg'), 'JPG');
imwrite(lena_noisy_gauss, strcat(prefix0, 'lenaNoisyGauss','.jpg'), 'JPG');
psnr(lenaBase, lena_noisy_gauss); %26.9878

imhist(lenaBase);
saveas(gcf, strcat(prefix0, 'lenaBase_hist','.png'), 'png');
close(gcf);

imhist(lena_noisy_gauss);
saveas(gcf, strcat(prefix0, 'lenaNoisyGauss_hist','.png'), 'png');
close(gcf);

%% BATCH 1
prefix=strcat(imPath,'1_');

imwrite(lena_denoised_avg3, strcat(prefix, 'lenaDeNoisyGauss3x3avg','.jpg'), 'JPG');
psnr(lenaBase, lena_denoised_avg3); %30.6251

imhist(lena_denoised_avg3);
saveas(gcf, strcat(prefix, 'lenaDeNoisyGauss3x3avg_hist','.png'), 'png');
close(gcf);

%% BATCH 2
prefix=strcat(imPath,'2_');

imwrite(lena_denoised_avg7, strcat(prefix, 'lenaDeNoisyGauss7x7avg','.jpg'), 'JPG');
psnr(lenaBase, lena_denoised_avg7); %26.2333

imhist(lena_denoised_avg7);
saveas(gcf, strcat(prefix, 'lenaDeNoisyGauss7x7avg_hist','.png'), 'png');
close(gcf);

%% BATCH 3
prefix=strcat(imPath,'3_');

imwrite(lena_denoised_avg7_gauss, strcat(prefix, 'lenaDeNoisyGauss7x7avgGauss','.jpg'), 'JPG');
psnr(lenaBase, lena_denoised_avg7_gauss); %30.8196

imhist(lena_denoised_avg7_gauss);
saveas(gcf, strcat(prefix, 'lenaDeNoisyGauss7x7avgGauss_hist','.png'), 'png');
close(gcf)

%% BATCH 4
prefix=strcat(imPath,'4_');
imwrite(lenaBase, strcat(prefix, 'lenaBase','.jpg'), 'JPG');
imwrite(lena_noisy_sp, strcat(prefix, 'lenaNoisySp','.jpg'), 'JPG');
psnr(lenaBase, lena_noisy_sp); %18.4175

imwrite(lena_denoised_sp_avg7, strcat(prefix, 'lenaDeNoisySp_7x7Avg','.jpg'), 'JPG');
psnr(lenaBase, lena_denoised_sp_avg7); %25.5202

imwrite(lena_denoised_sp_avg7_gauss, strcat(prefix, 'lenaDeNoisySp_7x7AvgGauss','.jpg'), 'JPG');
psnr(lenaBase, lena_denoised_sp_avg7_gauss); %27.0765

imhist(lena_noisy_sp);
saveas(gcf, strcat(prefix, 'lenaNoisySp_hist','.png'), 'png');
close(gcf)

imhist(lena_denoised_sp_avg7);
saveas(gcf, strcat(prefix, 'lenaDeNoisySp_7x7Avg_hist','.png'), 'png');
close(gcf)

imhist(lena_denoised_sp_avg7_gauss);
saveas(gcf, strcat(prefix, 'lenaDeNoisySp_7x7AvgGauss_hist','.png'), 'png');
close(gcf)

%% BATCH 5
prefix=strcat(imPath,'5_');
imwrite(lena_denoised_sp_med, strcat(prefix, 'lenaDeNoisyMedian','.jpg'), 'JPG');
psnr(lenaBase, lena_denoised_sp_med); %34.4656

imhist(lena_denoised_sp_med);
saveas(gcf, strcat(prefix, 'lenaDeNoisyMedian_hist','.png'), 'png');
close(gcf)