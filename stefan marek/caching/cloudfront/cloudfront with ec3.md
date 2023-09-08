Cloudfront with ec2 as origin
    ec2 must be in public subnet
    so it can be accessible through cloudfront
    We can allow the all cloudfront edge locations in the security group of ec2 instacne to allow ingress traffic from cloudfront locations to ec2 instance

we can also place elastic load balancer between cloudfront and ec2 instance. 
    1. in the sg of load balancer we can add all the edge locations
    2. add a target group in load balancer which points to ec2 instance that we want
    3. add an entry of load balancer to sg of ec2 instance



now in above configurations we have one issue. any request that is received from cloudfront can  directly been sent to the alb and ec2 instances
 
 use following

 1. configure cloudfront to add custom http header to requests it sends to ALB
 2. second, configure ALB to only forward the requests that contains custom http header


 header name and value can be kept secret so, it adds an additional trick to add security to sending and forwarding request to the origin