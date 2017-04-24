NAME = lren/pgtap:0.90.0

all: build

build:
	docker build -t $(NAME) .

push:
	docker push $(NAME)

.PHONY: all build
