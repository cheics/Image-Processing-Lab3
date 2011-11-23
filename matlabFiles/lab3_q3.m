lenaBase=double(rgb2gray(imread('D:\Program Files\MATLAB\R2010b\toolbox\images\imdemos\lena.tif')));
dct_mtx8=double(dctmtx(8));

basePath='C:\Users\cheics\Documents\LatexFiles\Image-Processing-Lab3\';
basePath2=strcat(basePath,'images\question3\');

% surf(dct_mtx8);
% shading interp;

% rl=size(dct_mtx8,2);
% plot(1:rl, dct_mtx8(1,:), ...
%     1:rl, dct_mtx8(2,:)+1, ...
%     1:rl, dct_mtx8(3,:)+2, ...
%     1:rl, dct_mtx8(4,:)+3, ...
%     1:rl, dct_mtx8(5,:)+4, ...
%     1:rl, dct_mtx8(6,:)+5, ...
%     1:rl, dct_mtx8(7,:)+6, ...
%     1:rl, dct_mtx8(8,:)+7);


img_dct = floor(blkproc(lenaBase-128, [8 8],'P1*x*P2', dct_mtx8, dct_mtx8'));

% block1_loc=[297, 81];
% block2_loc=[1, 1];
% 
% block1_img=lenaBase(block1_loc(1):block1_loc(1)+7, ...
%     block1_loc(2):block1_loc(2)+7);
% block1_dct=img_dct(block1_loc(1):block1_loc(1)+7, ...
%     block1_loc(2):block1_loc(2)+7);
% 
% block2_img=lenaBase(block2_loc(1):block2_loc(1)+7, ...
%     block2_loc(2):block2_loc(2)+7);
% block2_dct=img_dct(block2_loc(1):block2_loc(1)+7, ...
%     block2_loc(2):block2_loc(2)+7);
% 
% pixelArtSize=16;
% imwrite(imresize(block1_img/255, pixelArtSize, 'nearest'), strcat(basePath2, 'block1_8x8.jpg'));
% imwrite(imresize(block2_img/255, pixelArtSize, 'nearest'), strcat(basePath2, 'block2_8x8.jpg'));
% 

imwrite(img_dct/255, strcat(basePath2, 'originalImage_dct.jpg'));
imwrite(lenaBase/255, strcat(basePath2, 'originalImage.jpg'));


mask=zeros(8);mask(1:3, 1:3)=[1 1 1; 1 1 0; 1 0 0];
img_dct_thresh=blkproc(img_dct, [8 8], 'P1.*x', mask);

img_thresh=floor(blkproc(img_dct_thresh, [8 8], 'P1*x*P2', dct_mtx8', dct_mtx8))+128;

imshow(img_thresh, [0, 255]);







