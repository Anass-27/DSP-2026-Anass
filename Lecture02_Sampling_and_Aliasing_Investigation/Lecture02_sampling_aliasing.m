clear;
close all;
clc;

%% Task 1 - Original Signal

f = 10;                 % Signal frequency = 10 Hz
t = 0:0.0001:1;         % Time from 0 to 1 second

x = sin(2*pi*f*t);

figure;
plot(t, x, 'LineWidth', 1.2);
title('Original 10 Hz Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

saveas(gcf, 'original_signal.png');

%% Task 2 - Different Sampling Frequencies

Fs_values = [15 20 25 50 100];

for i = 1:length(Fs_values)

    Fs = Fs_values(i);       % Sampling frequency
    Ts = 1/Fs;               % Sampling period

    ts = 0:Ts:1;             % Sampling times
    xs = sin(2*pi*f*ts);     % Sampled signal

    figure;

    % Original signal
    plot(t, x, 'LineWidth', 1.2);
    hold on;

    % Sampled points
    stem(ts, xs, 'filled');

    hold off;

    title(['Sampling at ', num2str(Fs), ' Hz']);
    xlabel('Time (s)');
    ylabel('Amplitude');
    legend('Original Signal', 'Sampled Points');
    grid on;

    saveas(gcf, ['sampling_', num2str(Fs), 'Hz.png']);
end
