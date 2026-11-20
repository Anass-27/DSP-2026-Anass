# Lab 4 – Noise and Filtering

**Course:** Mathematical Algorithms (DSP)  
**Lecture:** 9 – Image Processing Labs  
**University:** Savonia University of Applied Sciences  
**Software:** MATLAB Online

## 1. Objective

The objective of this lab was to study how different types of noise affect digital images and compare filtering methods for reducing noise.

The main tasks were to:

- Generate Gaussian and salt-and-pepper noise.
- Measure image quality using Mean Square Error (MSE) and Signal-to-Noise Ratio (SNR).
- Apply mean, Gaussian, and median filters.
- Compare the effectiveness of linear and nonlinear filtering.
- Understand how noise reduction affects image details and edges.

## 2. Image Preparation

The `peppers.png` image was loaded into MATLAB and converted from RGB to grayscale using `rgb2gray`.

The grayscale image was converted to double precision using `im2double`, representing pixel intensities between 0 and 1.

This image was used as the original reference for noise generation, filtering, and quality evaluation.

## 3. Adding Different Noise Types

Two types of noise were generated using the MATLAB `imnoise` function.

**Gaussian noise**

Gaussian noise was added with a mean of 0 and a variance of 0.01.

This noise produces random intensity variations throughout the image, giving it a grainy appearance.

**Salt-and-pepper noise**

Salt-and-pepper noise was added with a density of 0.05, meaning approximately 5% of the pixels were randomly changed to black or white.

The original image and both noisy images were displayed side by side to compare their visual differences.

## 4. Measuring Image Quality Using MSE and SNR

Two image quality metrics were calculated.

**Mean Square Error (MSE)**

MSE measures the average squared difference between the original and noisy images.

A lower MSE indicates that an image is closer to the original reference.

**Signal-to-Noise Ratio (SNR)**

SNR compares the power of the original image signal with the noise power and is expressed in decibels (dB).

A higher SNR indicates better image quality relative to the noise.

The MSE and SNR values were calculated for both Gaussian and salt-and-pepper noise.

### Results

| Metric | Gaussian Noise | Salt-and-Pepper Noise |
|---|---|---|
| MSE | Add MATLAB result | Add MATLAB result |
| SNR (dB) | Add MATLAB result | Add MATLAB result |

The exact values depend on the randomly generated noise.

## 5. Linear Filtering – Mean and Gaussian Filters

Two linear filtering techniques were applied to reduce noise.

**Mean filter**

A 3×3 mean filter was created using `fspecial('average', 3)`.

The filter was applied to both noisy images. It reduces noise by averaging neighboring pixel values, but it can also blur edges and fine details.

**Gaussian filter**

A 3×3 Gaussian filter with a standard deviation of 0.7 was created using `fspecial('gaussian', [3 3], 0.7)`.

It was applied to the Gaussian noisy image.

Unlike the mean filter, the Gaussian filter gives greater weight to pixels near the center of the neighborhood.

Both methods reduce local intensity variations, but their smoothing effects can also reduce image sharpness.

## 6. Nonlinear Filtering – Median Filter

A 3×3 median filter was applied to the Gaussian and salt-and-pepper noisy images using `medfilt2`.

The median filter replaces each pixel with the median value of its neighboring pixels instead of calculating an average.

This makes median filtering particularly effective for salt-and-pepper noise because isolated extreme pixel values can be removed without spreading their influence across neighboring pixels.

The mean and median filtered images were compared using a 2×2 montage.

Median filtering can often preserve edges better than mean filtering, although it may still remove some fine details.

## 7. Comparing MSE After Filtering

MSE was calculated to compare the quality of the salt-and-pepper noisy image before and after filtering.

The results were also displayed in a bar chart.

### Results

| Image | MSE |
|---|---|
| Salt-and-pepper noisy image | Add MATLAB result |
| After mean filtering | Add MATLAB result |
| After median filtering | Add MATLAB result |

A lower MSE indicates that the filtered image is closer to the original reference.

Median filtering is generally expected to perform better than mean filtering for salt-and-pepper noise because it handles isolated extreme pixel values more effectively.

The actual MATLAB results should be used to confirm which method achieved the lowest MSE in this experiment.

## 8. Reflections

### 8.1 Which noise is best removed by the median filter? Why?

The median filter is particularly effective at removing salt-and-pepper noise.

Salt-and-pepper noise creates isolated black and white pixels with extreme intensity values. The median filter replaces these values with the median of neighboring pixels.

Unlike the mean filter, it does not average extreme values into surrounding pixels, making it more suitable for impulse noise.

### 8.2 Why does linear filtering blur edges more?

Linear filters reduce noise by averaging neighboring pixel intensities.

At image edges, neighboring pixels may have very different intensity values. Averaging these values reduces the contrast across the edge and makes it appear blurred.

Mean and Gaussian filters can therefore reduce noise while also smoothing important image details.

### 8.3 How could adaptive filters preserve image details?

Adaptive filters could adjust their filtering strength according to the local image characteristics.

For example, stronger filtering could be applied in smooth regions, while weaker filtering could be used near edges and detailed areas.

Local variance, edge detection, or adaptive neighborhood sizes could help identify where filtering is needed.

This approach could reduce noise while preserving more image detail.

## 9. Conclusion

In this lab, I explored Gaussian and salt-and-pepper noise and compared different methods for reducing their effects.

I used MSE and SNR to measure image quality and applied mean, Gaussian, and median filters to noisy images.

The experiments demonstrated that linear filtering can reduce noise but may also blur edges. Median filtering is particularly suitable for salt-and-pepper noise because it can remove isolated extreme pixel values.

Comparing MSE before and after filtering provided a numerical method for evaluating filtering performance.

Overall, this lab improved my understanding of noise models, image filtering techniques, and the trade-off between noise reduction and detail preservation.

## 10. Files

| File | Description |
|---|---|
| `lab4.mlx` | MATLAB Live Script containing code, figures, numerical results, and explanations |
| `lab4.pdf` | Exported MATLAB Live Script with screenshots and explanations |
| `README.md` | Summary of the lab objectives, methods, results, and reflections |

## 11. Tools Used

- MATLAB Online
- MATLAB Image Processing Toolbox
- MATLAB Live Editor
- GitHub

----
