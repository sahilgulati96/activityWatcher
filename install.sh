cd ..
git clone --recursive https://github.com/ActivityWatch/activitywatch.git
cp activityWatcher/Dockerfile ../activitywatch/
cd activitywatch
sudo docker build -t activitywatch .
sudo docker run -it activitywatch make clean package/build
containerid=$(docker ps -all | grep activitywatcher | head -n 1 | awk '{print $1}')
sudo docker cp $containerid:/opt/activitywatch .
