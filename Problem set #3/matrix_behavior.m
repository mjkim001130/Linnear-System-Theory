clc; clear; close all;

% Define the matrices A1, A2, A3
A1 = [1/2, -1/2;
      1/2, -1/2];

A2 = [0, 1;
     -1, 0];

A3 = [1, 0, 0;
      0, -2, 0;
     -3, 0, -2];

% Define the initial conditions
x0_A1 = [1; 1];
x0_A2 = [1; 1]; 
x0_A3 = [1; 1; 1]; 

% Define the time range for simulation
time_range = linspace(0, 10, 300); 

x_A1 = zeros(length(time_range), length(x0_A1));
x_A2 = zeros(length(time_range), length(x0_A2));
x_A3 = zeros(length(time_range), length(x0_A3));

% Compute solutions using matrix exponential
for i = 1:length(time_range)
    t = time_range(i);
    x_A1(i, :) = (expm(A1 * t) * x0_A1).'; % Solution for A1
    x_A2(i, :) = (expm(A2 * t) * x0_A2).'; % Solution for A2
    x_A3(i, :) = (expm(A3 * t) * x0_A3).'; % Solution for A3
end

% Plot the results for A1
figure;
subplot(3, 1, 1);
plot(time_range, x_A1(:, 1), 'r', 'LineWidth', 2, 'DisplayName', 'x_1(t)');
hold on;
plot(time_range, x_A1(:, 2), 'b--', 'LineWidth', 2, 'DisplayName', 'x_2(t)');
xlabel('Time');
ylabel('State Variables');
title('A1');
legend;
grid on;

% Plot the results for A2
subplot(3, 1, 2);
plot(time_range, x_A2(:, 1), 'r', 'LineWidth', 2, 'DisplayName', 'x_1(t)');
hold on;
plot(time_range, x_A2(:, 2), 'b--', 'LineWidth', 2, 'DisplayName', 'x_2(t)');
xlabel('Time');
ylabel('State Variables');
title('A2');
legend;
grid on;

% Plot the results for A3
subplot(3, 1, 3);
plot(time_range, x_A3(:, 1), 'r', 'LineWidth', 2, 'DisplayName', 'x_1(t)');
hold on;
plot(time_range, x_A3(:, 2), 'b--', 'LineWidth', 2, 'DisplayName', 'x_2(t)');
plot(time_range, x_A3(:, 3), 'g:', 'LineWidth', 2, 'DisplayName', 'x_3(t)');
xlabel('Time');
ylabel('State Variables');
title('A3');
legend;
grid on;


