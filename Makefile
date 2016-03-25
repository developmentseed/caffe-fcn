
fcn-8s/trained-weights.caffemodel:
	curl http://dl.caffe.berkeleyvision.org/fcn-8s-pascalcontext.caffemodel > $@

.PHONY: build-docker
build-docker:
	docker build -t caffe-fcn docker

