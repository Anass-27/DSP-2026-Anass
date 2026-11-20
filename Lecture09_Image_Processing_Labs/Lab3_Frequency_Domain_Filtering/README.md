# Lab 3 – Frequency-Domain Filtering with fft2

**Course:** Mathematical Algorithms (DSP)  
**Lecture:** 9 – Image Processing Labs  
**Software:** MATLAB Online  
**University:** Savonia University of Applied Sciences

## 1. Objective

The objective of this lab was to explore image processing in the frequency domain using MATLAB.

The main tasks were to visualize the Fourier magnitude spectrum, create and apply ideal and Gaussian low-pass filters, perform high-pass filtering, and compare Gaussian filtering in the spatial and frequency domains.

The lab also helped demonstrate the relationship between spatial convolution and frequency-domain multiplication.

## 2. Image Preparation

The sample image was loaded into MATLAB and converted to grayscale using `rgb2gray`. The `im2double` function was then used to convert the image into double precision with intensity values between 0 and 1.

The image dimensions were obtained using the `size` function.

This preparation allowed the image to be processed using the two-dimensional Fourier transform.

## 3. Magnitude Spectrum Using fft2

The two-dimensional Fast Fourier Transform was calculated using `fft2`.

The `fftshift` function was applied to move the zero-frequency component to the center of the spectrum. A logarithmic transformation was then used to make the frequency components easier to visualize.

Low spatial frequencies appear near the center of the shifted spectrum, while higher frequencies are located farther away.

This section demonstrated how an image can be represented and analyzed in the frequency domain.

## 4. Ideal and Gaussian Low-Pass Filters

Two frequency-domain low-pass filters were created.

**Ideal Low-Pass Filter**

An ideal low-pass filter was created using a cutoff radius of 40.

The filter allows frequencies inside the circular cutoff region to pass and blocks frequencies outside it.

**Gaussian Low-Pass Filter**

A Gaussian low-pass filter was created using a frequency-domain sigma value of 20.

Unlike the ideal filter, the Gaussian filter gradually attenuates higher frequencies.

The main difference is that the ideal filter has a sharp cutoff, while the Gaussian filter has a smooth frequency response.

## 5. Applying Low-Pass Filters

Both low-pass filters were applied by multiplying their frequency responses by the Fourier transform of the image.

The inverse Fourier transform was then used to reconstruct the filtered images.

The ideal low-pass filter reduces fine image details but can introduce ringing artifacts near sharp edges due to its abrupt cutoff.

The Gaussian low-pass filter produces smoother blurring with less tendency toward ringing because its frequency response changes gradually.

This comparison demonstrated how different frequency-domain filters affect the reconstructed image.

## 6. Gaussian High-Pass Filtering

A Gaussian high-pass filter was created by subtracting the Gaussian low-pass filter from 1.

The filter suppresses low-frequency components and retains higher-frequency components associated with edges, textures, and fine details.

After applying the filter in the frequency domain, the inverse Fourier transform was used to reconstruct the image.

The result was normalized using `mat2gray` for visualization.

The high-pass filtered image emphasizes rapid intensity changes compared with the original image.

## 7. Spatial vs Frequency-Domain Gaussian Filtering

Gaussian smoothing was performed using two different methods.

**Spatial-domain filtering:**

A 7×7 Gaussian kernel with a standard deviation of 1.2 was created and applied using `imfilter`.

**Frequency-domain filtering:**

A Gaussian frequency response with a sigma value of 20 was applied using Fourier multiplication and the inverse Fourier transform.

Both approaches perform low-pass filtering, but the provided parameters do not represent equivalent filters. Therefore, their outputs may have different levels of blurring.

The spatial-domain implementation also uses replicated boundaries, while the FFT-based implementation assumes periodic boundaries.

For closely matching results, equivalent filters and consistent boundary handling would be required.

## 8. Reflections

### Why does ideal low-pass filtering cause ringing?

Ideal low-pass filtering uses an abrupt frequency cutoff. This produces an oscillating spatial response, which can create unwanted bright and dark patterns around sharp edges.

This effect is related to the Gibbs phenomenon.

### What does fftshift do visually?

The `fftshift` function moves the zero-frequency component to the center of the Fourier spectrum.

This makes the frequency distribution easier to interpret because low frequencies appear near the center and higher frequencies appear farther away.

### When is frequency-domain filtering computationally preferable?

Frequency-domain filtering is often more efficient for large images and large convolution kernels.

For small kernels, spatial-domain filtering is usually simpler and can be faster because it avoids the overhead of Fourier transforms.

Frequency-domain filtering is particularly useful for large filters and applications requiring direct control over frequency components.

## 9. Conclusion

In this lab, I learned how to analyze and filter digital images in the frequency domain using MATLAB.

I visualized the Fourier magnitude spectrum, applied ideal and Gaussian low-pass filters, and used Gaussian high-pass filtering to emphasize image details.

I also compared spatial-domain and frequency-domain Gaussian filtering and learned why filter parameters and boundary conditions are important.

Overall, the lab improved my understanding of the Fourier transform, frequency-domain filtering, and the relationship between convolution and multiplication in the frequency domain.

## 10. Files

| File | Description |
|---|---|
| `lab3.mlx` | MATLAB Live Script containing the code, explanations, and generated figures |
| `lab3.pdf` | Exported PDF showing the MATLAB code and results |
| `README.md` | Summary of the lab objectives, methods, and reflections |

## 11. Tools Used

- MATLAB Online
- MATLAB Image Processing Toolbox
- MATLAB Live Editor
- GitHub

---

**Course:** Mathematical Algorithms (DSP)  
**Lab:** 3 – Frequency-Domain Filtering with fft2
