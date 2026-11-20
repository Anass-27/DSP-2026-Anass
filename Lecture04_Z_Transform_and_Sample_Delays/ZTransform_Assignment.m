
clear;
clc;
close all;

x = [1 2 1];
n = 0:length(x)-1;

disp(x);
disp(n);


% Delay the signal by one sample
xDelayed = [0 x];
nDelayed = 0:length(xDelayed)-1;


disp('Delayed signal:');
disp(xDelayed);

disp('Delayed sample positions:');
disp(nDelayed);


figure;

subplot(2,1,1);
stem(n, x, 'filled');
title('Original Signal x[n]');
xlabel('Sample n');
ylabel('Amplitude');
grid on;


subplot(2,1,2);
stem(nDelayed, xDelayed, 'filled');
title('One-Sample Delay x[n-1]');
xlabel('Sample n');
ylabel('Amplitude');
grid on;


% Save Part 1 graphs as an image
saveas(gcf, 'part1_original_delayed.png');


%% Part 2: FIR Filter

% Filter coefficients
b = [0.5 0.5];
a = 1;

% Add a zero to show the final output
xInput = [x 0];

% Calculate output
y = filter(b, a, xInput);

% Sample positions
nOutput = 0:length(y)-1;

% Display the output
disp('Output samples:');
disp(y);


% Plot input and output signals
figure;

subplot(2,1,1);
stem(nOutput, xInput, 'filled');
title('Input x[n]');
xlabel('Sample n');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
stem(nOutput, y, 'filled');
title('Output y[n]');
xlabel('Sample n');
ylabel('Amplitude');
grid on;


% Save the Part 2 figure
saveas(gcf, 'part2_original_filter.png');


%% Part 3: Modified FIR Filter

% New filter coefficients
bModified = [0.8 0.2];

% Calculate the modified output
yModified = filter(bModified, a, xInput);

% Display the new output
disp('Modified filter output:');
disp(yModified);


% Plot the modified filter
figure;

subplot(2,1,1);
stem(nOutput, xInput, 'filled');
title('Input x[n]');
xlabel('Sample n');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
stem(nOutput, yModified, 'filled');
title('Modified Output y[n]');
xlabel('Sample n');
ylabel('Amplitude');
grid on;

% Save the figure
saveas(gcf, 'part3_modified_filter.png');
