ARG GO_VERSION=1.17

FROM golang:${GO_VERSION}-alpine AS build
RUN apk add --no-cache git
RUN mkdir -p /go/src/github.com/yudai/gotty
WORKDIR /go/src/github.com/yudai/gotty

RUN git init . \
 && git remote add origin "https://github.com/yudai/gotty.git" \
 && git fetch --update-head-ok --depth 1 origin \
 && git checkout -q "v2.0.0-alpha.3"

RUN GO111MODULE=off go install -v github.com/yudai/gotty

FROM alpine:3.16
ENV TERM=xterm-256color
COPY --from=build /go/bin/gotty /usr/bin/gotty
COPY rootfs/. /

RUN apk add --update --no-cache docker-cli nodejs npm zsh git vim zsh-autosuggestions zsh-syntax-highlighting bind-tools curl jq figlet bat && \
    rm -rf /var/cache/apk/*

RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" && \
echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc && \
echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

RUN echo "alias cat=bat" >> ~/.zshrc
RUN echo "/start.sh" >> ~/.zshrc && echo "cd /ops; zsh" > /root/.profile

RUN mkdir -p /ops
WORKDIR /ops
EXPOSE 8130

LABEL org.opencontainers.image.title="ZSH Terminal" \
     org.opencontainers.image.description="ZSH Terminal" \
     org.opencontainers.image.vendor="CTO.ai" \
     com.docker.desktop.extension.api.version="0.1.0"

ENTRYPOINT ["/usr/bin/gotty", "--title-format", "Docker Shell - ID:{{ .Hostname }}", "--permit-write", "nsenter"]
