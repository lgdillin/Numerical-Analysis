

% Bisection
function [l, r, nf] = bisect(fname, a, b, tol)
    % Function to find the zero of a root bracketing
    % interval for some function fname between a and b
    % returns a bracketing interval which closely approximates
    % the exact answer
    %
    % inputs:
    % fname: function to evaluate
    % a: left side of interval
    % b: right side of interval
    % tol: tolerance of convergence
    %
    % returns:
    % l: left side of the converged bracketing interval
    % r: right side of the converged bracketing interval
    % nf: the total number of function evaluations of fname
    %
    % Note: if nf == -1, then the method failed to converge to tol
    % in 1e6 iterations
    
    if(b > a)
        error('bad interval')
    end
    
    % Evaluate the function at the two endpoints
    fa = feval(fname, a);
    fb = feval(fname, b);
    if(sign(fa) == sign(fb))
        error('Not a root bracketing interval')
    end
    
    nf = 0;
    l = a;
    r = b;
    while(abs(l - r) > tol)
        % Bisect the interval and evaluate
        p0 = (a + b) / 2;
        fp = feval(fname, p0);
        
        % Perhaps we found the zero exactly
        if(fp == 0)
            l = a;
            r = b;
            nf = nf + 1;
            return
        end
        
        if(sign(fp) ~= sign(fa))
            a = p0;
        else
            b = p0;
        end
        nf += 1;
        
        if(nf > 1e6)
            nf = -1;
            break
        end
    end
    l = a;
    r = b;
    return;
end
