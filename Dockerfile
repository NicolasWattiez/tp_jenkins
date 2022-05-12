FROM gradle:latest
RUN mkdir /home/gradle/test-app
RUN mkdir /home/gradle/test-app/build
WORKDIR /home/gradle/test-app
VOLUME volume
COPY ./src /home/gradle/test-app/src
COPY ./build.gradle /home/gradle/test-app/
RUN apt update 
RUN apt install -yq python3
RUN apt install -yq python3-pip
RUN pip install pytest

RUN gradle packageDistribution --no-daemon --info
RUN gradle test