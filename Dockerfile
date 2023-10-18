FROM public.ecr.aws/lambda/python:3.8
COPY main.py ${LAMBDA_TASK_ROOT}
RUN echo "built this docker image"
CMD [ "main.lambda_handler" ]
