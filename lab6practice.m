% Read and convert image to double precision
img = im2double(imread('sw.jpg'));

% Convert to grayscale if image is RGB
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Add Gaussian Noise
gaussian_noise = imnoise(img, 'gaussian', 0, 0.01);
figure, imshow(gaussian_noise); title('Gaussian Noise');

% Add Salt & Pepper Noise
salt_pepper_noise = imnoise(img, 'salt & pepper', 0.05);
figure, imshow(salt_pepper_noise); title('Salt & Pepper Noise');

% Add Speckle Noise
speckle_noise = imnoise(img, 'speckle', 0.04);
figure, imshow(speckle_noise); title('Speckle Noise');

% Apply Averaging Filter to Gaussian Noise
avg_filter = fspecial('average', [5 5]);
img_avg = imfilter(gaussian_noise, avg_filter, 'replicate');
figure, imshow(img_avg); title('Averaging Filter Applied');

% Apply Median Filter to Salt & Pepper Noise
img_median = medfilt2(salt_pepper_noise, [5 5]);  
figure, imshow(img_median); title('Median Filter Applied');

% Fourier Transform and Spectrum Visualization
F = fft2(img);
F_shifted = fftshift(F);

% Compute Log Spectrum and Normalize
log_F = log(1 + abs(F_shifted));

% Display Fourier Spectrum
figure, imshow(log_F, []); title('Fourier Spectrum');


% Read and convert image to double precision
img = im2double(imread('sw.jpg'));

% Convert to grayscale if image is RGB
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Create Motion Blur Filter
H = fspecial('motion', 20, 45);

% Apply Motion Blur
blurred_img = imfilter(img, H, 'conv');
figure, imshow(blurred_img, []); title('Blurred Image');

% Compute Fourier Transform of Blurred Image
F_blurred = fft2(blurred_img);

% Compute Fourier Transform of Motion Blur Kernel
H_f = fft2(H, size(img,1), size(img,2));

% Avoid division by zero by setting a small threshold
H_f(abs(H_f) < 1e-6) = 1e-6;

% Inverse Filtering (Divide in Frequency Domain)
F_restored = F_blurred ./ H_f;

% Convert Back to Spatial Domain (Inverse FFT)
img_restored = real(ifft2(F_restored));

% Display Restored Image
figure, imshow(img_restored, []); title('Inverse Filtering');

img_wiener = deconvwnr(blurred_img, H, 0.01);  
figure, imshow(img_wiener, []); title('Wiener Filter Restored'); 

PSF = fspecial('motion', 20, 45);  
[J, P] = deconvblind(blurred_img, PSF);  
figure, imshow(J, []); title('Blind Deconvolution');

moving = imrotate(img, 10, 'bilinear', 'crop');  
[tform, ~] = imregcorr(moving, img);  
registered_img = imwarp(moving, tform, 'OutputView', imref2d(size(img)));  
figure, imshowpair(img, registered_img, 'montage'); title('Image Registration'); 

moving = imrotate(img, 10, 'bilinear', 'crop');  
[tform, ~] = imregcorr(moving, img);  
registered_img = imwarp(moving, tform, 'OutputView', imref2d(size(img)));  
figure, imshowpair(img, registered_img, 'montage'); title('Image Registration'); 