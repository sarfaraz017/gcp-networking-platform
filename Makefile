init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply -auto-approve

validate:
	./scripts/validate.sh
