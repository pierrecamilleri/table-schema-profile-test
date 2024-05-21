.DEFAULT: help

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

check-schema: ## Check schema against French profile with check-jsonschema
	check-jsonschema --schemafile tableschema-fr-profile.json schema-deliberations.json

frictionless-validate-schema: ## Check schema with frictionless
	frictionless validate --type schema schema-deliberations.json

