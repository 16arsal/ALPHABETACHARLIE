% Task 1: Load and Display Image 
img = imread('cameraman.tif');  
figure, imshow(img), title('Original Image'); 
 
% Task 2: Scaling & Rotation 
scaled_img_small = imresize(img, 0.5);  
scaled_img_large = imresize(img, 2);    
rotated_img_45 = imrotate(img, 45);     
rotated_img_90 = imrotate(img, 90);     
 
% Display results 
figure, imshow(scaled_img_small), title('Scaled Image (50%)'); 
figure, imshow(scaled_img_large), title('Scaled Image (200%)'); 
figure, imshow(rotated_img_45), title('Rotated Image (45°)'); 
figure, imshow(rotated_img_90), title('Rotated Image (90°)'); 
 
% Task 3: Translation & Reflection 
horiz_flip = fliplr(img); 
vert_flip = flipud(img); 
 
% Display reflections 
figure, imshow(horiz_flip), title('Horizontally Flipped'); 
figure, imshow(vert_flip), title('Vertically Flipped'); 
 
% Task 4: Contrast Adjustment 
contrast_img = imadjust(img); 
histeq_img = histeq(img); 
 
% Display contrast adjustments 
figure, imshow(contrast_img), title('Contrast Adjusted'); 
figure, imshow(histeq_img), title('Histogram Equalization'); 
 
% Display Histograms 
figure, imhist(img), title('Original Histogram'); 
figure, imhist(histeq_img), title('Equalized Histogram'); 
 
% Task 5: Log & Gamma Transformations 
c = 1; % Scaling factor ,c is a scaling factor that controls the  
%brightness.A larger c makes the image brighter.                        
log_transform = c * log(1 + double(img));  
gamma_transform_1 = imadjust(img, [], [], 0.5); 
gamma_transform_2 = imadjust(img, [], [], 2.2); 
 
% Display log and gamma transformations 
figure, imshow(mat2gray(log_transform)), title('Log Transformation'); 
figure, imshow(gamma_transform_1), title('Gamma Correction (γ = 0.5)'); 
figure, imshow(gamma_transform_2), title('Gamma Correction (γ = 2.2)') 