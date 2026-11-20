# Lecture 02 – Sampling and Aliasing

## Objective

The purpose of this assignment is to investigate how different sampling
frequencies affect a 10 Hz sine wave. I also learned about the Nyquist
Sampling Theorem and aliasing.

## Nyquist Analysis

The original signal frequency is:

fmax = 10 Hz

According to the Nyquist Sampling Theorem:

Fs >= 2 × fmax

Fs >= 2 × 10

Fs >= 20 Hz

The minimum theoretical sampling frequency is 20 Hz.

The sampling frequencies 20 Hz, 25 Hz, 50 Hz, and 100 Hz satisfy the
Nyquist criterion. The 15 Hz sampling frequency does not.

Sampling exactly at 20 Hz is not a good choice in practice because there
is no safety margin. In this experiment, the samples can also fall at or
near the zero crossings of the sine wave.

## Results

### 15 Hz

15 Hz is below the Nyquist rate. There are not enough samples to represent
the original 10 Hz signal correctly, so aliasing occurs.

### 20 Hz

20 Hz is exactly the Nyquist rate. It gives only 2 samples per cycle.
This is not a good practical choice because the sampled result depends
strongly on where the samples occur.

### 25 Hz

25 Hz is above the Nyquist rate. It gives 2.5 samples per cycle and
represents the signal better, but there are still only a few samples.

### 50 Hz

50 Hz gives 5 samples per cycle. The sampled points follow the original
10 Hz signal much more clearly.

### 100 Hz

100 Hz gives 10 samples per cycle. The sampled points give a very clear
representation of the original signal.

## Aliasing Discussion

Aliasing occurs at 15 Hz because the sampling frequency is lower than
twice the signal frequency. When a signal is sampled too slowly, the
samples can represent a different lower frequency instead of the original
signal.

The 20 Hz sampling frequency is exactly the Nyquist rate, but it is not
a good practical choice because it has no safety margin.

For this example, I would choose 50 Hz. It gives 5 samples per cycle and
represents the 10 Hz signal clearly. It also produces less data than
100 Hz. This gives a good balance between signal representation,
processing requirements, and robustness.

## Engineering Recommendation

I recommend 50 Hz for this example. It is well above the minimum Nyquist
rate of 20 Hz and gives 5 samples for each cycle of the 10 Hz signal.

100 Hz gives an even clearer representation, but it also creates more
data that needs to be processed and stored.

## AI Usage

**AI Tool Used:** ChatGPT

**Prompt:**  
Help me understand how to sample a 10 Hz sine wave using sampling
frequencies of 15 Hz, 20 Hz, 25 Hz, 50 Hz, and 100 Hz in MATLAB and
explain aliasing.

**Summary of AI Response:**  
AI explained how to generate the original signal, create the sampled
signals, plot the results, and use the Nyquist Sampling Theorem.

**What I Modified:**  
I organized and ran the MATLAB code in MATLAB Online and checked the
generated figures.

**How I Verified the Results:**  
I checked that the original signal has 10 cycles in one second. I
calculated the Nyquist rate as 20 Hz and compared the sampled points
with the original signal at each sampling frequency.
