
clear;
clc;
close all;

% Sampling frequency
fs = 200;

% Recording duration
T = 1;

% Time samples
t = 0:1/fs:T-1/fs;

% Last digit of student number
d = 6; 

% Second frequency
f2 = 13.2 + 0.17*d;

% Create the signal
x = 0.8*sin(2*pi*15*t) + 0.4*sin(2*pi*f2*t);

% Number of samples
N = length(x);

% Display the second frequency
disp('Second frequency (Hz):');
disp(f2);


%% Calculate FFT for one-second recording

% Calculate the FFT
Y = fft(x);

% Two-sided amplitude spectrum
P2 = abs(Y/N);

% Single-sided amplitude spectrum
P1 = P2(1:N/2+1);

% Correct the amplitudes
P1(2:end-1) = 2*P1(2:end-1);

% Frequency axis
f = fs*(0:N/2)/N;

% Calculate frequency-bin spacing
df = fs/N;

disp('Frequency-bin spacing (Hz):');
disp(df);



%% Plot one-second spectrum

figure;

plot(f, P1);
grid on;

xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Spectral Leakage - 1 Second');

% Focus on the interesting frequencies
xlim([0 30]);

% Save the graph
saveas(gcf, 'leakage-1-second.png');


%% Four-second recording

% Recording duration
T4 = 4;

% Time samples for 4 seconds
t4 = 0:1/fs:T4-1/fs;

% Create the same signal with a longer duration
x4 = 0.8*sin(2*pi*15*t4) + 0.4*sin(2*pi*f2*t4);

% Number of samples
N4 = length(x4);

disp('Number of samples for 4 seconds:');
disp(N4);


%% Calculate FFT for 4 seconds

% Calculate FFT
Y4 = fft(x4);

% Two-sided amplitude spectrum
P2_4 = abs(Y4/N4);

% Single-sided amplitude spectrum
P1_4 = P2_4(1:N4/2+1);

% Correct amplitudes
P1_4(2:end-1) = 2*P1_4(2:end-1);

% Frequency axis
f4 = fs*(0:N4/2)/N4;

% Frequency-bin spacing
df4 = fs/N4;

disp('Frequency-bin spacing for 4 seconds (Hz):');
disp(df4);


%% Plot four-second spectrum

figure;

plot(f4, P1_4);
grid on;

xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Spectral Leakage - 4 Seconds');

xlim([0 30]);

% Save the graph
saveas(gcf, 'leakage-4-seconds.png');


%% Zero-padding the 1-second signal

% Original number of samples
N = length(x);

% FFT length with zero-padding
Npad = 4*N;

% Calculate FFT with zero-padding
Ypad = fft(x, Npad);

% Two-sided amplitude spectrum
P2pad = abs(Ypad/N);

% Single-sided amplitude spectrum
P1pad = P2pad(1:Npad/2+1);

% Correct amplitudes
P1pad(2:end-1) = 2*P1pad(2:end-1);

% Frequency axis
fpad = fs*(0:Npad/2)/Npad;

% Frequency-bin spacing
dfpad = fs/Npad;

disp('Zero-padded FFT bin spacing (Hz):');
disp(dfpad);


%% Plot zero-padded spectrum

figure;

plot(fpad, P1pad);
grid on;

xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Spectral Leakage - Zero-Padded FFT');

xlim([0 30]);

% Save the graph
saveas(gcf, 'leakage-zero-padded.png');


%% Compare all three spectra

figure;

subplot(3,1,1);
plot(f, P1);
grid on;
title('1-Second Recording');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
xlim([0 30]);

subplot(3,1,2);
plot(f4, P1_4);
grid on;
title('4-Second Recording');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
xlim([0 30]);

subplot(3,1,3);
plot(fpad, P1pad);
grid on;
title('1-Second Recording with Zero-Padding');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
xlim([0 30]);

% Save comparison figure
saveas(gcf, 'leakage-comparison.png');

