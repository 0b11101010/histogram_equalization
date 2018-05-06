function inverseFunctionMap = calculateInverseFunctionMap(functionMap)
    l = length(functionMap);
    inverseFunctionMap = zeros(l, 1);
    
    % Calculate inverse map values
    % There is only one value in function map
    % to calculate inverse map.
    for i = 1 : l
        v = find(functionMap(:) == (i));
        if 1 == length(v)
            inverseFunctionMap(i) = v(1);
        end
    end
    
    % Calculate the values which are zeros by
    % approximating value.
    inverseFunctionMap(1) = min(functionMap);
    inverseFunctionMap(l) = max(functionMap);
    i = 2;
    while i < l
    
        % find the first zero
        a = i;
        while (inverseFunctionMap(a) > 0)
            a = a + 1;
        end
    
        %find number other than 0 or boundary
        b = a;
        while (inverseFunctionMap(b) == 0)
            b = b + 1;
        end
    
        % Calculate the step value to assign new values
        % to zero valued positions
        step = (inverseFunctionMap(b) - inverseFunctionMap(a - 1)) / (b - (a - 1));
    
        % First value to be used to calculate new value
        value = inverseFunctionMap(a - 1);
        % Assign new values to zero valued positions
        k = 1;
        for j = a : b - 1
            inverseFunctionMap(j) = round(value + k * step);
            k = k+1;
        end
    
        i = b;
    end
end