FROM --platform=linux/amd64 alpine:3 AS base

# -------------------------------------------------------------------------------------------------
## Install necessary packages to donwload and install tools
# -------------------------------------------------------------------------------------------------
# Install terraform
RUN apk add --no-cache curl unzip git bash jq python3 py3-pip 
RUN curl -fsSL https://releases.hashicorp.com/terraform/1.0.8/terraform_1.0.8_linux_amd64.zip -o terraform.zip
RUN unzip terraform.zip -d /usr/local/bin
RUN rm terraform.zip

CMD ["bash"]
