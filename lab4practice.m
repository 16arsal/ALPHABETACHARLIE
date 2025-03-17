% Task 1: Load and Display Image 
imgc = imread('sw.jpg');  
img=rgb2gray(imgc); 
 
% Point Processing Techniques 
neg_img = 255 - img;             
figure, imshow(neg_img), title('Negative Image'); 
 
% Contrast Stretching 
min_val = double(min(img(:))); 
max_val = double(max(img(:))); 
stretched_img = uint8(255 * (double(img) - min_val) / (max_val - min_val)); 
figure, imshow(stretched_img), title('Contrast Stretched Image'); 
 
% Thresholding 
threshold = 128; % Set threshold value 
binary_img = img > threshold; 
figure, imshow(binary_img), title('Thresholded Image'); 
 
% Log & Power-Law Transformations 
c = 255 / log(1 + max(double(img(:)))); 
log_img = uint8(c * log(1 + double(img))); 
figure, imshow(log_img), title('Log Transformation'); 
 
gamma = 0.5; % Example value for power-law transformation 
gamma_img = uint8(255 * (double(img) / 255) .^ gamma); 
figure, imshow(gamma_img), title('Gamma Correction (Power-Law)'); 
 
% Neighborhood Processing (Filtering) 
h_avg = fspecial('average', [5 5]); % Averaging filter 
smoothed_avg = imfilter(img, h_avg); 
figure, imshow(smoothed_avg), title('Averaging Filter'); 
 
h_gauss = fspecial('gaussian', [5 5], 1); % Gaussian filter 
smoothed_gauss = imfilter(img, h_gauss); 
figure, imshow(smoothed_gauss), title('Gaussian Filter'); 
 
smoothed_median = medfilt2(img, [5 5]); % Median filter 
figure, imshow(smoothed_median), title('Median Filter'); 
 
% Image Sharpening 
h_laplacian = fspecial('laplacian', 0.2); 
sharpened_laplacian = imfilter(img, h_laplacian); 
figure, imshow(sharpened_laplacian, []), title('Laplacian Filter'); 
 
sharpened_unsharp = imsharpen(img); % Unsharp Masking 
figure, imshow(sharpened_unsharp), title('Unsharp Masking'); 
 
% Edge Detection 
sobel_edges = edge(img, 'sobel'); 
prewitt_edges = edge(img, 'prewitt'); 
canny_edges = edge(img, 'canny'); 

% Display Edge Detection Results 
figure, imshow(sobel_edges), title('Sobel Edge Detection'); 
figure, imshow(prewitt_edges), title('Prewitt Edge Detection'); 
figure, imshow(canny_edges), title('Canny Edge Detection'); 