# s3-cloudfront-cloudformation

A minimal [Makefile based](https://github.com/tj/mmake) S3 Cloudfront Cloudformation template.

# Time to deploy

	aws cloudformation wait stack-create-complete --stack-name $(STACK)
	real	4m8.483s
	user	0m1.502s
	sys	0m0.228s

# Verify

	echo '<h1>Hello World</h1>' >> index.html
	aws --profile mine s3 cp --acl public-read index.html s3://$DomainName
	curl https://$CFDomainName

# Easy to target

Goal make it easy to [configure Hugo to deploy to](https://gohugo.io/hosting-and-deployment/hugo-deploy/)

Example:

	deployment:
	  targets:
		name: $DomainName
		URL: 's3://$DomainName?region=ap-southeast-1'
		cloudFrontDistributionID: $CFDistributionId

# How to learn Cloudformation

https://github.com/search?q=AWS%3A%3AS3%3A%3ABucket+WebsiteConfiguration+cloudfront+extension%3Ayml&ref=simplesearch

# Alternatives

* [Amplify](https://gohugo.io/hosting-and-deployment/hosting-on-aws-amplify/)
