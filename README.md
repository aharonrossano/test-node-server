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
kubectl create namespace test1
kubectl apply -f service-account.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

# debug
```
kubectl get service test-nodejs-1 -n test1

# manually expose
# kubectl expose deployment/test-nodejs-1 -n test1 --type="NodePort" --port=31000

# port forward locally
kubectl get pods
kubectl port-forward pods/test-nodejs-1-68fc6f494c-jdnrp 3000:31000 -n test1
# local:target

# get public ip
ibmcloud ks worker ls --cluster c302nhld0nsqqre4b2r0
# e.g http://169.57.99.132:31000/hello1

# double check end point is populated
kubectl describe services -n test1 test-nodejs-1
```