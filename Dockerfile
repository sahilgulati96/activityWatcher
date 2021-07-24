#This is the Repo for Depedency of Watcher file Please refer https://hub.docker.com/repository/docker/sahilgulati102/activitywatcherdependency for detailed steps
FROM sahilgulati102/activitywatcherdependency:latest

#Set the Directory for Code 
WORKDIR /opt

#Step to force dockerfile to build always
COPY . . 

#PreSteps for Build
RUN git clone --recursive https://github.com/ActivityWatch/activitywatch.git
RUN cd activitywatch
RUN mv * .. && rmdir activitywatch
RUN python3 -m venv venv
RUN chmod +x /opt/venv/bin/activate
RUN /opt/venv/bin/activate
RUN pip3 install --user pyinstaller
ENV PATH=$PATH:/root/.local/bin

#Run this step for Dev Environment to compile all code
RUN make build

#Use this to package the code for Testing/PROD
RUN make clean
RUN make package
