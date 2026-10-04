%% Assignment 1 - Visualizing Simple Signals
clear;
close all;
clc;

%% Basic parameters
Fs = 1000;                 % Sampling frequency (Hz)
t = 0:1/Fs:1;              % Time vector (1 second)

%% 1. Generate a 5 Hz sine wave
f = 5;
x = sin(2*pi*f*t);

figure;
plot(t, x);
xlabel('Time (s)');
ylabel('Amplitude');
title('5 Hz Sine Wave');
grid on;

%% 2. Compare frequencies: 2 Hz, 5 Hz, 10 Hz
x2  = sin(2*pi*2*t);
x5  = sin(2*pi*5*t);
x10 = sin(2*pi*10*t);

figure;
plot(t, x2, 'LineWidth', 1.2);
hold on;
plot(t, x5, 'LineWidth', 1.2);
plot(t, x10, 'LineWidth', 1.2);
hold off;

xlabel('Time (s)');
ylabel('Amplitude');
title('Frequency Comparison');
legend('2 Hz', '5 Hz', '10 Hz');
grid on;

saveas(gcf, 'frequency_comparison.png');

%% 3. Compare amplitudes: 0.5, 1, 2
f = 5;

xA1 = 0.5*sin(2*pi*f*t);
xA2 = 1.0*sin(2*pi*f*t);
xA3 = 2.0*sin(2*pi*f*t);

figure;
plot(t, xA1, 'LineWidth', 1.2);
hold on;
plot(t, xA2, 'LineWidth', 1.2);
plot(t, xA3, 'LineWidth', 1.2);
hold off;

xlabel('Time (s)');
ylabel('Amplitude');
title('Amplitude Comparison');
legend('A = 0.5', 'A = 1', 'A = 2');
grid on;

saveas(gcf, 'amplitude_comparison.png');

%% 4. Add noise to a signal
clean_signal = sin(2*pi*5*t);

noise = 0.4*randn(size(t));
noisy_signal = clean_signal + noise;

figure;
plot(t, clean_signal, 'LineWidth', 1.2);
hold on;
plot(t, noisy_signal);
hold off;

xlabel('Time (s)');
ylabel('Amplitude');
title('Clean vs Noisy Signal');
legend('Clean signal', 'Noisy signal');
grid on;

saveas(gcf, 'clean_vs_noisy_signal.png');