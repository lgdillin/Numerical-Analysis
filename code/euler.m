function w = euler(f, a, b, alpha, N)
    % function w = euler(f, a, b, alpha, N)
    %
    % Obtains a numerical solution to a first-order differential equation
    % (IVP) Using Eulers method
    %
    % parameters:
    % f: name/designation of function to evaluate
    % a: left endpoint of interval [a,b]
    % b: right endpoint of interval [a,b]
    % alpha: initial value to the IVP
    % N: number of sub-intervals
    %
    % returns:
    % w: vector approximation of function f over [a,b]
    
    % Initialize our vector w
    w = 1:(N+1);
    w(1) = alpha;
    
    % Compute step size h
    h = (b - a) / N;
    
    for j = 0 : (N-1)
        y = feval(f, (a + j * h), alpha);
        alpha = alpha + (h * y);
        w(j+2) = alpha;
    end
end