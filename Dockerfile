FROM python


RUN apt update && apt install wget -y

RUN wget -O hcloud.tar https://github.com/hetznercloud/cli/releases/download/v1.10.0/hcloud-linux-386-v1.10.0.tar.gz && \
    mkdir -p ./hcloud_untarred && \
    tar xvzf hcloud.tar -C hcloud_untarred && \
    mv hcloud_untarred/*/bin/hcloud /usr/bin/ && \
    rm hcloud.tar && rm -rf hcloud_untarred

RUN pip install ansible

ADD . /app/
WORKDIR /app

RUN cd ansible && ./install_roles.sh

ENTRYPOINT [ "bash" ]