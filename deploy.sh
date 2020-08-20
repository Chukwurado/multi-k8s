docker build -t chukwurado/multi-client:latest -t chukwurado/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t chukwurado/multi-server:latest -t chukwurado/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t chukwurado/multi-worker:latest -t chukwurado/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push chukwurado/multi-client:latest
docker push chukwurado/multi-client:$SHA
docker push chukwurado/multi-server:latest
docker push chukwurado/multi-server:$SHA
docker push chukwurado/multi-worker:latest
docker push chukwurado/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=chukwurado/multi-server