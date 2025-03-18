[M, N] = size(img); 
[u, v] = meshgrid(-N/2:N/2-1, -M/2:M/2-1); 

D = sqrt(u.^2 + v.^2); 

D0 = 50; 

ideal_LPF = double(D <= D0); 
butterworth_LPF = 1 ./ (1 + (D / D0).^4); 
gaussian_LPF = exp(-(D.^2) / (2 * (D0^2))); 


img_wiener = deconvwnr(blurred_img, H, 0.01);  
figure, imshow(img_wiener, []); title('Wiener Filter Restored'); 

PSF = fspecial('motion', 20, 45);  
[J, P] = deconvblind(blurred_img, PSF);  
figure, imshow(J, []); title('Blind Deconvolution');

moving = imrotate(img, 10, 'bilinear', 'crop');  
[tform, ~] = imregcorr(moving, img);  
registered_img = imwarp(moving, tform, 'OutputView', imref2d(size(img)));  
figure, imshowpair(img, registered_img, 'montage'); title('Image Registration'); 

block_size = 8; 

num_rows = floor(rows /block_size) * block_size;
num_cols = floor(cols / block_size) * block_size; 

cropped_img = gray_img(1:num_rows, 1:num_cols);

blocks = mat2cell(cropped_img, repmat(block_size, 1,num_rows/block_size), repmat(block_size, 1, num_cols/block_size));

montage(blocks, 'Size', [num_rows/block_size, num_cols/block_size]); title(['Non-Overlapping ', num2str(block_size),
'x', num2str(block_size), ' Blocks']);
