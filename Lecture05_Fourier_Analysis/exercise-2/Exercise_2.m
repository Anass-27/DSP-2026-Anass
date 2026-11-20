
clear;
clc;
close all;

% Sampling frequency
fs = 200;

% Recording duration
T = 1;

% Time samples
t = 0:1/fs:T-1/fs;

% Create a signal with two frequencies
x = 0.8*sin(2*pi*15*t) + 0.4*sin(2*pi*40*t);

% Display number of samples
N = length(x);

disp('Number of samples:');
disp(N);


% Plot the signal in the time domain
figure;

plot(t, x);
grid on;

xlabel('Time (s)');
ylabel('Amplitude');
title('Signal with 15 Hz and 40 Hz');

% Save the time-domain graph
saveas(gcf, 'two-frequency-time.png');


%% Calculate the FFT

% Number of samples
N = length(x);

% Calculate the Fast Fourier Transform
Y = fft(x);

% Calculate the two-sided spectrum
P2 = abs(Y/N);

% Calculate the single-sided spectrum
P1 = P2(1:N/2+1);

% Double the amplitudes except DC and Nyquist
P1(2:end-1) = 2*P1(2:end-1);

% Create the frequency axis
f = fs*(0:N/2)/N;


%% Plot the frequency spectrum

figure;

plot(f, P1);
grid on;

xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Single-Sided Amplitude Spectrum');

% Save the spectrum
saveas(gcf, 'two-frequency-spectrum.png');



%% Calculate frequency-bin spacing

df = fs/N;

disp('Frequency-bin spacing (Hz):');
disp(df);
