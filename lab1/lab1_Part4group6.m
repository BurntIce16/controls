% Part A
A = randn(3,3);
B = eye(3);
C = A + B;
D = C*[2;5;9];

% Part B
figure;
t = 0:0.01:10;
y = sin(t);
plot(t,y);
hold on;
title('Sin of 0 to 10 seconds');
xlabel('Time');
ylabel('sin()');
hold off;

% Part C
figure;
[x,y] = meshgrid(-3:0.1:3, -1:0.1:5);
z = x.^2 + y.^2;
surf(x,y,z);
hold on;
title('Square of X + Square of Y');
xlabel('Time');
ylabel('sin()');
zlabel('X^2 + Y^2');
hold off;

% Part D
s = tf('s');
func = s^4 + 3*s^3 - 15*s^2 - 2*s + 9;
roots = zero(func);
