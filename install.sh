cd ..
git clone --recursive https://github.com/ActivityWatch/activitywatch.git
cp activityWatcher/Dockerfile ../activitywatch/
cd activitywatch
docker build -t activitywatch .
docker run -it activitywatch make clean package/build
containerid=$(docker ps -all | grep activitywatcher | head -n 1 | awk '{print $1}')
docker cp $containerid:/opt/activitywatch .
