img = imread('C:\Users\Neil\Desktop\SYDE 575\peppers.png');
img = rgb2ycbcr(img);
y = img(:,:,1);
cb = img(:,:,2);
cr = img(:,:,3);
figure(1);
imshow(y);
figure(2);
imshow(cb);
figure(3);
imshow(cr);
cr2 = imresize(cr,0.5,'bilinear');
cb2 = imresize(cb,0.5,'bilinear');
cr2 = imresize(cr2,2,'bilinear');
cb2 = imresize(cb2,2,'bilinear');
img2 = img;
img2(:,:,2) = cb2;
img2(:,:,3) = cr2;


y2 = imresize(y,0.5,'bilinear');
y2 = imresize(y2,2,'bilinear');
img3 = img;
img3(:,:,1) = y2;

r_img2 = ycbcr2rgb(img2);
r_img3 = ycbcr2rgb(img3);
r_img = ycbcr2rgb(img);

figure(4);
imshow(r_img);
figure(5);
imshow(r_img2);
figure(6);
imshow(r_img3);