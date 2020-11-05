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

# Makefile override

	make STACK=staging-example info

# Easy to target

Goal make it easy to [configure Hugo to deploy to](https://gohugo.io/hosting-and-deployment/hugo-deploy/)

Example:

	deployment:
	  targets:
		name: $DomainName
		URL: 's3://$DomainName?region=ap-southeast-1'
		cloudFrontDistributionID: $CFDistributionId

# How to learn Cloudformation

Using a [VS code extension](https://marketplace.visualstudio.com/items?itemName=kddejong.vscode-cfn-lint), you can see links to the docs:

<img src="https://s.natalian.org/2020-11-05/docs.png" alt="Hover to see documentation link">

https://github.com/search?q=AWS%3A%3AS3%3A%3ABucket+WebsiteConfiguration+cloudfront+extension%3Ayml&ref=simplesearch

# Bill of materials

* https://ap-southeast-1.console.aws.amazon.com/cloudformation/home?region=ap-southeast-1
* https://console.aws.amazon.com/cloudfront/home?region=ap-southeast-1
* https://s3.console.aws.amazon.com/s3/home?region=ap-southeast-1

# Alternatives

* [Amplify](https://gohugo.io/hosting-and-deployment/hosting-on-aws-amplify/)
* 217LOC [Terraform](https://github.com/conortm/terraform-aws-s3-static-website/blob/master/main.tf)
