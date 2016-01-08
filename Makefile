all:
	docker build -t protoc-gen-doc:$(VERSION) --build-arg=version=$(VERSION) .
	docker create --name protoc-gen-doc protoc-gen-doc:$(VERSION)
	docker cp protoc-gen-doc:/repo .
	docker rm protoc-gen-doc
