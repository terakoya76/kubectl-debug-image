IMAGE_NAME=kubectl-debug-image

build:
	DOCKER_BUILDKIT=1 docker build -t ${IMAGE_NAME} .
