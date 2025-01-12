
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
- `HolloMatrix_query.st`: Playground script for encoding and decoding matrices (Question 1).
- `MatrixRepresentation.st`: Complete Pharo script for matrix representation transformations (Question 1).
- `MatrixTest_output.txt`: Output results for matrix transformation tests (Question 1).
- `DocumentGenerate_Query.st`: Playground script for generating package documentation (Question 2).
- `Documentation.st`: Full Pharo script to generate documentation for a specified package (Question 2).
- `package-documentation.txt`: Generated documentation results (Question 2).

## How to Use
### Matrix Representation Scripts
To use the matrix transformation scripts:
1. Load `MatrixRepresentation.st` into your Pharo image.
2. Execute examples using the `HolloMatrix_query.st` script. You can verify the outputs by comparing them with the contents of `MatrixTest_output.txt`.

### Documentation Generation Scripts
To generate documentation for a Pharo package:
1. Load `Documentation.st` into your Pharo image.
2. Run the script in `DocumentGenerate_Query.st` to generate documentation. The documentation will be output to `package-documentation.txt`.


