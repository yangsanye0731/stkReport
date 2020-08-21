FROM docker.io/python:3.6-slim-stretch

RUN echo  "deb http://mirrors.aliyun.com/debian/ stretch main non-free contrib\n\
deb-src http://mirrors.aliyun.com/debian/ stretch main non-free contrib\n\
deb http://mirrors.aliyun.com/debian-security stretch/updates main\n\
deb-src http://mirrors.aliyun.com/debian-security stretch/updates main\n\
deb http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib\n\
deb-src http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib\n\
deb http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib\n\
deb-src http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib" > /etc/apt/sources.list && \
echo  "[global]\n\
trusted-host=mirrors.aliyun.com\n\
index-url=http://mirrors.aliyun.com/pypi/simple" > /etc/pip.conf && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo "Asia/Shanghai" > /etc/timezone


RUN apt-get update && apt-get install -y gcc make axel python3-dev default-libmysqlclient-dev libxml2-dev cron supervisor && \
    pip3 install mysqlclient sqlalchemy && \
    pip3 install requests && \
    pip3 install lxml bs4 && \
    pip3 install numpy pandas  && \
    pip3 install tushare && \
    pip3 install tornado torndb && \
    pip3 install bokeh stockstats && \
    cd /tmp && axel https://nchc.dl.sourceforge.net/project/ta-lib/ta-lib/0.4.0/ta-lib-0.4.0-src.tar.gz && \
    tar xvfz ta-lib-0.4.0-src.tar.gz && \
    cd ta-lib && ./configure && make && make install  && cd /tmp && rm -rf * && \
    pip3 install TA-Lib  && pip3 install jupyter && \
    apt-get --purge remove -y gcc make axel python3-dev default-libmysqlclient-dev libxml2-dev && \
    rm -rf /root/.cache/* && apt-get clean && apt-get autoremove -y

RUN echo `date +%Y-%m-%d:%H:%M:%S` >> /etc/docker.build && \
    sed -i -e 's/executemany(statement/executemany(statement.replace\("INSERT INTO","INSERT IGNORE INTO")/g' \
        /usr/local/lib/python3.6/site-packages/sqlalchemy/dialects/mysql/mysqldb.py && \
    rm -f /etc/cron.daily/apt-compat /etc/cron.daily/dpkg /etc/cron.daily/passwd && \
    sed -i -e 's/itertools\.izip/zip/g' \
    /usr/local/lib/python3.6/site-packages/torndb.py  && \
    sed -i -e 's/\+ CONVERSIONS\[field_type\]/\+ \[CONVERSIONS\[field_type\],bytes\]/g' \
    /usr/local/lib/python3.6/site-packages/torndb.py

#增加语言utf-8
ENV LANG=zh_CN.UTF-8
ENV LC_CTYPE=zh_CN.UTF-8
ENV LC_ALL=C
ENV PYTHONPATH=/data/stock