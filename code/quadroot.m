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
    
    % Compute the Discriminant
    disc = (b * b) - 4 * a * c;
    
    if(disc < 0) % Complex Roots
        errflag = 2;
    elseif(disc == 0) % Duplicate roots
        errflag = 1;
        x1 = (-1 * b) / (2 * a);
        x1 = x2;
    else % Two unique, real roots
        errflag = 0;
        x1 = (-1 * b + sqrt(disc)) / (2 * a);
        x2 = (-1 * b - sqrt(disc)) / (2 * a);
    end
end