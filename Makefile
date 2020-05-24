.PHONY: bash connect build

ifeq ($(GIT),)
  GIT := $(HOME)/git
endif

ifeq ($(WORKING),)
  WORKING := -w /opt/git
endif

IMAGE := neovim
VOLUMES := -v=$(GIT):/opt/git -v=$(HOME):/opt/home

bash:
	docker run $(OPT) -it --rm  $(VOLUMES) $(WORKING) --name $(IMAGE) $(IMAGE) /bin/bash

connect:
	docker exec -it $(OPT) $(IMAGE) /bin/bash

build:
	docker build -t $(IMAGE) -f Dockerfile .
