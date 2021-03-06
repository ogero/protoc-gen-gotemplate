.PHONY: build
build:
	go build -v -i -o protoc-gen-gotemplate .

.PHONY: install
install:
	go install .
	go install ./cmd/web-editor

.PHONY: test
test:	install
	cd examples/time && make
	cd examples/enum && make
	cd examples/import && make
	cd examples/dummy && make
	cd examples/flow && make
	cd examples/concat && make
	cd examples/flow && make
	cd examples/sitemap && make
	cd examples/go-generate && make
# 	cd examples/single-package-mode && make
	cd examples/helpers && make
	cd examples/arithmetics && make
#	cd examples/go-kit && make

.PHONY: docker.build
docker.build:
	docker build --pull -t moul/protoc-gen-gotemplate .

.PHONY: docker.push
docker.push: docker.build
	docker push moul/protoc-gen-gotemplate

.PHONY: lint
lint:
	golangci-lint run --verbose . ./helpers ./cmd/...
