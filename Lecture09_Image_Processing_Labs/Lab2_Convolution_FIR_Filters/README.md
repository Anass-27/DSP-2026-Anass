# Lab 2 – 2D Convolution & FIR Filters (Blur, Sharpen, Edges)

**Course:** Mathematical Algorithms (DSP)  
**Lecture:** 9 – Image Processing Labs  
**Software:** MATLAB

## 1. Objective

The objective of this lab is to understand how two-dimensional convolution and FIR filters are used for image processing.

The experiments focus on impulse responses, low-pass filtering, sharpening, edge detection, convolution, and boundary handling.

## 2. Experiments

### Section 0 – Image Preparation

An image was loaded into MATLAB, converted to grayscale, and represented using double-precision intensity values between 0 and 1.

### Section 1 – Delta Image and Impulse Response

A 101×101 delta image was created with a single nonzero pixel at its center.

A 3×3 averaging filter was applied using `conv2`. The output revealed the filter's impulse response as a 3×3 region containing values of 1/9.

### Section 2 – Low-Pass Filtering

Three low-pass filters were compared:

- 3×3 box filter
- 7×7 box filter
- Gaussian filter with σ = 1.2

The larger box filter produces stronger averaging, while the Gaussian filter uses weighted smoothing.

The Gaussian kernel was constructed from two one-dimensional kernels, demonstrating separability.

### Section 3 – Unsharp Masking

The original image was blurred using a Gaussian filter.

A high-frequency mask was calculated by subtracting the blurred image from the original image. The mask was then added back using a sharpening gain of 1.0.

This technique enhances edges and fine image details.

### Section 4 – Edge Detection

Sobel and Laplacian filters were applied to detect intensity changes.

The Sobel filters estimated gradients in perpendicular directions, while the Laplacian highlighted rapid intensity changes using a second-order derivative.

### Section 5 – Correlation vs Convolution

Convolution was performed using `conv2` and `imfilter` with the `'conv'` option.

**Measured maximum absolute difference:**

`3.33067e-16`

This result is approximately zero, confirming that the two implementations produced numerically equivalent outputs.

The symmetric averaging kernel also explains why convolution and correlation give equivalent results for this particular filter under matching boundary conditions.

### Section 6 – Boundary Handling

Three boundary handling methods were compared:

- **Replicate:** Repeats border pixel values.
- **Symmetric:** Reflects image values across boundaries.
- **Circular:** Wraps pixel values from the opposite side.

Differences are mainly expected near image borders and corners.

## 3. Reflections

**Why is Gaussian filtering preferred over a large box filter?**

Gaussian filters generally produce smoother frequency responses and reduce unwanted sidelobes compared with large box filters.

**How does separability reduce computational cost?**

A separable 7×7 filter can be implemented using two one-dimensional passes, reducing the approximate multiplication count per pixel from 49 to 14.

**How do boundary handling methods affect filtering?**

Different padding methods change which pixel values are used outside the image, affecting the filtered results near borders and corners.

## 4. Files

- `lab2.mlx` – MATLAB Live Script containing the code, figures, and explanations.
- `lab2.pdf` – Exported report containing the experimental results and reflections.
- `README.md` – Summary of the experiments and findings.

## 5. Conclusion

This lab demonstrated how two-dimensional FIR filters can be used to blur, sharpen, and detect edges in digital images.

It also showed how kernel symmetry, Gaussian separability, and boundary handling influence filtering operations.

The experiments helped connect mathematical convolution concepts with practical image processing applications.
