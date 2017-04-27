FROM node

RUN curl -SL https://releases.hashicorp.com/consul-template/0.18.2/consul-template_0.18.2_linux_amd64.tgz | tar -xvzC /usr/local/bin

COPY . /app

WORKDIR /app

RUN npm install

ENV NODE_ENV production

ENTRYPOINT ["/app/entrypoint.sh"]
