FROM centos
LABEL maintainer 793053286@qq.com

WORKDIR /tmp

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo && \
    curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo

RUN yum -y install python-pip nginx gcc python-devel supervisor iproute vim && yum clean all

RUN pip install -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com django uwsgi

COPY conf/nginx.conf /etc/nginx
COPY conf/supervisord.conf conf/uwsgi.ini /etc/
COPY . /opt/jumper

EXPOSE 80

CMD supervisord
