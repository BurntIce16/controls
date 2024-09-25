% Define a vector of different damping ratios
zeta_values = [0.25, 0.65, 1.75, 2.5];
omega_n = 5;
% Loop through each damping ratio and plot the time-domain response
% Time vector for simulation
t_span = [0 10];
% Initial conditions [x(0) = 1 (initial displacement), x_dot(0) = 0 (initial velocity)]
X0 = [1; 0];
figure;
hold on;
for zeta = zeta_values
    sys = @(t, X) [X(2); -2*zeta*omega_n*X(2) - omega_n^2*X(1)];
    [t, X] = ode45(sys, t_span, X0);
    plot(t, X(:,1), 'LineWidth', 2);
end
legend('zeta = 0.1', 'zeta = 0.5', 'zeta = 1', 'zeta = 1.5');
title('Effect of Damping Ratio on Time-Domain Response');
xlabel('Time (seconds)');
ylabel('Displacement x(t)');
grid on;