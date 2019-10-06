

function [x, nf] = secant(fname, x0, x1, tol)
    % approximates the zero of a root bracketing
    % interval of the function fname within tolerance tol
    % by using the secant method
    %
    % inputs:
    % fname: function to approximate zero of
    % x0: 
    % x1: 
    % tol: tolerance to declare convergence
    % 
    % returns:
    % x: x-value to approximate the zero
    % nf: number of function iterations
    
    f0 = feval(fname, x0);
    f1 = feval(fname, x1);
    
    if(abs(f1 - f0) < eps)
        error('divide by zero')
    end
    
    nf = 0;
    while(abs(x0 - x1) > tol)
        % Compute the secant value
        xnew = x1 - ((f1 * (x1 - x0)) / (f1 - f0));
        
        x0 = x1;
        x1 = xnew;
        f0 = f1;
        f1 = f(p1);
        nf = nf + 1;
    end
    x = x1;
end