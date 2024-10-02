%% Do not use rlocus function in MATLAB.
%% PART 1
% G(s) = 1/(s(s+2)(s+5))
% G(s) = 1/(s(s^2+7s+10))
% G(s) = 1/(s^3+7s^2+10s)

% Determine the closed-loop system’s transfer function using the open loop G(s)

% syms g s k
% 
% g = 1/(s*(s^2+7*s+10));
% 
% tf = (g*k)/(1+g*k);
% 
% disp(tf);
% 
% % Calculate the roots (poles) of the closed-loop system using its characteristics equation for k epsilon [0, 100]
% % Plot all calculated roots on a complex plane. 
% 
% figure;
% hold on;
% for k = 0:100
%     eq = (s^3+7*s^2+10*s) + k;
%     roots = solve(eq, s);
%     plot(real(roots), imag(roots), 'o');
% end
% title("Roots of the Closed-Loop System");

% Analyze system’s performance when K is varied based on its Root Locus plot. 
% e.g., where are the poles when K is at a certain value? What does the system response look like when K is within a certain range (e.g., a shorter response time? A higher frequency)? 


%% PART 2


% Use rlocus function in MATLAB to plot the Root Locus of the system.

k = 0:0.5:100;

% Define the transfer function using the tf function
tff = tf(1, [1 7 10 0]);

disp(k)

% Plot the root locus
figure;
rlocus(tff, k);
title('Root Locus of the System');
xlabel('Real Axis');
ylabel('Imaginary Axis');
grid on;
title('Root Locus of the System');
