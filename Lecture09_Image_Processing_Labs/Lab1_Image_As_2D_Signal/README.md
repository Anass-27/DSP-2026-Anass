# Lab 1 – Image as a 2D Signal

**Course:** Digital Signal Processing  
**Lecture:** 9 – Image Processing Labs

## Objective

This lab explores how digital images behave as two-dimensional signals using MATLAB.

## Experiments

### Section 0 – Image Inspection
Loaded an image, converted it to grayscale, and examined its dimensions, intensity range, and data type.

### Section 1 – Quantization
Compared 8-bit, approximately 6-bit, and approximately 4-bit images to investigate how reducing intensity resolution affects image quality.

### Section 2 – Histogram and Contrast Stretching
Examined grayscale histograms and applied contrast stretching to understand changes in intensity distribution and image contrast.

### Section 3 – Gamma Correction
Applied gamma values of 0.6 and 1.6 to investigate nonlinear brightness adjustments.

### Section 4 – Sampling and Aliasing
Reduced the image to 10% of its original dimensions and enlarged it using nearest-neighbor interpolation to investigate information loss and sampling artifacts.

## Reflections

Reducing bit depth decreases the number of available intensity levels and may introduce visible banding.

Contrast stretching can improve the visibility of details within a selected intensity range, although clipping may remove information.

Aggressive downsampling can introduce aliasing when high spatial frequencies exceed the new Nyquist limit.

## MATLAB Files

- `lab1.mlx` – MATLAB Live Script containing the code, figures, and explanations.
- `lab1.pdf` – Exported report containing the experimental results and reflections.
