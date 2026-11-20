# Lab 6 – Mini Project: Image Processing Pipeline

**Course:** Mathematical Algorithms (DSP)  
**Lecture:** 9 – Image Processing Labs  
**Software:** MATLAB Online

## 1. Objective

The objective of this mini-project is to combine different digital signal processing techniques into a single image-processing pipeline.

The project uses a selected photograph to demonstrate noise reduction, contrast enhancement, edge detection, and frequency-domain filtering.

The main goal is to investigate how these techniques affect image quality and the visibility of object boundaries.

## 2. Image Selection and Preparation

I selected my own photograph as the input for this mini-project.

The image was loaded using `imread`, converted to grayscale when necessary, and converted to double precision using `im2double`.

This preparation allows the image to be processed using intensity values between 0 and 1.

## 3. Noise Removal – Median Filtering

A 3×3 median filter was applied using MATLAB's `medfilt2` function.

Median filtering is a nonlinear spatial-domain operation that replaces each pixel with the median value of its neighboring pixels.

This method is particularly useful for reducing isolated noise while preserving some important image boundaries.

The original grayscale and filtered images were displayed side by side for comparison.

## 4. Contrast Enhancement

Contrast enhancement was performed using the `imadjust` function.

The intensity range [0.2, 0.8] was mapped to [0, 1], increasing the contrast between darker and brighter image regions.

This operation demonstrates a point-wise intensity transformation.

However, the selected range may cause information loss in very dark or bright areas.

## 5. Canny Edge Detection

Canny edge detection was applied to the contrast-enhanced image using threshold values [0.1, 0.25].

The Canny algorithm combines Gaussian smoothing, gradient calculation, non-maximum suppression, and threshold-based edge tracking.

The resulting binary edge map identifies significant intensity transitions.

The number and percentage of detected edge pixels were also calculated to describe the output.

## 6. Frequency-Domain Low-Pass Filtering

The two-dimensional Fast Fourier Transform (`fft2`) was used to convert the enhanced image into the frequency domain.

A circular low-pass mask with a cutoff radius of 60 frequency bins was applied to retain lower spatial frequencies and remove higher-frequency components.

The inverse Fourier Transform (`ifft2`) was then used to reconstruct the filtered image.

This operation demonstrates how frequency-domain filtering can smooth an image by suppressing high-frequency details.

A limitation of the ideal low-pass filter is that it may blur important boundaries and introduce ringing artifacts.

## 7. Final Pipeline Visualization

All five processing stages were displayed together using MATLAB's `montage` function:

1. Original grayscale image
2. Median-filtered image
3. Contrast-enhanced image
4. Canny edge map
5. FFT low-pass filtered image

The final visualization allows the results of the different DSP techniques to be compared.

The Canny edge map and FFT low-pass result were both generated from the contrast-enhanced image.

## 8. Discussion and Limitations

This project demonstrates how different DSP techniques can be combined to process a digital image.

Median filtering can reduce isolated noise, while contrast enhancement can improve intensity differences. Canny edge detection extracts image boundaries, and frequency-domain filtering suppresses higher spatial frequencies.

The pipeline also has several limitations.

Median filtering may remove small details, and fixed contrast-adjustment values may not suit every photograph.

Canny edge detection is sensitive to its thresholds and may detect unwanted background textures.

The FFT low-pass filter may introduce blur or ringing artifacts because of its sharp frequency cutoff.

Possible improvements include testing different filter sizes, using adaptive contrast enhancement, adjusting Canny thresholds, and comparing different frequency-domain filter designs.

## 9. Conclusion

This mini-project combines spatial-domain and frequency-domain image-processing techniques in MATLAB.

The project demonstrates the relationship between filtering, contrast enhancement, edge detection, and spatial-frequency analysis.

It provides practical experience in designing a small DSP pipeline and evaluating the effects and limitations of different image-processing operations.

## 10. Project Files

| File | Description |
|---|---|
| `lab6.mlx` | MATLAB Live Script containing the processing pipeline, figures, and explanations |
| `lab6.pdf` | Exported report with code, visualizations, and discussion |
| `testimg.jpg` | Original photograph used in the project |
| `README.md` | GitHub documentation for Lab 6 |

## 11. Tools and Techniques

- MATLAB Online
- Image Processing Toolbox
- Median filtering
- Contrast enhancement
- Canny edge detection
- Two-dimensional FFT and inverse FFT
- Frequency-domain low-pass filtering
- Image visualization and comparison
