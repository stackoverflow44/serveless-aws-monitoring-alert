# serveless-aws-monitoring-alert
An sample starter guide to create serverless aws monitoring alarm alert that will send to Slack. It may not be perfect, but you get the idea. :)

This Terragrunt/Terraform configuration enables you to create multiple AWS CloudWatch metric alarms and filters for specific log patterns from a CloudWatch log file. The alarms are designed to trigger actions by sending notifications to an AWS SNS topic, which in turn calls an AWS Lambda function. The solution is designed to be reusable and scalable, allowing for the addition of future alarms and metrics.

## Prerequisites

- AWS CLI credentials with appropriate permissions for creating and managing CloudWatch, SNS, and Lambda resources.
- Terraform installed on your local machine.

## Usage

1. Clone the repository to your local machine.
2. Modify the `terragrunt.hcl` file to specify the desired alarms, patterns, SNS topics, and Lambda functions.
3. Run the following commands:

```bash
cd <path_to_cloned_repository>
terragrunt init
terragrunt apply
```

1. Terraform will create the necessary CloudWatch metric alarms, filters, SNS topics, and Lambda functions based on your configuration.
```
Directory Structure
.
├── terragrunt.hcl
├── modules
│   ├── serverless-aws-monitor-alert
│   │   ├── alarm.tf
|   |   |─- log_metrics.tf
|   |   |─- sns.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── lambda
│   │   ├── build.sh
|   |   |─- lambda_function.py
|   |   |─- requirements.txt
└── README.md

```

## Configuration

### terragrunt.hcl
The terragrunt.hcl file contains the input parameters for alarms, including name, pattern, SNS topic, and Lambda function details. You need to replace <SLACK_TOKENL> with your actual Slack token.

### modules/serverless-aws-monitor-alert/alarm.tf
The main.tf file in the alarms module contains the Terraform configuration for creating the CloudWatch metric alarms.

### modules/serverless-aws-monitor-alert/log_metrics.tf   
The main.tf file in the log_metrics module contains the Terraform configuration for creating the CloudWatch log metric filters.

### modules/serverless-aws-monitor-alert/sns.tf
The main.tf file in the sns module contains the Terraform configuration for creating the SNS topics.

### modules/serverless-aws-monitor-alert/lambda.tf
The main.tf file in the lambda module contains the Terraform configuration for creating the Lambda functions.

### modules/lambda/lambda_function.py
The lambda_function.py file in the lambda module is a sample Python code for sending the SNS notification to Slack. 

### modules/lambda/build.sh
The build.sh file in the lambda module is a sample Python build script for installing dependencies and packaging as a zip file.

## Customization
Adjust the AWS region and account details as per your requirements.
Modify the log group name in main.tf to match your desired CloudWatch log group.
Contributing
Contributions are welcome! If you find any issues or have suggestions for improvements, please create a GitHub issue or submit a pull request.


Feel free to customize the README.md file according to your specific needs and add any additional details or instructions you find necessary.
