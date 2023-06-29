#!/bin/bash

# Create a temporary directory for packaging
temp_dir=$(mktemp -d)
package_dir="${temp_dir}/package"

# Copy the Lambda function code to the package directory
cp lambda_function.py "${package_dir}"

# Install the Python dependencies using pip
pip install -r requirements.txt -t "${package_dir}"

# Zip the package directory
zip -r lambda_function.zip "${package_dir}"

# Clean up the temporary directory
rm -rf "${temp_dir}"
