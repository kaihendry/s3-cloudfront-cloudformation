STACK   = staging-thealaskaguys
DOMAIN  = staging-shop.thealaskaguys.com
YAML    = template.yml
ACM     = arn:aws:acm:us-east-1:407461997746:certificate/e39b2629-45b0-40c7-85fa-c7cd55ca6173

.EXPORT_ALL_VARIABLES:
AWS_PROFILE = mine

# deploy stack
deploy: validate
	aws cloudformation deploy --template $(YAML) --stack-name $(STACK) --parameter-overrides DomainName=$(DOMAIN) \
	AcmWildcard=$(ACM)
.PHONY: deploy

# Get information
info:
	aws cloudformation describe-stacks --stack-name $(STACK)
.PHONY: info

# Validate template
validate:
	@aws --version
	aws cloudformation validate-template --template-body file://$(YAML)
.PHONY: validate

# Size of template.yml
# Goal is to reduce the size of this file
size:
	@wc -l $(YAML)
.PHONY: size

# Destroy stack
clean:
	aws cloudformation delete-stack --stack-name $(STACK)
.PHONY: clean
