FROM stkreport/stkreport:base-2020-07
WORKDIR /data
EXPOSE 8888 9999
ADD AGU_ALLCODE.py /data/AGU_ALLCODE.py