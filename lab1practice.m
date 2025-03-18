% % Read and Display an Image 
% img = imread('sw.jpg');  
% imshow(img);  
% title ('Original Image'); 
% 
% % Get Image Dimensions 
% [rows, cols, channels] = size(img); 
% disp(['Image Dimensions: ', num2str(rows), ' x ', num2str(cols)]); 
% disp(['Number of Channels: ', num2str(channels)]); 
% 
% % Convert RGB to Grayscale 
% gray_img = rgb2gray(img); 
% figure, imshow(gray_img); 
% title('Grayscale Image'); 
% 
% % Extracting Color Channels 
% red_channel = img(:,:,1); 
% green_channel = img(:,:,2); 
% blue_channel = img(:,:,3); 
% 
% figure, 
% subplot(1,3,1), imshow(red_channel), title('Red Channel'); 
% subplot(1,3,2), imshow(green_channel), title('Green Channel'); 
% subplot(1,3,3), imshow(blue_channel), title('Blue Channel'); 
% 
% % Adjust Brightness 
% brighter_img = gray_img + 50; 
% figure, imshow(brighter_img); 
% title('Brighter Image'); 
% 
% darker_img = gray_img - 50; 
% figure, imshow(darker_img); 
% title('Darker Image'); 
% 
% % Image Negation 
% negative_img = 255 - gray_img; 
% figure, imshow(negative_img); 
% title('Negative Image'); 


% Read and Display an Image
img = imread('sw.jpg');  
imshow(img);  
title('Original Image'); 

% Get Image Dimensions
[rows, cols, channels] = size(img); 
disp(['Image Dimensions: ', num2str(rows), ' x ', num2str(cols)]);
disp(['Number of Channels: ', num2str(channels)]);

% Convert RGB to Grayscale
gray_img = rgb2gray(img); 
figure, imshow(gray_img); 
title('Grayscale Image');

% Convert Grayscale to Binary (Thresholding)
binary_img = imbinarize(gray_img, 0.5);  % Using automatic thresholding
% binary_img = gray_img > 128;  % Manual thresholding
figure, imshow(binary_img);
title('Binary Image');

% Rotate Image by 90 Degrees Without Built-in Functions
rotated_img = flipud(gray_img');  % Transpose and flip upside-down
figure, imshow(rotated_img);
title('Rotated Image (90°)');

block_size = 8;  % Change to 4 if needed

% Crop image to be a multiple of block_size 
num_rows = floor(rows /block_size) * block_size;
num_cols = floor(cols / block_size) * block_size; 

cropped_img = gray_img(1:num_rows, 1:num_cols);

% Split into Blocks 
blocks = mat2cell(cropped_img, repmat(block_size, 1,num_rows/block_size), repmat(block_size, 1, num_cols/block_size));

% Display All Blocks 
montage(blocks, 'Size', [num_rows/block_size, num_cols/block_size]); title(['Non-Overlapping ', num2str(block_size),
'x', num2str(block_size), ' Blocks']);
