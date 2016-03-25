FROM developmentseed/caffe-cpu:master

RUN adduser --disabled-password caffe

RUN pip install jupyter && \
  mkdir -p -m 700 ~caffe/.jupyter/ && \
  echo "c.NotebookApp.ip = '*'" >> ~caffe/.jupyter/jupyter_notebook_config.py && \
  chown -R caffe:caffe ~caffe/.jupyter

EXPOSE 8888

USER caffe
