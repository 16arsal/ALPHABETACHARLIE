% Task 1: Load and Convert Image to Frequency Domain 
imgc = imread('sw.jpg');  
imgb=rgb2gray(imgc) 
img = im2double(imgb);  
figure, imshow(img), title('Original Image'); 

F = fft2(img);  
F_shift = fftshift(F);  
magnitude_spectrum = log(1 + abs(F_shift));  
figure, imshow(magnitude_spectrum, []), title('Fourier Magnitude Spectrum'); 


% Task 2: Low-Pass Filtering 

[M, N] = size(img); 
[u, v] = meshgrid(-N/2:N/2-1, -M/2:M/2-1); 

D = sqrt(u.^2 + v.^2); 

D0 = 50; % Cutoff frequency 

ideal_LPF = double(D <= D0); 
butterworth_LPF = 1 ./ (1 + (D / D0).^4); 
gaussian_LPF = exp(-(D.^2) / (2 * (D0^2))); 

% Apply Low-Pass Filters 
F_LPF_ideal = F_shift .* ideal_LPF; 
F_LPF_butter = F_shift .* butterworth_LPF; 
F_LPF_gauss = F_shift .* gaussian_LPF; 
 
% Inverse Fourier Transform 
img_LPF_ideal = real(ifft2(ifftshift(F_LPF_ideal))); 
img_LPF_butter = real(ifft2(ifftshift(F_LPF_butter))); 
img_LPF_gauss = real(ifft2(ifftshift(F_LPF_gauss))); 
 
% Display LPF results 
figure, imshow(img_LPF_ideal, []), title('Ideal Low-Pass Filter'); 
figure, imshow(img_LPF_butter, []), title('Butterworth Low-Pass Filter'); 
figure, imshow(img_LPF_gauss, []), title('Gaussian Low-Pass Filter'); 
 
% Task 3: High-Pass Filtering 
ideal_HPF = double(D > D0); 
butterworth_HPF = 1 - butterworth_LPF; 
gaussian_HPF = 1 - gaussian_LPF; 
 
% Apply High-Pass Filters 
F_HPF_ideal = F_shift .* ideal_HPF; 
F_HPF_butter = F_shift .* butterworth_HPF; 
F_HPF_gauss = F_shift .* gaussian_HPF; 
 
% Inverse Fourier Transform 
img_HPF_ideal = real(ifft2(ifftshift(F_HPF_ideal))); 
img_HPF_butter = real(ifft2(ifftshift(F_HPF_butter))); 
img_HPF_gauss = real(ifft2(ifftshift(F_HPF_gauss))); 
 
% Display HPF results 
figure, imshow(img_HPF_ideal, []), title('Ideal High-Pass Filter'); 
figure, imshow(img_HPF_butter, []), title('Butterworth High-Pass Filter'); 
figure, imshow(img_HPF_gauss, []), title('Gaussian High-Pass Filter');