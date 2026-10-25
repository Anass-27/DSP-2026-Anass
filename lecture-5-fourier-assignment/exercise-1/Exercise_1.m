
clear;
clc;
close all;


% Time values
t = linspace(-1, 1, 4000);

% Highest harmonic values
Hvalues = [1 3 9 25];

% Create a figure
figure;

% Repeat for each H value
for i = 1:length(Hvalues)

    H = Hvalues(i);
    x = zeros(size(t));

    % Add odd harmonics
    for k = 1:2:H
        x = x + (4/pi) * sin(2*pi*k*t) / k;
    end

    % Plot the result
    subplot(2,2,i);
    plot(t, x);
    grid on;
    xlabel('Time (s)');
    ylabel('Amplitude');
    title(['Square Wave - H = ' num2str(H)]);
    ylim([-1.5 1.5]);

end


% Save the comparison figure
saveas(gcf, 'square-wave-comparison.png');
