% Define different values for the proportional gain K_p
K_p_values = linspace(0,5, 25);
zeta = 0.5;
omega_n = 5;
r=1;
t_span = [0 10];
% Initial conditions [x(0) = 1 (initial displacement), x_dot(0) = 0 (initial velocity)]
X0 = [1; 0];

% Loop through each K_p and plot the step response
figure;
hold on;
for K_p = K_p_values
    sys = @(t, X) [X(2); -2*zeta*omega_n*X(2) - omega_n^2*X(1) + omega_n^2*K_p*(r - X(1))];
    [t, X] = ode45(sys, t_span, X0);
    plot(t, X(:,1), 'LineWidth', 2);
end
legend('K_p = 0.5', 'K_p = 1', 'K_p = 2', 'K_p = 5');
title('Effect of Proportional Gain on System Response');
xlabel('Time (seconds)');
ylabel('Displacement x(t)');
grid on;