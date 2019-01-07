COMMIT      := $(shell git rev-parse --short HEAD)
NAMESPACE   := $(shell whoami)
#PKG_NAME    := $(shell node -e "console.log(require('./package.json').name);")
#HELM_FOLDER := $(shell node -e "console.log(require('./package.json').helmConfig.folder)")

.PHONY: clean open

vars:
	@echo "COMMIT: ${COMMIT}"
	@echo "NAMESPACE: ${NAMESPACE}"

up:
	docker-compose up;
build:
	docker-compose run web bundle install; docker-compose rm; docker-compose build;

clean:
	rm -rf node_modules

test:
	yarn test
	
docker: build
	eval $$(minikube docker-env); docker build -t ${PKG_NAME}:latest .; docker tag ${PKG_NAME}:latest ${PKG_NAME}:${COMMIT};

minikube_context:
	kubectl config use-context minikube

helm: minikube_context
	helm init

helm_dep:
	cd ${HELM_FOLDER}; helm dep up

deploy: helm_dep
	cd ${HELM_FOLDER}; helm upgrade --debug --dry-run --install --namespace=${NAMESPACE} ${PKG_NAME} --set="generichttp.image.repo=${PKG_NAME},generichttp.appVersion=${COMMIT}" .

# The only thing different here is that we're passing global.ephemeral=true
deploy_test: helm_dep
	cd ${HELM_FOLDER}; helm upgrade --debug --dry-run --install --namespace=${NAMESPACE} ${PKG_NAME} --set "global.ephemeral=true" --set="generichttp.image.repo=${PKG_NAME},generichttp.appVersion=${COMMIT}" .

undeploy:
	helm delete --purge ${PKG_NAME}

open:
	curl -s $$(minikube service ${PKG_NAME} -n ${NAMESPACE} --url) | jq .
