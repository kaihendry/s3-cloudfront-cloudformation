# Time to deploy

	real	4m8.483s
	user	0m1.502s
	sys	0m0.228s

# Test

	echo '<h1>Hello World</h1>' >> index.html
	aws --profile mine s3 cp --acl public-read index.html s3://$DOMAIN
	curl https://$CloudfrontEndpoint

# Easy to target

Goal make it easy to [configure Hugo to deploy to](https://gohugo.io/hosting-and-deployment/hugo-deploy/)

Example:

	deployment:
	  targets:
		name: 'example.com'
		URL: 's3://www.example.com?region=ap-southeast-1'
		cloudFrontDistributionID: E24QJ21B58IBG0

# How to learn Cloudformation

https://github.com/search?q=AWS%3A%3AS3%3A%3ABucket+WebsiteConfiguration+cloudfront+extension%3Ayml&ref=simplesearch
