Cloudfront
    enahncing the read performance of the static content and dynamic content
    225 global present workstations
    protect against network and applicatoin layer attacks
    integrations with aws waf, shield, advanced shield and route 53
    can  expose to external https and can talk to internal http
    supports websocket protocol

    use case:
        we have website deployed to s3 bucket and we want to make it visible to all o
        ver the world. cloudfront can deliver our content through the secure communication between it and  http backedn.


    origins
        s3 buckets
            for distibuting files
            enhanced security with cloudfront origin access control
            OAC is replacing Origin Access Control
            cloudfront can be used an ingress to upload files to s3 bucket

        static website
            first enable static website hosting on the bucket

        Mediastore container and mediapackage endpoint
            to deliver video on demand, or live streaming services using aws media services


origin groups
  to provide high availability and do failover
  origin group = one primary and one secondary origin
  if primary fails and secondary can be used
  cross region high availability

  with s3 we can setup replication. so that primary origin and second origin can be synchrnized and in case of f
  ailure of one of the origin requests can be sent to the other available origin



following the sample terraform code for createing cloudfront with s3 origin

resource "aws_s3_bucket" "example_bucket" {
  bucket = "your-s3-bucket-name"
  acl    = "private" # Modify ACL as needed
}

resource "aws_cloudfront_distribution" "example_distribution" {
  origin {
    domain_name = aws_s3_bucket.example_bucket.website_endpoint
    origin_id   = "S3Origin"
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html" # Change to your default object

  # Viewer Protocol Policy (HTTP and HTTPS options)
  viewer_certificate {
    cloudfront_default_certificate = true
  }

  # Cache behaviors
  default_cache_behavior {
    target_origin_id       = "S3Origin"
    viewer_protocol_policy = "allow-all"
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  # Additional cache behaviors if needed
  # cache_behavior {
  #   ...
  # }

  # Price class (use "PriceClass_All" for all edge locations)
  price_class = "PriceClass_200"

  # Restrict distribution to specific countries (optional)
  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA"]
    }
  }

  # Logging (optional)
  logging_config {
    include_cookies = false
    bucket          = "your-log-bucket-name"
    prefix          = "cloudfront-logs/"
  }

  # Custom error responses (optional)
  custom_error_response {
    error_code           = 403
    response_code        = 404
    response_page_path   = "/error.html"
    error_caching_min_ttl = 10
  }
}
