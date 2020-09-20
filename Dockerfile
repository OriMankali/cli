FROM ruby:2.4

RUN ["mkdir", "-p", "/root/.akeyless"]
COPY ./cli /bin/akeyless
COPY ./settings /root/.akeyless/settings
COPY ./akeyless_env.sh /root/.akeyless/akeyless_env.sh
