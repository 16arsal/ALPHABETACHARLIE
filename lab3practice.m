% Read a low-resolution image 
low_res = imread(['sw.jpg']); 

% Nearest Neighbor Interpolation 
up_nn = imresize(low_res, 2, 'nearest'); 
% Bilinear Interpolation 
up_bilinear = imresize(low_res, 2, 'bilinear'); 
% Bicubic Interpolation 
up_bicubic = imresize(low_res, 2, 'bicubic'); 

% Display Upsampled Images
figure; 
subplot(2,2,1), imshow(low_res), title('Original Low-Resolution Image'); 
subplot(2,2,2), imshow(up_nn), title('Up-Sampling (Nearest Neighbor)'); 
subplot(2,2,3), imshow(up_bilinear), title('Up-Sampling (Bilinear)'); 
subplot(2,2,4), imshow(up_bicubic), title('Up-Sampling (Bicubic)'); 

% Read the image for downsampling
img = imread('sw.jpg');   

% Downsampling by factors of 2, 4, and 8 
img2 = img(1:2:end, 1:2:end);   
img4 = img(1:4:end, 1:4:end);   
img8 = img(1:8:end, 1:8:end);   

% Display Downsampled Images
figure;
subplot(2,2,1), imshow(img), title('Original Image');   
subplot(2,2,2), imshow(img2), title('Downsampled x2');   
subplot(2,2,3), imshow(img4), title('Downsampled x4');   
subplot(2,2,4), imshow(img8), title('Downsampled x8');  

% Different Quantization Levels
levels = [2, 4, 8, 16, 32, 64, 128, 256];   
figure;   
for i = 1:length(levels)   
    quantized_img = uint8(round(double(img) / 255 * (levels(i) - 1)) * (255 / (levels(i) - 1)));   
    subplot(2,4,i), imshow(quantized_img), title([num2str(levels(i)), ' levels']);   
end  

% Read an image and convert to grayscale if needed
img = imread('sw.jpg');  
if size(img, 3) == 3  % Convert to grayscale if RGB
    img = rgb2gray(img);
end

% Convert image to double for processing
img_double = double(img) / 255; 

% Quantize to 16 levels (0 to 15)
quantized_img = round(img_double * 15); 

% Scale back to 8-bit range (0 to 255) for visualization
expanded_img = uint8(quantized_img * (255 / 15)); 

% Histogram Equalization for Enhancement
equalized_img = histeq(expanded_img); 

% Display Quantization Results
figure; 
subplot(2,2,1), imshow(img), title('Original Image'); 
subplot(2,2,2), imshow(expanded_img), title('4-bit Quantized Image'); 
subplot(2,2,3), imshow(expanded_img), title('Bit-Depth Expanded Image'); 
subplot(2,2,4), imshow(equalized_img), title('After Histogram Equalization');
