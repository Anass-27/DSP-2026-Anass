clear;
close all;
clc;

%% Original signal

fs_original = 48000;       % Original sampling frequency
signal_frequency = 7000;   % Signal frequency = 7 kHz
duration = 2;              % Duration in seconds
amplitude = 0.20;          % Keep volume low

t = 0:1/fs_original:duration-1/fs_original;

x = amplitude * sin(2*pi*signal_frequency*t);

%% Listen to original signal

disp('Original signal: 7 kHz');

soundsc(x, fs_original);
pause(duration + 1);

%% Sampling frequencies to test

fs_values = [24000 16000 12000 8000];

for i = 1:length(fs_values)

    fs_low = fs_values(i);

    %% Calculate downsampling factor

    M = fs_original / fs_low;

    if mod(M,1) ~= 0
        error('Sampling frequency must divide 48000 exactly.');
    end

    %% Downsample without anti-aliasing filter

    x_alias = x(1:M:end);

    %% Calculate Nyquist frequency

    nyquist_frequency = fs_low / 2;

    fprintf('\nSampling frequency: %.0f Hz\n', fs_low);
    fprintf('Nyquist frequency: %.0f Hz\n', nyquist_frequency);

    %% Listen to downsampled signal

    disp('Playing downsampled signal...');

    soundsc(x_alias, fs_low);
    pause(duration + 1);

    %% Compare frequency spectra

    figure('Color','white');

    % Original signal
    subplot(2,1,1);

    periodogram(x, [], [], fs_original);
    xlim([0 10]);

    xline(7, '--r', 'Original: 7 kHz', ...
        'LineWidth', 1.5);

    title('Original Signal: 7 kHz');
    xlabel('Frequency (kHz)');
    grid on;

    % Downsampled signal
    subplot(2,1,2);

    periodogram(x_alias, [], [], fs_low);
    xlim([0 fs_low/2000]);

    title(['After Downsampling: f_s = ', ...
        num2str(fs_low/1000), ' kHz']);

    xlabel('Frequency (kHz)');
    grid on;

    %% Save figure

    filename = ['spectrum_', ...
        num2str(fs_low/1000), 'kHz.png'];

    saveas(gcf, filename);

end

%% Display expected results

fprintf('\n----------------------------------\n');
fprintf('Experiment Results\n');
fprintf('----------------------------------\n');

fprintf('24 kHz: Nyquist = 12 kHz, Peak = 7 kHz, No aliasing\n');
fprintf('16 kHz: Nyquist = 8 kHz, Peak = 7 kHz, No aliasing\n');
fprintf('12 kHz: Nyquist = 6 kHz, Peak = 5 kHz, Aliasing\n');
fprintf('8 kHz:  Nyquist = 4 kHz, Peak = 1 kHz, Aliasing\n');