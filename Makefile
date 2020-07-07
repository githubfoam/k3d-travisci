IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-openfaasv2:
	bash app/deploy-openfaasv2.sh

deploy-openfaas:
	bash app/deploy-openfaas.sh

deploy-openesb:
	bash app/deploy-openesb.sh

deploy-openesb-helm:
	bash app/deploy-openesb-helm.sh

deploy-localstorage:
		bash app/deploy-localstorage

deploy-istio:
	bash app/deploy-istio.sh

deploy-dashboard:
	bash app/deploy-dashboard.sh

push-image:
	docker push $(IMAGE)
.PHONY: deploy-openesb deploy-dashboard deploy-istio push-image
