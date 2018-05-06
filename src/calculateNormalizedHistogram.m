function histogram = calculateNormalizedHistogram(I2D)
    [m,n] = size(I2D);
    length = m * n;
    I1D = reshape(I2D, length, 1);
    histogram = double(zeros(256, 1));
    
    for i = 1 : length
        histogram(I1D(i)) = histogram(I1D(i)) + 1;
    end
    
    % Normalize the histogram
    histogram = histogram / length;
end