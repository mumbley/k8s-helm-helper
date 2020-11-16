FROM bash:4
RUN apk --update --no-cache add gettext ca-certificates openssl py-pip git jq \
    && apk add curl \
    && wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 -O /usr/local/bin/dumb-init \
    && wget https://storage.googleapis.com/kubernetes-release/release/v1.16.11/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && mkdir /tmp/helm2 \
    && wget https://storage.googleapis.com/kubernetes-helm/helm-v2.11.0-linux-amd64.tar.gz -O /tmp/helm2/helm.tar.gz \ 
    && mkdir /tmp/helm3 \
    && wget https://get.helm.sh/helm-v3.4.1-linux-amd64.tar.gz -O /tmp/helm3/helm3.tar.gz \
    && cd /tmp/helm2 \
    && tar xzvf helm.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && cd /tmp/helm3 \
    && tar xzvf helm3.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm3 \
    && wget https://github.com/quantumew/jamal/releases/download/v1.0.0/jamal-v1.0.0.tar.gz -O /tmp/jamal.tar.gz \
    && cd /tmp \
    && tar xzvf jamal.tar.gz \
    && mv jamal-*/linux/amd64/jamal /usr/local/bin \
    && chmod a+x /usr/local/bin/kubectl /usr/local/bin/dumb-init /usr/local/bin/helm /usr/local/bin/jamal
RUN  pip install awscli
RUN curl -o /bin/gtm https://software.cwscloud.net/gitlab-teams-messenger/builds/linux-amd64/gitlab-teams-messenger-v1.0.0-beta \
   && chmod u+x /bin/gtm
ENTRYPOINT ["/usr/local/bin/dumb-init","--","/usr/local/bin/docker-entrypoint.sh"]
CMD ["bash"]
