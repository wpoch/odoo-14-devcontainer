# [Choice] Python version (use -bullseye variants on local arm64/Apple Silicon): 3, 3.10, 3.9, 3.8, 3.7, 3.6, 3-bullseye, 3.10-bullseye, 3.9-bullseye, 3.8-bullseye, 3.7-bullseye, 3.6-bullseye, 3-buster, 3.10-buster, 3.9-buster, 3.8-buster, 3.7-buster, 3.6-buster
ARG VARIANT=3-bullseye
FROM mcr.microsoft.com/vscode/devcontainers/python:${VARIANT}

ENV PYTHONUNBUFFERED 1

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="none"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    crudini \
    lsb-base postgresql-client \
    libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev \
    libtiff5-dev libjpeg-dev libopenjp2-7-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev \
    libharfbuzz-dev libfribidi-dev libxcb1-dev \
    libpq-dev wkhtmltopdf fonts-glyphicons-halflings \
    python3 python3-dev python3-pip \
    python3-openssl python3-markupsafe python3-setuptools python3-wheel \
    python3-babel python3-dateutil python3-decorator python3-docutils \
    python3-gevent python3-idna python3-jinja2 python3-libsass \
    python3-lxml python3-mako python3-mock python3-ofxparse python3-openssl \
    python3-passlib python3-pil python3-polib python3-psutil \
    python3-psycopg2 python3-pydot python3-pypdf2 python3-qrcode \
    python3-reportlab python3-requests python3-serial python3-stdnum \
    python3-tz python3-usb python3-vobject python3-werkzeug \
    python3-xlsxwriter python3-xlwt python3-zeep \
    python3-chardet python3-freezegun python3-num2words python3-renderpm python3-xlrd \
    fonts-dejavu-core fonts-inconsolata fonts-font-awesome fonts-roboto-unhinted gsfonts \
    libjs-underscore

# [Optional] If your requirements rarely change, uncomment this section to add them to the image.
# COPY requirements.txt /tmp/pip-tmp/
# RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
#    && rm -rf /tmp/pip-tmp
COPY server/requirements.txt /tmp/pip-tmp/
RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
   && rm -rf /tmp/pip-tmp
