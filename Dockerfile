FROM alpine:3
RUN apk --no-cache add openssh python3 sshpass py3-pip
RUN apk --no-cache add --virtual .ansible-builddeps gcc musl-dev libffi-dev openssl-dev python3-dev
RUN pip install ansible
RUN rm -rf /root/.cache/pip && apk del .ansible-builddeps
