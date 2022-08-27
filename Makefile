PHONY: build start help
.DEFAULT_GOAL:= help

help:  ## describe make commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build:  ## build image
	@docker build -t wav2vec2-live .

start:  ## start containerized gpu research
	@docker run --rm --gpus 'device=0' -p 8887:8887 -v /home/mochi/github/wav2vec2-live/:/mnt/ -it wav2vec2-live
