# Time to deploy

	real	4m8.483s
	user	0m1.502s
	sys	0m0.228s

# Test

	Add $DOMAIN CNAME to $output.cloudfront.net
	aws --profile mine s3 cp --acl public-read index.html s3://$DOMAIN
	curl https://$DOMAIN
