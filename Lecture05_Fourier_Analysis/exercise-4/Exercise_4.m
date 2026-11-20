
clear;
clc;
close all;

%% Define the sequence

x = [1 1 1 1];

% Sample positions
n = 0:length(x)-1;

% Display the sequence
disp('Original sequence:');
disp(x);

disp('Sample positions:');
disp(n);


%% Calculate the DTFT

% 1000 frequency values between -pi and pi
w = linspace(-pi, pi, 1000);

% Calculate the DTFT
X = x * exp(-1j * (n.' * w));

% Calculate magnitude
Xmag = abs(X);


%% Plot the DTFT magnitude

figure;

plot(w, Xmag);
grid on;

xlabel('Angular Frequency (rad/sample)');
ylabel('Magnitude');
title('DTFT Magnitude of x[n] = [1 1 1 1]');

% Save the graph
saveas(gcf, 'dtft-magnitude.png');



%% Calculate DFT using FFT

% 4-point FFT
N1 = 4;
X4 = fft(x, N1);

% 64-point FFT
N2 = 64;
X64 = fft(x, N2);

% Frequency axes from -pi to pi
w4 = (-N1/2:N1/2-1)*(2*pi/N1);
w64 = (-N2/2:N2/2-1)*(2*pi/N2);

% Shift FFT results to center zero frequency
X4_shifted = fftshift(X4);
X64_shifted = fftshift(X64);

% Display results
disp('4-point FFT:');
disp(X4);

disp('64-point FFT:');
disp(X64);



%% Plot the DFT magnitudes

figure;

subplot(2,1,1);
stem(w4, abs(X4_shifted), 'filled');
grid on;
xlabel('Angular Frequency (rad/sample)');
ylabel('Magnitude');
title('4-Point DFT');
xlim([-pi pi]);

subplot(2,1,2);
stem(w64, abs(X64_shifted), 'filled');
grid on;
xlabel('Angular Frequency (rad/sample)');
ylabel('Magnitude');
title('64-Point DFT');
xlim([-pi pi]);

% Save the figure
saveas(gcf, 'dft-magnitudes.png');



%% Compare DTFT and DFT

figure;

% DTFT
subplot(3,1,1);
plot(w, Xmag);
grid on;
xlabel('Angular Frequency (rad/sample)');
ylabel('Magnitude');
title('DTFT - 1000 Frequency Points');
xlim([-pi pi]);

% 4-point DFT
subplot(3,1,2);
stem(w4, abs(X4_shifted), 'filled');
grid on;
xlabel('Angular Frequency (rad/sample)');
ylabel('Magnitude');
title('DFT - 4 Points');
xlim([-pi pi]);

% 64-point DFT
subplot(3,1,3);
stem(w64, abs(X64_shifted), 'filled');
grid on;
xlabel('Angular Frequency (rad/sample)');
ylabel('Magnitude');
title('DFT - 64 Points');
xlim([-pi pi]);

% Save final comparison figure
saveas(gcf, 'dtft-dft-comparison.png');
