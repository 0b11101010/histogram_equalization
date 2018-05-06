function v_o = interpolateLinear(v_i)
    
    l = length(v_i);
    
    [m, n] = size(v_i);
    v_o = zeros(m,n);
    
    v_o(1) = min(v_i);
    v_o(l) = max(v_i);
    i = 2;
    while i < l
    
        % find the first zero
        a = i;
        while (v_o(a) > 0)
            a = a + 1;
        end
    
        %find number other than 0 or boundary
        b = a;
        while (v_o(b) == 0)
            b = b + 1;
        end
    
        % Calculate the step value to assign new values
        % to zero valued positions
        step = (v_o(b) - v_o(a - 1)) / (b - (a - 1));
    
        % First value to be used to calculate new value
        value = v_o(a - 1);
        % Assign new values to zero valued positions
        k = 1;
        for j = a : b - 1
            v_o(j) = round(value + k * step);
            k = k+1;
        end
    
        i = b;
    end
end
