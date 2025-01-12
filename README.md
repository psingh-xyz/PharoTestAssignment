
# Pharo Code Test

## Introduction
This repository contains Pharo scripts for handling two distinct tasks:
1. Converting matrices between traditional and hollow representations.
2. Generating JavaDoc-like documentation for Pharo packages.

## Description
The provided scripts demonstrate:
- **Matrix Representation Transformation**: Encoding and decoding matrices to and from a hollow matrix representation, which is efficient for storing sparse matrices.
- **Documentation Generation**: Automated generation of detailed documentation for classes within a Pharo package, mimicking the JavaDoc documentation style.

## Files in this Repository
- `HolloMatrix_query`: Playground script for encoding and decoding matrices (Question 1).
- `MatrixRepresentation.st`: Complete Pharo script for matrix representation transformations (Question 1).
- `MatrixTest_output`: Output results for matrix transformation tests (Question 1).
- `DocumentGenerate_Query`: Playground script for generating package documentation (Question 2).
- `Documentation.st`: Full Pharo script to generate documentation for a specified package (Question 2).
- `package-documentation.txt`: Generated documentation results (Question 2).

## Additional Resources
For visual representations and detailed changes, the following files are available:
- `matrix.image`: Image file  the interface showcasing the matrix representation.
- `matrix.changes`: Detailed changes for the matrix representation script.
- `document.image`: Image file showcasing the interface of the documentation generator.
- `document.changes`: Detailed changes for the documentation generator.
Access these files at the [Google Drive](https://drive.google.com/drive/folders/1XnviaUGmzZ3gBhoTnXEEK_jiiwVvR_Fn?usp=drive_link).

## How to Use
### Matrix Representation Scripts
To use the matrix transformation scripts:
1. Load `MatrixRepresentation.st` into your Pharo image.
2. Execute the `HolloMatrix_query` script in the playground. You can verify the outputs by comparing them with the contents of `MatrixTest_output`.

### Documentation Generation Scripts
To generate documentation for a Pharo package:
1. Load `Documentation.st` into your Pharo image.
2. Run the script in `DocumentGenerate_Query` to generate documentation. The documentation will be output to `package-documentation.txt`.


