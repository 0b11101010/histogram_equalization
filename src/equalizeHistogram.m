function histEqIm = equalizeHistogram(I2D)
    normalizedHistogram = calculateNormalizedHistogram(I2D);
    cdfMap = calculateCumulativeDistributionFunctionMap(normalizedHistogram)
    
    [m, n] = size(I2D);
    histEqIm = zeros(m, n);
    histEqIm = double(histEqIm);
    
    for i = 1 : m
        for j = 1 : n
            histEqIm(i,j) = cdfMap(I2D(i,j));
            %histEqIm(i,j) = I2D(cdfMap(i), cdfMap(j));
        end
    end
end