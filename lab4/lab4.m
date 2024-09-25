% Define the system transfer function G(s) = 1/(s^2 + 2s + 5)
num = 1;
den = [1 2 5];
G = tf(num, den);

% Define unit step input s
s = 0:0.01:10;

% Create the open-loop transfer function
G = tf(num, den);

% Create a figure for the plots
figure;
hold on;

% Create a legend for the plots
legendEntries = {};
% Create a list to store the PID systems
sys = [];

% Plot the step response of the system with different PID parameters
[sys, legendEntries] = plotPidSystem(1, 0, 0, G, s, legendEntries);
[sys, legendEntries] = plotPidSystem(1, 0.1, 0.125, G, s, legendEntries);
[sys, legendEntries] = plotPidSystem(1, 0, 0.75, G, s, legendEntries);
[sys, legendEntries] = plotPidSystem(1, 0.1, 0.45, G, s, legendEntries);


% Function to plot the step response of the system with a PID controller
function [sys, legendEntries] = plotPidSystem(Kp, Ki, Kd, G, s, legendEntries)
    % Create the PID controller transfer function C(s) = Kp + Ki/s + Kd*s
    C = pid(Kp, Ki, Kd);

    % Create Closed-loop system with the PID controller
    sys = feedback(G, C);

    % Simulate Step response of the closed-loop system
    step(sys, s);


    disp("Kp = " + Kp + ", Ki = " + Ki + ", Kd = " + Kd);

    disp(stepinfo(sys));

    legendEntries{end+1} = ['Kp = ' num2str(Kp) ', Ki = ' num2str(Ki) ', Kd = ' num2str(Kd)];

    % Add a legend entry for the current PID parameters
    legend(legendEntries);
end

% Add a legend to the plot
legend(legendEntries);
hold off;
