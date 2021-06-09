# test-node-server
test-node-server

# test locally:
```
docker login
docker build -t node-server .
docker run -d --name nodongo -p 3000:3000 node-server
```

# push to docker
```
docker tag node-server aharonrossano/test-nodejs-express-server
docker push aharonrossano/test-nodejs-express-server:1.0
```

# deployment to iks
```
ibmcloud cr namespace-add test1
kubectl apply -f service-account.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

kubectl port-forward svc/test-nodejs-1 3000:3000 -n test1 ?
```