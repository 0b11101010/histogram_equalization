% author : erhan akagunduz

image1 = imread('can4_25_09.png');
image1 = double(image1);
% add 1 to 1-to-1 mapping, matlab has no 0 index
image1 = image1 + 1;
image2 = imread('can9_2_13.png');
image2 = double(image2);
image2 = image2 + 1;

% Calculate normalized histogram of image-1
normalizedHistIm1 = calculateNormalizedHistogram(image1);
% Calculate normalized histogram of image-2
normalizedHistIm2 = calculateNormalizedHistogram(image2);

% Uniform histogram of image-1
histEqualizedImage1 = equalizeHistogram(image1);
% Calculate histogram of uniformed histogram image-1
normHistOfHistEqualizedIm1 = calculateNormalizedHistogram(histEqualizedImage1);
% Save the uniformed image-1
histEqualizedImage1 = histEqualizedImage1 - 1;
histEqualizedImage1 = uint8(histEqualizedImage1);
imwrite(histEqualizedImage1, 'histEqualizedImage1.png');

%Uniform histogram of image-2
histEqualizedImage2 = equalizeHistogram(image2);
% Calculate histogram of uniformed histogram image-2
normHistOfHistEqualizedIm2 = calculateNormalizedHistogram(histEqualizedImage2);
% Save the uniformed image-2
histEqualizedImage2 = histEqualizedImage2 - 1;
histEqualizedImage2 = uint8(histEqualizedImage2);
imwrite(histEqualizedImage2, 'histEqualizedImage2.png');

% Calculate cdf map of image-1
Tr = calculateCumulativeDistributionFunctionMap(normalizedHistIm1);
% Calculate cdf map of image-2
Gz = calculateCumulativeDistributionFunctionMap(normalizedHistIm2);
% Calculate inverse map of image-2
inverseGz = calculateInverseFunctionMap(Gz);

% Calculate histogram matching map of new image
[m, n] = size(inverseGz);
Hr = zeros(m, n);
for i = 1 : length(inverseGz);
       Hr(i) = inverseGz(Tr(i)); 
end

% Calculate pixel values of new image using
% histogram matching map
[m, n] = size(image1);
newImage = zeros(m,n);
for i = 1 : m
    for j = 1 : n
        newImage(i,j) = Hr(image1(i,j));
    end
end

% Calculate normalized histogram of new image
normalizedHistNewIm = calculateNormalizedHistogram(newImage);
newImage = uint8(newImage - 1);
imwrite(newImage, 'newImage.png');

figure(1);
title('Original Histogram of Image-1');
bar(normalizedHistIm1, 'b');

figure(2);
title('Original Histogram of Image-2');
bar(normalizedHistIm2, 'b');

figure(3);
title('Uniform Histogram of Image-1 by Using Tr');
bar(normHistOfHistEqualizedIm1, 'b');

figure(4);
title('Uniform Histogram of Image-2 by Using Gz');
bar(normHistOfHistEqualizedIm2, 'b');

figure(5);
title('Histogram of New Image by Using InverseGz[Tr]');
bar(normalizedHistNewIm, 'b');

% Plot all images together
figure(6);
subplot(3,1,1);
title('Image-1');
imshow(uint8(image1));

subplot(3,1,2);
title('New Image');
imshow(newImage);

subplot(3,1,3);
title('Image-2');
imshow(uint8(image2));