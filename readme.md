# learningOrchestra: a machine learning resource orchestrator :whale: (Building...) 

The learningOrchestra is a tool for distributed machine learning processing.

# Services

![](/readme_content/cluster.png)

## Tools and techniques used in this project

* [Docker](https://docs.docker.com/get-started/) - Container 
* [Docker Swarm](https://docs.docker.com/engine/swarm/) - Container Orchestrator 
* [Bitnami MongoDb](https://github.com/bitnami/bitnami-docker-mongodb) - A custom image from MongoDB 
* [GridFS](https://docs.mongodb.com/manual/core/gridfs/) - Mongo specification to work with large size files  ( > 16 MB) 
* [Visualizer](https://hub.docker.com/r/dockersamples/visualizer) - A service to state visualization of cluster 
* [Registry](https://hub.docker.com/_/registry) -  A private image repository service 
* [Mongo Replication](https://docs.mongodb.com/manual/replication/) - Data replication in mongo instances

## Documentation

### Requirements

* Linux hosts 
* [Docker Engine](https://docs.docker.com/engine/install/) installed in all instances of your cluster
* [Docker Compose](https://docs.docker.com/compose/install/) installed in manager instance of your cluster
* Ensure wich your cluster environment no has network traffic block, as firewalls rules in your network or owner firewall in linux hosts, case has firewalls or other blockers, insert learningOrchestra in blocked exceptions

### Deploy

Firstly, your cluster must being pre-configured in swarm mode, in your manager instance, insert this command bellow: 
```
sudo docker swarm init --advertise-addr IP_MANAGER
```
Where IP_MANAGER is the manager machine ip on your cluster network. The command result return another command to be insert in all another machines (workers) in your cluster, to be joined in swarm, more details in [swarm documentation](https://docs.docker.com/engine/swarm/swarm-tutorial/create-swarm/).

Ensure wich you location path is in project root (./learningOrchestra), in sequence, run the command bellow in manager instance to build and configure the learningOrchestra in your swarm cluster:
```
chmod 755 run.sh
sudo ./run.sh
```
If all things is happen good, the learningOrchestra is have been deployed in your swarm cluster, congrulations! :clap: :heart_eyes:

### Use
* Visualize cluster state (deployed services tasks and cluster's machines) - IP_FROM_CLUSTER:8080
* learningOrchestra GUI - IP_FROM_CLUSTER (PORT 80)


