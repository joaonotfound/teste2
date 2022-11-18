FROM debian

WORKDIR /root/.wine/drive_c

RUN apt-get update
RUN apt-get upgrade -y
RUN dpkg --add-architecture i386
RUN apt-get install wget gnupg2 software-properties-common -y
RUN wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add -
RUN apt-add-repository https://dl.winehq.org/wine-builds/debian/
RUN apt-get update
RUN apt-get install --install-recommends winehq-stable -y
RUN wineboot

COPY ./lazarus ./lazarus/
COPY ./testelazarus ./project
COPY run.sh ./
RUN chmod +x run.sh

CMD ["./run.sh"]

