# Lab 1

## Q5

>dydt.m

```matlab
%helper function
function dydt = dydt(t, y)
    A = [0 1; -10 -7];
    dydt = A * y;
end
```

>Lab1Problem5.m

```matlab
%y''+7y'+10y=0
%y1=y
%y2=y'
%y1'=2
%y'2=-7y2-10y1

tspan = [0 10]; 
y0 = [2; 0.1]; % Initial conditions y(0)=2 and y'(0)=0.1
[t, y] = ode45(@dydt, tspan, y0);

% Plot the results
plot(t, y(:, 1))
xlabel('Time (s)')
ylabel('y(t)')
title('Solution of y'''' + 7y'' + 10y = 0')
```

![plot](Q5Plot.png)
