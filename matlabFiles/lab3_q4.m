lenaBase=double(rgb2gray(imread('D:\Program Files\MATLAB\R2010b\toolbox\images\imdemos\lena.tif')));
dct_mtx8=double(dctmtx(8));

basePath='C:\Users\cheics\Documents\LatexFiles\Image-Processing-Lab3\';
basePath2=strcat(basePath,'images\question4\');

jpegStd = [16 11 10 16 24 40 51 61;...
    12 12 14 19 26 58 60 55; ...
    14 13 16 24 40 57 69 56; ...
    14 17 22 29 51 87 80 62; ...
    18 22 37 56 68 109 103 77; ...
    24 35 55 64 81 104 113 92; ...
    49 64 78 87 103 121 120 101; ...
    72 92 95 98 112 100 103 99];


img_dct = floor(blkproc(lenaBase-128, [8 8],'P1*x*P2', dct_mtx8, dct_mtx8')); 


Z1=jpegStd;
Z3=jpegStd*3;
Z5=jpegStd*5;
Z10=jpegStd*10;

img_dct_quant_Z1=round(blkproc( ...
    round(blkproc(img_dct, [8 8], 'x./P1', Z1)), ...
    [8 8], 'x.*P1', Z1));

img_dct_quant_Z3=round(blkproc( ...
    round(blkproc(img_dct, [8 8], 'x./P1', Z3)), ...
    [8 8], 'x.*P1', Z3));

img_dct_quant_Z5=round(blkproc( ...
    round(blkproc(img_dct, [8 8], 'x./P1', Z5)), ...
    [8 8], 'x.*P1', Z5));

img_dct_quant_Z10=round(blkproc( ...
    round(blkproc(img_dct, [8 8], 'x./P1', Z10)), ...
    [8 8], 'x.*P1', Z10));

img_quant_Z1=floor(blkproc(img_dct_quant_Z1, [8 8], 'P1*x*P2', dct_mtx8', dct_mtx8))+128;
img_quant_Z3=floor(blkproc(img_dct_quant_Z3, [8 8], 'P1*x*P2', dct_mtx8', dct_mtx8))+128;
img_quant_Z5=floor(blkproc(img_dct_quant_Z5, [8 8], 'P1*x*P2', dct_mtx8', dct_mtx8))+128;
img_quant_Z10=floor(blkproc(img_dct_quant_Z10, [8 8], 'P1*x*P2', dct_mtx8', dct_mtx8))+128;


maxVal=255;
psnr(lenaBase, img_quant_Z1, maxVal);    %PSNR: 11.63 dB
psnr(lenaBase, img_quant_Z3, maxVal);   %PSNR: 8.22 dB
psnr(lenaBase, img_quant_Z5, maxVal);   %PSNR: 6.31 dB
psnr(lenaBase, img_quant_Z10, maxVal);  %PSNR: 3.25 dB

imwrite(lenaBase/255, strcat(basePath2, 'originalImage.jpg'));  
imwrite(img_quant_Z1/255, strcat(basePath2, 'jpeg_Z1.jpg'));   
imwrite(img_quant_Z3/255, strcat(basePath2, 'jpeg_Z3.jpg'));    
imwrite(img_quant_Z5/255, strcat(basePath2, 'jpeg_Z5.jpg'));    
imwrite(img_quant_Z10/255, strcat(basePath2, 'jpeg_Z10.jpg'));





