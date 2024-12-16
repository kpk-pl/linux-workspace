ARG BASE
ARG USERNAME
ARG USEREMAIL
ARG DEBIAN_FRONTEND=noninteractive

FROM ${BASE}
WORKDIR /home/src

COPY --chmod=775 ./neovim-setup.sh ./git-setup.sh ./devenv/install/*-setup.sh /tmp/
COPY --chmod=775 ./shell /tmp/shell
COPY ./devenv/install/ssh /root/.ssh
COPY ./vim/nvim /root/.config/nvim
COPY ./vim/vimrc /root/.vimrc
COPY ./vim/vim /root/.vim

RUN apt-get update \
 && apt-get install -y util-linux bsdmainutils silversearcher-ag inotify-tools dialog rsync \
                       curl valgrind telnet dnsutils net-tools iputils-ping unzip graphviz \
                       libsecret-1-0 libsecret-1-dev clangd-12 tre-agrep gnupg2 ccache gettext \
 && pip3 install kafka-python pymongo \
 && /tmp/shell-setup.sh \
 && /tmp/tools-setup.sh \
 && /tmp/git-setup.sh ${USERNAME} ${USEREMAIL} \
 && /tmp/neovim-setup.sh

CMD ["tail", "-f", "/dev/null"]
