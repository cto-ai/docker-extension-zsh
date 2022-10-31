.PHONY: image install run

image:
	docker build -t ctoai/docker-extension-zsh:latest .

install:
	docker extension install ctoai/docker-extension-zsh:latest -f

uninstall:
	docker extension rm ctoai/docker-extension-zsh:latest ||true

run:
	docker run -d --rm --pid=host --privileged -p 8128:8080 ctoai/docker-extension-zsh:latest 

