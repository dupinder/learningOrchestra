#!/bin/bash

echo "learningOrschestra: a machine learning resource orchestrator"
echo "--------------------------------------------------------------------"
echo "Buiding own images service..."
echo "--------------------------------------------------------------------"

docker-compose build --no-cache

echo "--------------------------------------------------------------------"
echo "Adding the image service in docker daemon security exception..."
echo "--------------------------------------------------------------------"

echo '{
  "insecure-registries" : ["myregistry:5050"]
}
' > /etc/docker/daemon.json

echo "--------------------------------------------------------------------"
echo "Restarting docker service..."
echo "--------------------------------------------------------------------"

service docker restart

echo "--------------------------------------------------------------------"
echo "Deploying learningOrchestra in swarm..."
echo "--------------------------------------------------------------------"

docker stack deploy --compose-file=docker-compose.yml service

echo "--------------------------------------------------------------------"
echo "Pushing the own service images in local repository..."
echo "--------------------------------------------------------------------"

sleep 30

database_api_repository=127.0.0.1:5050/database_api
database_api_tag=database_api


echo "--------------------------------------------------------------------"
echo "Pushing database_api service image..."
echo "--------------------------------------------------------------------"
docker push $database_api_repository:$database_api_tag

echo "--------------------------------------------------------------------"
echo "Removing database_api image from local host..."
echo "--------------------------------------------------------------------"
docker rmi $database_api_repository:$database_api_tag

frontend_repository=127.0.0.1:5050/frontend
frontend_tag=frontend

echo "--------------------------------------------------------------------"
echo "Pushing frontend service image..."
echo "--------------------------------------------------------------------"
docker push $frontend_repository:$frontend_tag

echo "--------------------------------------------------------------------"
echo "Removing frontend image from local host..."
echo "--------------------------------------------------------------------"
docker rmi $frontend_repository:$frontend_tag

spark_repository=127.0.0.1:5050/spark
spark_tag=spark

echo "--------------------------------------------------------------------"
echo "Pushing spark service image..."
echo "--------------------------------------------------------------------"
docker push $spark_repository:$spark_tag

echo "--------------------------------------------------------------------"
echo "Removing spark image from local host..."
echo "--------------------------------------------------------------------"
docker rmi $spark_repository:$spark_tag

echo "--------------------------------------------------------------------"
echo "End."
echo "--------------------------------------------------------------------"
