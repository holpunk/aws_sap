# Aws certified Solution Architect Exam 6 

### Question:  
	Code commit to store the code. Code pipeline for integration. 
	Pipeline has build stage which uses s3 bucket for artifacts. The company requires a new 		
    developement pipeline for testing a new features.  
    Pipeline should be isolated from production pipeline and incorporate continuous testing for unit tests.	 
### Requirements: 
	Solution architect design the solution 
### Answer: 
	Create a seperate pipeline in codepipeline and trigger execution using codecommit branches.
    Use aws codebuild for running unit tests and stage the artifacts in an s3 buckets in seperate 	testing 	account. 

### question:
    new web appication.
    fully serverless application
    website should be for global customer
    high responsive, minimal latency
    highly available
    baseline ddos protection
    user will login into the web application using social idp like google, amazon
### requirement:
    design
### solution
    build an API with API gateway, and aws lambda, use s3 for static web resources, and create cloudfront distribution as origin with s3 bucket. use cognito to provide user management authentication function.

### question:
