# FCN

Prepare:

```
# download weights from model zoo
make fcn-8s/trained-weights.caffemodel
# build docker container
make build-docker
```

Use:

If you're running docker host in a VM (i.e., on a Mac), make sure to forward
port 8888.

Then do:
```
docker run -it --rm -v $(pwd):/workspace -p 8888:8888 caffe-fcn ./notebook.sh
```

And go to http://localhost:8888


