clear;
close all;
clc;

%% Basic settings

fs = 1000;          % Sampling frequency
duration = 1;       % Duration in seconds
t = 0:1/fs:duration-1/fs;

%% Task 1 - Create a 5 Hz sine wave

amplitude = 1;
frequency = 5;

x = amplitude * sin(2*pi*frequency*t);

figure;

plot(t, x, 'LineWidth', 1.5);

grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('5 Hz Sine Wave');

%% Task 2 - Compare Different Frequencies

x2 = sin(2*pi*2*t);      % 2 Hz
x5 = sin(2*pi*5*t);      % 5 Hz
x10 = sin(2*pi*10*t);    % 10 Hz

figure;

subplot(3,1,1);
plot(t, x2, 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('2 Hz Sine Wave');

subplot(3,1,2);
plot(t, x5, 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('5 Hz Sine Wave');

subplot(3,1,3);
plot(t, x10, 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('10 Hz Sine Wave');

saveas(gcf, 'frequency_comparison.png');

%% Task 3 - Compare Different Amplitudes

frequency = 5;   % Same frequency for all signals

xA05 = 0.5 * sin(2*pi*frequency*t);
xA1  = 1.0 * sin(2*pi*frequency*t);
xA2  = 2.0 * sin(2*pi*frequency*t);

figure;

subplot(3,1,1);
plot(t, xA05, 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Amplitude = 0.5');

subplot(3,1,2);
plot(t, xA1, 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Amplitude = 1');

subplot(3,1,3);
plot(t, xA2, 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Amplitude = 2');

saveas(gcf, 'amplitude_comparison.png');

%% Task 4 - Add Noise

clean_signal = sin(2*pi*5*t);

% Add random noise
noise = 0.4 * randn(size(t));
noisy_signal = clean_signal + noise;

figure;

% Clean signal
subplot(2,1,1);
plot(t, clean_signal, 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Clean 5 Hz Signal');

% Noisy signal
subplot(2,1,2);
plot(t, noisy_signal, 'LineWidth', 1);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Noisy 5 Hz Signal');

saveas(gcf, 'clean_vs_noisy_signal.png');