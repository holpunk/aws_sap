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
    client can autenticate themselves to request specific content from cloudfront
    by requesting to application server. which returns the signed url. and then 
    client can access the bit of content

coudfront custom error pages
    return an object to viewer. when your origin returns an http 4xx or 5xx error codes
    the error pages can be stored in s3. and cached into cloudfront.  so that edge location can return it back


cloudfront customization at the edge
    many modern applicatins execute some form of logic at the edge 

    edge function
        A code that you write and attach to cloudfront distributions
        runs close to your users to minimize latency
        doesnt have any cache. only to change requests and responses
        cloudfront provides 2 types
            cloudfront functions and lambda edge
        
        use cases
            manipulate http requests and responses
            implement request filtering before reaching your application
            use authentication and authorization
            generate http responses at the edge
            A/B testing
            bot mitigation at the edge

you dont have to manage servers for lambda edege and edge functions


cloudfron functions
    lightweight functions written in javascript
    for high scale, latency sensetive CDN customizations
    sub ms start up times. millions of requests/second

    