init:
	@echo "Initializing..."
	@cd terraform \
		&& terraform init -reconfigure

check:
	@echo "Checking..."
	make fmt && make validate && make plan

fmt:
	@echo "Formatting..."
	@cd terraform \
		&& terraform fmt -check -recursive

validate:
	@echo "Validating..."
	@cd terraform \
		&& terraform validate

plan:
	@echo "Planning..."
	@cd terraform \
		&& terraform plan -var-file="local.tfvars" -out=plan \
		&& terraform show -json plan > plan.tfgraph

apply:
	@echo "Applying..."
	@cd terraform \
		&& terraform apply plan

destroy:
	@echo "Destroying..."
	@cd terraform \
		&& terraform destroy -auto-approve

get-lb-arn:
	@echo "Getting Load Balancer ARN..."
	@lb_arn=$$(aws elbv2 describe-load-balancers --region us-east-1 --query 'LoadBalancers[*].LoadBalancerArn' --output text
	@echo "Getting Listener ARN..."
	@listener_arn=$$(aws elbv2 describe-listeners --load-balancer-arn $lb_arn --region us-east-1 --query 'Listeners[*].ListenerArn' --output text
	@echo $$listener_arn

gen-tf-docs:
	@echo "Generating Terraform Docs..."
	@terraform-docs markdown table terraform