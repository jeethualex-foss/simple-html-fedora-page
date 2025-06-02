app := simple-html-page
user :=
pass :=
tag :=

default: login

publish: build deploy

login:
	docker login -u $(user) -p $(pass)

build:
	docker build -t $(tag) .
	docker push $(tag)

deploy:
	docker run --name $(app) -d -p 80:80 $(tag)
