function w = rk4(f, a, b, alpha, N)
    % function w = rk4(f, a, b, alpha, N)
    %
    % Obtains a numerical solution to a first-order differential equation
    % Using a fourth order Runge-Kutta method
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
        % k_i = h * f(t_j, w_j)
        k1 = h * feval(f, (a + j * h), alpha);
        k2 = h * feval(f, (a + j * h) + (h/2), alpha + (k1/2));
        k3 = h * feval(f, (a + j * h) + (h/2), alpha + (k2/2));
        k4 = h * feval(f, (a + j * h) + h, alpha + k3);
        alpha = alpha + (1/6) * (k1 + 2*k2 + 2*k3 + k4);
        
        w(j+2) = alpha;
    end
    
end