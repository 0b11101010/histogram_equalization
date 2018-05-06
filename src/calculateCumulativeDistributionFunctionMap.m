function cdf = calculateCumulativeDistributionFunctionMap(histogram)
    [m, n] = size(histogram);
    sz = m * n;
    cdf = zeros(sz, 1);
    
    sum = 0;
    for i = 1 : sz
        sum = sum + histogram(i);
        cdf(i) = sum;
    end
    
    % Convert cdf to cdf map to use in calculations
    for i = 1 : sz
       cdf(i) = round(cdf(i) * 255) + 1;
    end
    
end