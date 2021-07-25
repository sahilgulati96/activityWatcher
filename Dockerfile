#This is the Repo for Depedency of Watcher file Please refer https://hub.docker.com/repository/docker/sahilgulati102/activitywatcherdependency for detailed steps
FROM sahilgulati102/activitywatcherdependency:latest

#Set the Directory for Code 
WORKDIR /opt

#Step to force dockerfile to build always
RUN rm -rfv *
WORKDIR /opt/activitywatch
COPY . . 

#PreSteps for Build
#RUN git clone --recursive https://github.com/ActivityWatch/activitywatch.git
#WORKDIR /opt/activitywatch
RUN python3 -m venv venv
RUN chmod +x /opt/activitywatch/venv/bin/activate
RUN /opt/activitywatch/venv/bin/activate
RUN pip3 install --user pyinstaller
ENV PATH=$PATH:/root/.local/bin
CMD bash
#Run this step for Dev Environment to compile all code
#RUN make build

#Use this to package the code for Testing/PROD
#RUN make clean
#RUN make package
