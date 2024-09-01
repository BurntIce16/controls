%helper function
function dydt = dydt(t, y)
    A = [0 1; -10 -7];
    dydt = A * y;
end