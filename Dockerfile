FROM  i686/ubuntu

RUN apt-get update
RUN apt-get -y install wget git nano gcc g++ make bison flex unzip && apt-get clean

#RUN cd ~ && git clone https://github.com/westerndigitalcorporation/DiskSim

RUN cd /home && wget http://www.pdl.cmu.edu/PDL-FTP/DriveChar/disksim-4.0-with-dixtrac.tar.gz \
    && wget https://download.microsoft.com/download/9/7/A/97A84DF6-E0F6-4F52-AEAB-C5AE453CE61D/ssd-add-on.zip \
    && tar zxf disksim-4.0-with-dixtrac.tar.gz \
    && cd /home/disksim-4.0 \
    && unzip ../ssd-add-on.zip

ADD modify.patch /home/disksim-4.0/

RUN cd /home/disksim-4.0 \
    && patch -p1 < ssdmodel/ssd-patch \
    && patch -p1 < modify.patch
