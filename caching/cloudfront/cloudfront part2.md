cloudfront geo restriction
    you can restrict who can access your distribution
    allow list
        allow your users to access your content only.if they are in one of the countries on a list of approved countries
    deny list
        denies your users to access your content only. if they are in one of the countreies on a list of denied countries

price classes : cost reduction
    price class all
        all region best performance
    price class 200
        most regions excludes most expensive regions
    price class 100
        only least expensive regions

cloudfront signed URL
    signed url with expiration to control access to content in cloudfront
    client can autenticate themselves to request specific content from cloudfront by requesting to application server. which returns the signed url. and then client can access the bit of content

coudfront custom error pages
    return an object to viewer. when your origin returns an http 4xx or 5xx error codes
    the error pages can be stored in s3. and cached into cloudfront.  so that edge location can return it back
    