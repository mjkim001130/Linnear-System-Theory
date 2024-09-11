% rlc_simulation.m
close all;

% Time span for simulation
t0 = 0; tf = 50;
tspan = [t0, tf];

% Initial conditions: [Vc(0), I(0)]
x0 = [0.5, 0]'; 

% Solve the differential equations using ode45
%[t, x] = ode45(@rlc_sys, tspan, x0);
 [t, x] = ode45(@rlc_ss, tspan, x0); % Alternative way using matrix form

% Plot the results
figure(1)
plot(t, x);
legend('V_c', 'I');
title('Time Response of V_c and I');
xlabel('Time (s)');
ylabel('States');
grid on;

figure(2)
plot(x(:,1), x(:,2));
xlabel('V_c');
ylabel('I');
title('V_c and I');
grid on;

