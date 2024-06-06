# AWS Certified Solution Architect Exam 6

### Question 1: Development Pipeline Design
**Scenario:**
- Company uses Code Commit for source control and Code Pipeline for integration.
- Existing pipeline uses an S3 bucket for build artifacts.
- A new development pipeline is needed for testing new features, isolated from the production pipeline with continuous testing for unit tests.

**Requirements:**
- Design a solution for the new development pipeline.

**Answer:**
- Create a separate pipeline in CodePipeline and trigger execution using branches in CodeCommit.
- Utilize AWS CodeBuild for running unit tests.
- Stage the artifacts in separate S3 buckets within a testing AWS account.

-------------------------------------------------------------------------------------------------------------

### Question 2: Designing a Serverless Web Application for Global Customers
**Scenario:**
- A new web application must be fully serverless, catering to a global customer base.
- Requirements include high responsiveness, minimal latency, high availability, baseline DDoS protection.
- Users will log in using social IDPs like Google and Amazon.

**Requirement:**
- Design the architecture.

**Solution:**
- Build an API with API Gateway and AWS Lambda.
- Use S3 for static web resources.
- Create a CloudFront distribution with the S3 bucket as the origin.
- Implement AWS Cognito for user management and authentication functions.

-------------------------------------------------------------------------------------------------------------

### Question 3: Security Enhancement for Web Application on EC2
**Scenario:**
- A web application is launched on Amazon EC2 instances within private subnets.
- An Application Load Balancer (ALB) is configured in front of the instances.
- Instances are part of the `webappSG` security group, and ALB is part of `ALB_SG`.

**Requirement:**
- Lock down security groups according to best practices.

**Solution:**
- Configure an inbound rule in `webappSG` allowing port 80 traffic from `ALB_SG`.
- Configure an inbound rule in `ALB_SG` allowing port 80 traffic from the public internet.

-------------------------------------------------------------------------------------------------------------

### Question 4: Cost-Effective Migration of Applications to AWS
**Scenario:**
- Planning to migrate 30 small applications to AWS.
- Applications run on a mix of Node.js and Python across a cluster of virtual servers on-premises.
- Applications exhibit various usage patterns with generally low concurrent users.
- Applications use an average of 1 GB of memory, spiking to 3 GB during peak periods.

**Requirements:**
- Find the most cost-effective solution.

**Solution:**
- Migrate the applications to Docker containers on ECS.
- Create separate ECS tasks and services for each application.
- Enable auto-scaling based on memory utilization with a threshold set to 75%.
- Monitor services and hosts via CloudWatch.

-------------------------------------------------------------------------------------------------------------

### Question 5: Secure Data Analytics Application
**Scenario:**
- Data will be uploaded to S3 and analyzed by an application running on EMR within a VPC private subnet.
- The environment must be completely isolated from the internet at all times.
- Data must be encrypted at rest, controlled by the company.

**Requirement:**
- Select two combination solutions.

**Solution:**
- Configure S3 bucket policy to permit access using `aws:sourceVpce` condition to match the S3 endpoint ID.
- Configure the EMR cluster to use an AWS CloudHSM appliance for at-rest encryption.
- Set up a VPC endpoint for S3.

-------------------------------------------------------------------------------------------------------------

### Question 6: Centralized Management of Identities and AWS Permissions
**Scenario:**
- Security department of a large company with several AWS accounts needs to centralize the management of identities and AWS permissions.
- The design should also synchronize authentication credentials with the company's existing on-premises identity management provider.

**Requirement:**
- Which solution?

**Solution:**
- Create a SAML-based identity management provider in a central account and map IAM roles to it.

-------------------------------------------------------------------------------------------------------------
