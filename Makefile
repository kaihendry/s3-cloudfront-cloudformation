STACK   = staging-thealaskaguys
DOMAIN  = staging-shop.thealaskaguys.com
YAML    = template.yml

.PHONY: create info validate destroy

.EXPORT_ALL_VARIABLES:
AWS_PROFILE = mine

create: validate
	aws cloudformation deploy --template $(YAML) --stack-name $(STACK) --parameter-overrides DomainName=$(DOMAIN) \
	AcmWildcard=arn:aws:acm:us-east-1:407461997746:certificate/e39b2629-45b0-40c7-85fa-c7cd55ca6173

	aws cloudformation wait stack-create-complete --stack-name $(STACK)

info:
	aws cloudformation describe-stack-events --stack-name $(STACK)

validate:
	aws cloudformation validate-template --template-body file://$(YAML)

destroy:
	aws cloudformation delete-stack --stack-name $(STACK)
