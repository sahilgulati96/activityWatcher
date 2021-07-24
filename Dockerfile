FROM sahilgulati102/activitywatcherdependency:latest
WORKDIR /opt
COPY . . 
RUN git clone --recursive https://github.com/ActivityWatch/activitywatch.git
RUN cd activitywatch
RUN mv * .. && rmdir activitywatch
RUN python3 -m venv venv
RUN chmod +x /opt/venv/bin/activate
RUN /opt/venv/bin/activate
RUN pip3 install --user pyinstaller
ENV PATH=$PATH:/root/.local/bin
RUN make build
RUN make clean
RUN make package
