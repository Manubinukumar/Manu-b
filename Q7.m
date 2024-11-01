% Parameters
T = 2 * pi;          % Period
t = 0:0.01:2*T;     % Time vector
x = zeros(size(t)); % Initialize square wave

% Define the square wave
for i = 1:length(t)
    if mod(t(i), T) < pi
        x(i) = 1;
    else
        x(i) = -1;
    end
end

% Number of terms for approximations
N_values = [5, 10, 20];

% Prepare the figure
figure;

% Plot the square wave
subplot(length(N_values) + 1, 1, 1);
plot(t, x, 'k', 'LineWidth', 2);
title('Square Wave x(t)');
xlabel('Time (s)');
ylabel('x(t)');
grid on;

% Fourier series approximation
for j = 1:length(N_values)
    N = N_values(j);
    y_approx = zeros(size(t)); % Initialize the approximation

    % Sum the first N terms of the Fourier series
    for n = 1:N
        bn = (2 * (1 - (-1)^n)) / (n * pi); % Calculate b_n
        y_approx = y_approx + bn * sin(n * t); % Add the n-th term
    end

    % Plot the approximation
    subplot(length(N_values) + 1, 1, j + 1);
    plot(t, y_approx, 'r', 'LineWidth', 2);
    title(['Fourier Series Approximation (N = ', num2str(N), ')']);
    xlabel('Time (s)');
    ylabel('y(t)');
    grid on;
end
