function [x1, x2, errflag] = quadroot(a,b,c)
    % function [x1, x2, errflag] = quadroot(a,b,c)
    %
    % RETURNS:
    % x1: The first root
    % x2: The second root
    %
    % Paramters:
    % a: real number
    % b: real number
    % c: real number
    %
    % Flags:
    % 0: two real roots
    % 1: two real, but duplicate roots
    % 2: two complex roots
    % -1: a = 0
    
    % quit if a = 0
    if(a == 0)
        x1 = 0;
        x2 = 0;
        errflag = -1;
        return
    end
    
    % Create normalizing value
    m = max(abs(a), max(abs(b), abs(c)));
    m = 1 / m;
    
    % Normalize the inputs
    a = m * a;
    b = m * b;
    c = m * c;
    
    % Compute the Discriminant
    disc = (b * b) - 4 * a * c;
    
    x1 = 0;
    x2 = 0;
    errflag = 0;
    if(disc < 0) % Complex Roots
        errflag = 2;
        x1 = (-1 * b) / (2 * a); % real portion of the complex pair
        x2 = sqrt(-1 * disc) / (2 * a);
    elseif(disc == 0) % Duplicate roots
        errflag = 1;
        x1 = (-1 * b) / (2 * a);
        x1 = x2;
    else % Two unique, real roots
        errflag = 0;
        x1 = (-1 * b + sqrt(disc)) / (2 * a);
        x2 = (-1 * b - sqrt(disc)) / (2 * a);
    end
    
    % Rescale the values
    m = 1 / m;
    
end