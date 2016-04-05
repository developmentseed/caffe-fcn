fcn-8s/fcn-8s-pascalcontext.caffemodel:
	${CAFFE_ROOT}/scripts/download_model_binary.py fcn-8s

.INTERMEDIATE: data/pascal-voc2010-trainval.tar
data/pascal-voc2010-trainval.tar:
	curl http://host.robots.ox.ac.uk/pascal/VOC/voc2010/VOCtrainval_03-May-2010.tar > $@

data/pascal-voc2010: data/pascal-voc2010-trainval.tar
	tar -C data/ -xvf $^
	mv data/VOCdevkit/VOC2010 $@
	rmdir data/VOCdevkit

.INTERMEDIATE: docker/gpu/Dockerfile docker/cpu/Dockerfile
docker/gpu/Dockerfile:
	mkdir -p $(dir $@)
	echo "FROM developmentseed/caffe-gpu:master" > docker/gpu/Dockerfile
	cat docker/Dockerfile.template >> docker/gpu/Dockerfile

docker/cpu/Dockerfile:
	mkdir -p $(dir $@)
	echo "FROM developmentseed/caffe-cpu:master" > docker/cpu/Dockerfile
	cat docker/Dockerfile.template >> docker/cpu/Dockerfile

.PHONY: build-docker
build-docker: docker/gpu/Dockerfile docker/cpu/Dockerfile
	docker build -t caffe-fcn:cpu docker/cpu
	docker build -t caffe-fcn:gpu docker/gpu

