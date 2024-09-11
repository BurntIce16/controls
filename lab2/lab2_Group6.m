%u = @(x, theta) (mp + mc)*x(2) + mp*L*theta(2)
%External force F(t): a force of 1N applied to cart after 1s
F = @(t) (t>=1) * 1;

mc= 1.0; % Mass of the cart (kg)
mp= 0.1; % Mass of the pendulum (kg)
L = 0.5; % Length of the pendulum (m)
g = 9.81; % Gravitational acceleration (
% State-space matrices
A = [0 1 0 0; 0 0 -((mp*g)/mc) 0; 0 0 0 1; 0 0 (g*(mp + mc)/(L*mc)) 0];
B = [0; (1/mc); 0; -(1/(L*mc))];
C = [1 0 0 0];
D = 0;
% Time span for the simulation
tspan = 0:0.01:10;
% Define input function (external force F)
u = arrayfun(F, tspan); % Evaluate F(t) over the time span
% Initial state
x0 = [0; 0; 0.523599; 0]; % Initial displacement and velocity
% Simulate the state-space system using lsim
sys = ss(A, B, C, D); % Create the state-space system
[y, t, x] = lsim(sys, u, tspan, x0); % Simulate the response


% Plot the displacement over time (y is the output x1, the displacement)
figure;
plot(t, y, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Displacement (m)');
title('Inverted Pendulum, Pull-Cart Displacement (State-Space)');
grid on;


% Plot the state variables (displacement and velocity) over time
figure;
plot(t, x(:,1), 'LineWidth', 2); hold on;
plot(t, x(:,2), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('States');
legend('Displacement (x_1)', 'Velocity (x_2)');
title('State Variables over Time for Cart');
grid on;

% Plot the state variables (displacement and velocity) over time
figure;
plot(t, x(:,3), 'LineWidth', 2); hold on;
plot(t, x(:,4), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('States');
legend('Displacement (x_3)', 'Velocity (x_4)');
title('State Variables over Time for Inverted Pendulum');
grid on;