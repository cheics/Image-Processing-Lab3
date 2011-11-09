camBase=double(imread('D:\Program Files\MATLAB\R2010b\toolbox\images\imdemos\cameraman.tif'))/(255);

smoothingFilter_7_gauss=fspecial('gaussian', 7, 1);
cam_blur7gauss = imfilter(camBase, smoothingFilter_7_gauss); 

imPath='C:\Users\cheics\Documents\LatexFiles\Image-Processing-Lab2\images\question4\';


%% BATCH 1
prefix=strcat(imPath,'1_');
imwrite(camBase, strcat(prefix, 'camBase','.jpg'), 'JPG');
cam_highBoost=camBase-cam_blur7gauss
imwrite(cam_highBoost, strcat(prefix, 'cam_highBoost','.jpg'), 'JPG');

%% BATCH 2
prefix=strcat(imPath,'2_');
cam_highBoost_10=cam_highBoost+camBase;
imwrite(cam_highBoost_10, strcat(prefix, 'cam_highBoost_10','.jpg'), 'JPG');

%% BATCH 3
prefix=strcat(imPath,'3_');
cam_highBoost_05=cam_highBoost*0.5+camBase;
cam_highBoost_15=cam_highBoost*1.5+camBase;
cam_highBoost_40=cam_highBoost*4.0+camBase;
imwrite(cam_highBoost_05, strcat(prefix, 'cam_highBoost_05','.jpg'), 'JPG');
imwrite(cam_highBoost_15, strcat(prefix, 'cam_highBoost_15','.jpg'), 'JPG');
imwrite(cam_highBoost_40, strcat(prefix, 'cam_highBoost_40','.jpg'), 'JPG');
