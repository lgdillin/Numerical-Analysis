%This is a script file to test your ivp routines.
%
%It erases any file (in the Matlab path) called prog5run.txt, and
%writes output to a file in the Matlab working directory called prog5run.txt.
%
%If your code is working correctly, then you should expect errors to decrease
%as h decreases (until rounding error effects are seen in mspc34), and except
%for h=0.2, you should see
%mspc34 more accurate than rk4 more accurate than Euler.
%The smallest error I got was ~3.6e-14 (mspc34, h=1/320).

if exist('prog5run.txt','file'),
    delete('prog5run.txt')
	disp(' ')
	disp('deleting old prog5run.txt file to make new one')
	disp(' ')
end
diary prog5run.txt

N=[5 20 80 320 1280];  yb = 1+exp(-20)/3;  A = zeros(5,5);%  A = zeros(5,7);
s = zeros(5,35);  s = char(s);
for j=1:5,
    n = N(j);
    we = euler('fofty',0,1,1/3,n);
    wrk4 = rk4('fofty',0,1,1/3,n);
    %wmspc34 = mspc34('fofty',0,1,1/3,n);
    %A(j,:) = [1/n n we(n+1)-yb  4*n wrk4(n+1)-yb 4+2*n wmspc34(n+1)-yb];
    A(j,:) = [1/n n we(n+1)-yb  4*n wrk4(n+1)-yb];
	%s(j,:) = sprintf('%4.1e\t%4d\t%4.1e\t%4d\t%4.1e\t%4d\t%4.1e',abs(A(j,:)));
	s(j,:) = sprintf('%4.1e\t%4d\t%4.1e\t\t%4d\t%4.1e\n',abs(A(j,:)));
end
disp(' ')
%disp('  h is the time step used by all 3 methods')
disp('  h is the time step used by both methods')
disp('  #f is the number of function evals required for the given method')
disp('  error is the absolute error at t=1 for the given method')
disp(' ')
disp('                    Euler        rk4  ')
disp('   h      #f     error        #f    error')
disp(s)
diary off
