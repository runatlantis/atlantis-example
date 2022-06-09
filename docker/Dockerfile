# https://www.terraform.io/cli/install/apt
FROM python:3.9

ARG ARCH
ENV TERRAFORM_VERSION 1.2.2
ENV TERRAFORM_ZIP_URL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${ARCH}.zip


RUN apt-get update -y \
    && apt-get install -y awscli


RUN wget -O /tmp/terraform.zip $TERRAFORM_ZIP_URL \
    && unzip /tmp/terraform.zip -d /usr/local/bin \
    && rm /tmp/terraform.zip
