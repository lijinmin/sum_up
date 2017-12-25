echo Restarting boot2docker...  
boot2docker down  
boot2docker up
echo Exporting Docker variables...  
sleep 1  
export DOCKER_HOST=tcp://192.168.59.103:2376  
export DOCKER_CERT_PATH=/Users/user/.boot2docker/certs/boot2docker-vm  
export DOCKER_TLS_VERIFY=1
sleep 1  
echo Removing orphaned images without tags...  
docker images | grep "<none>" | awk '{print $3}' | xargs docker rmi  