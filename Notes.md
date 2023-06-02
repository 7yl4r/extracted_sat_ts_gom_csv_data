## Data extraction notes

Currently, we are extracting at roughly 28 locations for FGB and 103 locations for FK. Many of these are not displayed on the dashboards.

This is done by selecting rows from two ROI_out files (FK and FGB). Only certain rows are used. These are both points and polygons.


Three types of ROI extractions are used:
1. For small individual FGB banks, we are using POINT locations, where data are extracted in a 5x5 or 3x3 boxes around a center pixel.
2. For large, irregular areas like the "COASTAL" FGB ROI, POLYGONS are used.
3. For FWC ROI (larger boxes), corners are defined using MULTIPOINT ROIs.

We will merge these into a single GOM set of ROI to extract, as FK and FGB are being deprecated.

The number of ROI can be reduced to just the ones that are displayed on dashboards.

For future py based processing and extractions, ROI locations should be output as WKT. Currently, these are stored as .mat files.

