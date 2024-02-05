Assignment Summary
Tasks Completed

Task 1: Shell Script for Listing Open Pull Requests

Objective:

Develop a shell script (pull-requesh.sh) to enumerate open pull requests across all organizations and repositories to which a user belongs.

Approach:

Utilized gh api for interacting with the GitHub API. Employed jq for efficient JSON parsing and output formatting.

Script logic: 

Retrieve a list of organizations associated with the user. 

For each organization: Obtain a list of repositories within the organization. 

For each repository: Fetch open pull requests. Format and display the pull request information.

Task 2: Creating an ECS Service Running Nginx

Technology Stack: Employed Terraform for infrastructure provisioning and Docker for containerization.

Assumptions: VPC ID and subnets are provided externally. Tested using personal AWS account configurations. Implementation: Constructed an ECS task definition specifying the Nginx container image and configuration. Deployed an ECS service utilizing the task definition. Created an open security group (for testing purposes) to permit internet traffic to the Nginx service. Leveraged the default AWS ECS IAM role for simplicity in the testing environment.

Considerations for Production Environments
Security Groups: Implement restrictive security groups to control access to the ECS service, only allowing necessary traffic. IAM Roles: Create dedicated IAM roles with fine-grained permissions aligned with the service's specific requirements.
