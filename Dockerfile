FROM alpine:3.7

COPY initial-config.vim /home/user/editor/.vimrc
COPY initial-zshrc /home/user/editor/.zshrc

RUN apk add --no-cache vim zsh git tmux curl && \
	adduser -u 1000 -s /bin/zsh -g "" -D -h /home/user/editor editor && \
	chown -R editor:editor /home/user/editor && \
	mkdir /workspace && \
	chown -R editor:editor /workspace

USER editor

WORKDIR /workspace

ENTRYPOINT ["zsh"]

