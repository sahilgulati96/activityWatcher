cd ..
git clone --recursive https://github.com/ActivityWatch/activitywatch.git
cp activityWatcher/Dockerfile ../activitywatch/
cd activitywatch
docker build -t activitywatch .
#docker run -it activitywatch make clean package/build ## build for Dev env and clean pacakge for Prod and Test
## Since there are some compilation issues with the repo hence using dummy to generate container id
docker run activitywatch bash ## Comment this if compilation issues are fixed
containerid=$(docker ps -all | grep activitywatch | head -n 1 | awk '{print $1}')
docker cp $containerid:/opt/activitywatch .
