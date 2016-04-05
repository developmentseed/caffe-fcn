# FCN

This is a simple, working example of "image segmentation" using a neural net
trained by Jonathan Long and Evan Shelhamer, as described in
[Fully Convolutional Networks for Semantic Segmentation](http://www.cs.berkeley.edu/~jonlong/long_shelhamer_fcn.pdf).

Trained model weights are from the [Caffe Model Zoo](https://github.com/BVLC/caffe/wiki/Model-Zoo).

## Setup

Clone this repo, then:

```
# download weights from model zoo
CAFFE_ROOT=/path/to/caffe/repo make fcn-8s/fcn-8s-pascalcontext.caffemodel
# build docker container
make build-docker
```

## Usage (iPython/Jupyter Notebook)

If you're running docker host in a VM (i.e., on a Mac), make sure to forward
port 8888.

Then do:
```
docker run -it --rm -v $(pwd):/workspace -p 8888:8888 caffe-fcn ./notebook.sh
```

Then go to http://localhost:8888


