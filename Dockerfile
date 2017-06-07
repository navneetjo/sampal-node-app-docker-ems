FROM node

RUN ln -s /usr/local/bin/node /usr/bin/node
#RUN ln -s /usr/local/bin/gulp /usr/bin/gulp

#adding all the source code to /data/artifact
RUN mkdir -p "/data/artifact"
WORKDIR /data/artifact/

#Adding the required source code and dependencies for running the application

#for CI
ADD node_modules node_modules
#ADD models models
ADD html html
#ADD examples examples
#ADD lib lib
#ADD target target
#ADD routes routes
#ADD gatling gatling
ADD app.js Dockerfile ./

#Setting timezone to match time zone of sonar server
RUN echo "Asia/Kolkata" > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

VOLUME ['./tmp']
 
CMD ["node","app.js"]
EXPOSE 3010
