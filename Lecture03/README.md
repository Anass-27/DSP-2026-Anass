# Lecture 03 – Convolution and Moving-Average Filtering

## Purpose

The purpose of this assignment was to learn how to modify a discrete-time
signal and reduce noise using convolution and moving-average filters in MATLAB.

## Signal Operations

### 1. Which operation changed the signal amplitude?

Amplitude scaling changed the amplitude. I multiplied the noisy signal by 2,
so its amplitude became twice as large. The frequency and sample positions
did not change.

### 2. How did the five-sample delay change the signal?

The delay moved the signal 5 samples to the right. The shape and amplitude
of the signal stayed the same. Five zeros were added before the original
signal.

## Convolution and Filtering

### 3. What does the impulse response h[n] represent?

The impulse response h[n] describes how the filter works. In this assignment,
it contains the coefficients used by the moving-average filter to average
nearby samples.

### 4. How did convolution change the noisy signal?

Convolution applied the moving-average filter to the noisy signal. It reduced
the rapid changes caused by random noise and made the signal smoother.

### 5. What differences did you observe between the 5-point and 15-point filters?

The 5-point filter reduced the noise while still following the shape of the
clean signal quite well. The 15-point filter produced a much smoother signal,
but its amplitude became much smaller compared with the clean signal.

### 6. Which filter removed more noise?

The 15-point filter removed more of the rapid variations because it averaged
more samples together.

### 7. Did the longer filter remove or distort useful signal information?

Yes. In my result, the 15-point filter reduced the amplitude of the useful
sine wave significantly. This shows that too much smoothing can also remove
useful information from the signal.

### 8. Which filter would you recommend for this signal? Explain your decision.

I would use the 5-point filter for this signal. It reduced the noise but
still followed the clean signal quite closely. The 15-point filter was
smoother, but it changed the amplitude of the useful signal too much.

### 9. Give one real engineering application for moving-average filtering.

One example is a temperature sensor. Sensor measurements can contain small
random variations, and a moving-average filter can make the temperature
reading more stable.

## AI Usage

Tool used: ChatGPT

How I used it:
I used ChatGPT to help me understand the MATLAB code, convolution, signal
delay, and moving-average filtering.

What I verified or changed:
I ran the complete code in MATLAB and checked the generated figures. I
compared the clean, noisy, 5-point filtered, and 15-point filtered signals
to verify the results.
