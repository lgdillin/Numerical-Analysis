


function p = lagrangeval(x, y, w)
    % function p = lagrangeval(x, y, w)
    %
    % produces a lagrange interpolating polynomial of degree at most n
    % (where n is the number of knots)
    % and evaluates the interpolating polynomial at each value provided
    % by the vector w
    %
    % returns:
    % p: a vector of the approximated values of the interpolating function
    %    evaluated at a set of inputs given by w.
    %
    % inputs:
    % x: a vector of the x-components (nodes) of the knots
    % y: a vector of the y-components of the knots
    % w: a vector of input values to evaluate the interpolating function at
    
    n = length(x)-1;
    wl = length(w);
    p = 1:wl;
    
    % create the table for the Q matrix
    q = zeros(n+1, n+1);
    q(:,1) = y; % populates 1st column of Q with y values (per Neville's method)
    
    for k = 1 : wl
        for i = 1 : n
            for j = 1 : i
                denominator = (x(i+1) - x(i-j+1));
                
                % prevent divide by zero
                if(denominator == 0)
                    denominator = 1e-50;
                end
                
                numerator = (w(k) - x(i-j+1)) * q(i+1, j) - (w(k) - x(i+1)) * q(i, j);
                q(i+1,j+1) = numerator / denominator;
            end
        end
        p(k) = q(n+1,n+1);
    end
end