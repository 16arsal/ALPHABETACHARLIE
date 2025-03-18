% Load an RGB image
img = imread('sw.jpg'); % Change filename as needed

% Display the original image
figure;
imshow(img);
title('Original RGB Image');

% Extract individual R, G, and B channels
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

% Display the separate color channels
figure;
subplot(1,3,1), imshow(R), title('Red Channel');
subplot(1,3,2), imshow(G), title('Green Channel');
subplot(1,3,3), imshow(B), title('Blue Channel');

% Convert RGB to Grayscale
gray_img = rgb2gray(img);

% Convert RGB to Indexed with 256 colors
[X, map] = rgb2ind(img, 256);

% Convert Indexed back to RGB
RGB_from_indexed = ind2rgb(X, map);

% Display grayscale, indexed, and reconstructed images
figure;
subplot(2,2,1), imshow(img), title('Original RGB Image');
subplot(2,2,2), imshow(gray_img), title('Grayscale Image');
subplot(2,2,3), imshow(X, map), title('Indexed Image');
subplot(2,2,4), imshow(RGB_from_indexed), title('Reconstructed RGB from Indexed');

% Display the colormap used in the indexed image
figure;
colormap(map);
colorbar;
title('Colormap Used in Indexed Image');

% Convert RGB to YCbCr and back to RGB
YCbCr = rgb2ycbcr(img);
RGB_from_YCbCr = ycbcr2rgb(YCbCr);

% Display YCbCr and Reconstructed RGB
figure;
subplot(1,2,1), imshow(YCbCr), title('YCbCr Image');
subplot(1,2,2), imshow(RGB_from_YCbCr), title('Reconstructed RGB from YCbCr');

% Convert RGB to HSV and back to RGB
HSV = rgb2hsv(img);
RGB_from_HSV = hsv2rgb(HSV);

% Display HSV and Reconstructed RGB
figure;
subplot(1,2,1), imshow(HSV), title('HSV Image');
subplot(1,2,2), imshow(RGB_from_HSV), title('Reconstructed RGB from HSV');

% Save processed images
imwrite(gray_img, 'grayscale.png');
imwrite(X, map, 'indexed_image.png');
imwrite(RGB_from_indexed, 'reconstructed_rgb.png');
imwrite(YCbCr, 'ycbcr_image.png');
imwrite(RGB_from_YCbCr, 'reconstructed_ycbcr.png');
imwrite(HSV, 'hsv_image.png');
imwrite(RGB_from_HSV, 'reconstructed_hsv.png');

disp('Image processing completed successfully!');
