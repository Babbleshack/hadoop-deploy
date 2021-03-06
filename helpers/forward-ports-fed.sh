#!/bin/bash

CLUSTER_A=yarn-subcluster-a
CLUSTER_B=yarn-subcluster-b
CLUSTER_C=yarn-subcluster-c

ROUTER_WEB=8089
RM_WEB=8088
JH_WEB=19888
TS_WEB=8188
SPARK_HIS=18080
SPARK_WEB=4040
YARN_PRXY=7071
kubectl port-forward -n $CLUSTER_A svc/yarn-master-service $YARN_PRXY $SPARK_WEB $SPARK_HIS $TS_WEB $ROUTER_WEB $RM_WEB $JH_WEB --address 0.0.0.0 & 
kubectl port-forward -n $CLUSTER_B svc/yarn-master-service 8099:$ROUTER_WEB 8098:$RM_WEB 19898:$JH_WEB --address 0.0.0.0 & 
kubectl port-forward -n $CLUSTER_C svc/yarn-master-service 8109:$ROUTER_WEB 8108:$RM_WEB 19908:$JH_WEB --address 0.0.0.0 
