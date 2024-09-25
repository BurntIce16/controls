% Define the system transfer function G(s) = 1/(s^2 + 2s + 5)
num = 1;
den = [1 2 5];

% Define unit step input s
s = 0:0.01:14;

% Create the open-loop transfer function
G = tf(num, den);

% Define the PID controller gains
Kp_values = [1, 2];
Ki_values = [0, 0.1];
Kd_values = [0, 0.1];

% Create a figure for the plots
figure;
hold on;

% Loop over different PID parameters
for i = 1:length(Kp_values)
    for j = 1:length(Ki_values)
        for k = 1:length(Kd_values)
            Kp = Kp_values(i);
            Ki = Ki_values(j);
            Kd = Kd_values(k);

            % Create the PID controller transfer function C(s) = Kp + Ki/s + Kd*s
            C = pid(Kp, Ki, Kd);

            % Create Closed-loop system with the PID controller
            sys = feedback(G, C);

            % Simulate Step response of the closed-loop system
            step(sys, s);

            % Add a legend entry for the current PID parameters
            legendEntries{i, j, k} = ['Kp = ' num2str(Kp) ', Ki = ' num2str(Ki) ', Kd = ' num2str(Kd)];
        end
    end
end

% Add the legend to the plot
legend(legendEntries(:));
hold off;
