# Lab 5 – Edge Detection and Segmentation

**Course:** Mathematical Algorithms (DSP)  
**Lecture:** 9 – Image Processing Labs  
**University:** Savonia University of Applied Sciences  
**Software:** MATLAB Online

## 1. Objective

The objective of this lab was to explore different edge detection and image segmentation techniques using MATLAB.

The main tasks were to:

- Detect image edges using Sobel and Prewitt operators.
- Apply the Canny edge detector.
- Detect edges using the Laplacian of Gaussian (LoG).
- Perform automatic image thresholding using Otsu's method.
- Identify and visualize connected regions in a binary image.
- Compare the different techniques and understand their applications.

## 2. Image Preparation

The `peppers.png` image was loaded into MATLAB and converted from RGB to grayscale using `rgb2gray`.

The grayscale image was converted to double precision using `im2double`, allowing pixel intensities to be represented between 0 and 1.

The image dimensions and intensity range were checked before processing.

The same grayscale image was used throughout the lab to compare the different edge detection and segmentation methods.

## 3. Sobel and Prewitt Edge Detection

Two gradient-based edge detection methods were applied using MATLAB's `edge` function.

**Sobel operator**

The Sobel operator detects changes in image intensity using weighted derivative kernels in the horizontal and vertical directions.

Its weighting provides some smoothing, helping reduce sensitivity to small intensity variations.

**Prewitt operator**

The Prewitt operator also calculates horizontal and vertical intensity gradients but uses uniformly weighted kernels.

Both methods produce binary edge maps, where white pixels represent detected edges and black pixels represent areas without detected edges.

These methods demonstrate how rapid changes in image intensity, which are associated with high spatial frequencies, can be used to identify image boundaries.

## 4. Canny Edge Detection

The Canny edge detector was applied using the following MATLAB command:

`edges_canny = edge(I, 'Canny', [0.05 0.2]);`

Canny uses several processing stages:

1. Gaussian smoothing to reduce noise.
2. Gradient calculation to identify intensity changes.
3. Non-maximum suppression to produce thin edges.
4. Double thresholding and hysteresis to retain meaningful connected edges.

The lower threshold was set to 0.05 and the upper threshold to 0.20.

Canny can produce cleaner and more continuous edges than basic gradient operators because it combines noise reduction, edge thinning, and edge tracking.

## 5. Laplacian of Gaussian (LoG)

The Laplacian of Gaussian edge detector was applied using:

`edges_log = edge(I, 'log');`

LoG combines Gaussian smoothing with a second-order derivative operation.

The Gaussian filter reduces sensitivity to noise, while the Laplacian identifies changes in the image's intensity curvature.

Edges are detected by identifying zero crossings, where the second-derivative response changes sign.

Unlike Sobel and Prewitt, which use first-order derivatives, LoG uses second-order derivatives.

The resulting edge map provides another representation of image boundaries.

## 6. Otsu Thresholding and Binary Segmentation

Otsu's automatic thresholding method was applied to the grayscale image.

The `graythresh` function calculated a threshold based on the image's intensity histogram.

The `imbinarize` function then converted the grayscale image into a binary mask using this threshold.

Pixels with intensities above the threshold were assigned white, while the remaining pixels were assigned black.

Otsu's method selects a threshold that minimizes the weighted variance within the two pixel classes, which is equivalent to maximizing the variance between them.

This method demonstrates how an image can be divided into two intensity-based regions without manually selecting a threshold.

**Calculated Otsu threshold:** Add MATLAB result here.

## 7. Labeling and Visualizing Regions

The binary image generated using Otsu's method was processed using the `bwlabel` function.

This function identifies connected groups of white pixels and assigns a unique numerical label to each region.

By default, `bwlabel` uses 8-connectivity for two-dimensional binary images.

The `label2rgb` function was then used to display the labeled regions in different colors.

This made the connected regions easier to distinguish visually.

**Number of detected regions:** Add MATLAB result here.

The labeled regions represent connected pixel groups and do not necessarily correspond to individual objects in the original image.

## 8. Reflections

### 8.1 Which operator gives the thinnest, cleanest edges?

Canny generally produces the thinnest and cleanest edges because it uses non-maximum suppression and hysteresis thresholding.

Non-maximum suppression reduces thick edge responses, while hysteresis helps remove isolated weak responses and preserve connected edges.

Sobel and Prewitt may produce more unwanted responses, while LoG can be sensitive to noise and filtering parameters.

The exact comparison depends on the image and the selected settings.

### 8.2 Why does Canny outperform simple gradient filters?

Canny often performs better because it combines multiple processing stages.

Gaussian smoothing reduces noise, gradient calculations identify edge locations, non-maximum suppression makes the edges thinner, and hysteresis helps preserve meaningful connected boundaries.

Simple gradient operators mainly rely on intensity changes and thresholding, so they do not provide the same combination of processing steps.

### 8.3 How does Otsu relate to histogram-based thresholding?

Otsu is an automatic histogram-based thresholding method.

It analyzes the distribution of grayscale intensity values and selects a threshold that divides pixels into two classes.

The threshold is selected by minimizing the weighted variance within the classes.

This allows binary segmentation without manually choosing a threshold.

However, Otsu may be less effective when foreground and background intensities overlap significantly.

## 9. Conclusion

In this lab, I explored edge detection and image segmentation using MATLAB.

I applied Sobel, Prewitt, Canny, and Laplacian of Gaussian operators to identify image boundaries and compare different edge detection approaches.

The experiments demonstrated how edges are associated with rapid changes in pixel intensity and high-frequency image components.

I also applied Otsu's automatic thresholding method to create a binary image and used connected-component labeling to identify and visualize regions.

Overall, this lab improved my understanding of gradient-based edge detection, zero-crossing methods, automatic thresholding, and connected-region analysis.

## 10. Files

| File | Description |
|---|---|
| `lab5.mlx` | MATLAB Live Script containing code, figures, results, and explanations |
| `lab5.pdf` | Exported Live Script containing the MATLAB results and explanations |
| `README.md` | Summary of the lab objectives, methods, and reflections |

## 11. Tools Used

- MATLAB Online
- MATLAB Image Processing Toolbox
- MATLAB Live Editor
- GitHub

---

**Course:** Mathematical Algorithms (DSP)  
**Lab:** 5 – Edge Detection and Segmentation
