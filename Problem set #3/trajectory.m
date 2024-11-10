clc; clear; close all;


% Define the time range for the simulation
time_range = linspace(0, 10, 100);

% (a) Stable node (lambda1 < lambda2 < 0) - non-diagonal matrix
A_a = [-1, 0.5; -0.5, -0.5]; % Both eigenvalues are negative, non-diagonal

% (b) Saddle point (lambda1 < 0 < lambda2) - non-diagonal matrix
A_b = [1, -1; -1, -2]; % Saddle point with non-diagonal terms

% (c) Unstable node (0 < lambda1 < lambda2) - non-diagonal matrix
A_c = [1, 0.5; 0.5, 2]; % Both eigenvalues are positive, non-diagonal

% (d) Stable spiral (lambda = a ± bi, a < 0)
A_d = [-0.5, -1; 1, -0.5]; % Complex eigenvalues with negative real part

% (e) Center (lambda = a ± bi, a = 0)
A_e = [0, -1; 1, 0]; % Pure imaginary eigenvalues (center)

% (f) Unstable spiral (lambda = a ± bi, a > 0)
A_f = [0.5, -1; 1, 0.5]; % Complex eigenvalues with positive real part

% Define multiple initial conditions
initial_conditions = [1, 1; -1, 1; 1, -1; -1, -1; 0.5, 0.5; -0.5, 0.5; 0.5, -0.5];

% Function to calculate and plot trajectories with arrows for multiple initial conditions
function plot_trajectories(A, initial_conditions, time_range, color)
    for j = 1:size(initial_conditions, 1)
        x0 = initial_conditions(j, :)'; 
        
        X = zeros(length(time_range), 2);
        
         for i = 1:length(time_range)
            t = time_range(i);
            X(i, :) = (expm(A * t) * x0).';
        end

        plot_arrows(X, color);
    end
end

function plot_arrows(X, color)
    arrow_step = 10;

    % Plot trajectory line
    plot(X(:, 1), X(:, 2), color, 'LineWidth', 1.5);
    hold on;

    % Add arrows to the plot
    for i = 1:arrow_step:length(X) - arrow_step
        quiver(X(i, 1), X(i, 2), X(i + arrow_step, 1) - X(i, 1), X(i + arrow_step, 2) - X(i, 2), ...
            'AutoScale', 'on', 'AutoScaleFactor', 0.5, 'MaxHeadSize', 0.5, 'Color', color);
    end
end

% Create a larger figure window
figure('Position', [100, 100, 1200, 800]);

% Plot for (a) Stable Node
subplot(3, 2, 1);
plot_trajectories(A_a, initial_conditions, time_range, 'r');
title('Stable Node (a)');
xlabel('x_1');
ylabel('x_2');
axis equal;
grid on;

% Plot for (b) Saddle Point
subplot(3, 2, 2);
plot_trajectories(A_b, initial_conditions, time_range, 'b');
title('Saddle Point (b)');
xlabel('x_1');
ylabel('x_2');
axis equal;
grid on;

% Plot for (c) Unstable Node
subplot(3, 2, 3);
plot_trajectories(A_c, initial_conditions, time_range, 'g');
title('Unstable Node (c)');
xlabel('x_1');
ylabel('x_2');
axis equal;
grid on;

% Plot for (d) Stable Spiral
subplot(3, 2, 4);
plot_trajectories(A_d, initial_conditions, time_range, 'm');
title('Stable Spiral (d)');
xlabel('x_1');
ylabel('x_2');
axis equal;
grid on;

% Plot for (e) Center
subplot(3, 2, 5);
plot_trajectories(A_e, initial_conditions, time_range, 'k');
title('Center (e)');
xlabel('x_1');
ylabel('x_2');
axis equal;
grid on;

% Plot for (f) Unstable Spiral
subplot(3, 2, 6);
plot_trajectories(A_f, initial_conditions, time_range, 'c');
title('Unstable Spiral (f)');
xlabel('x_1');
ylabel('x_2');
axis equal;
grid on;

