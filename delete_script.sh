#!/bin/bash

#Command

namespace=("argocd")
application1=("dive-dev-admin-console")
application2=("dive-dev-es")
application3=("dive-dev-kibana")
application4=("dive-dev-logstash")
application5=("dive-dev-redis")
application6=("dive-dev-resources")
application7=("dive-dev-trf")
application8=("dive-preprod-resources")
application9=("dive-preprod-sealed-secrets")
application10=("dive-stage-admin-console")
application11=("dive-stage-es")
application12=("dive-stage-kibana")
application13=("dive-stage-logstash")
application14=("dive-stage-redis")
application15=("dive-stage-resources")
application16=("dive-stage-trf")
application17=("tc-dive-customer-dev")
application18=("tc-dive-customer-stage")
application19=("tc-dive-preprod-registry")
application20=("tc-dive-product-dev")
application21=("tc-dive-product-stage")

kubectl delete application $application1 -n $namespace
sleep 30
 
kubectl delete application $application2 -n $namespace
sleep 30
 
kubectl delete application $application3 -n $namespace
sleep 30
 
kubectl delete application $application4 -n $namespace
sleep 30
 
kubectl delete application $application5 -n $namespace
sleep 30
 
kubectl delete application $application6 -n $namespace
sleep 30
 
kubectl delete application $application7 -n $namespace
sleep 30
 
kubectl delete application $application8 -n $namespace
sleep 30
 
kubectl delete application $application9 -n $namespace
sleep 30
 
kubectl delete application $application10 -n $namespace
sleep 30
 
kubectl delete application $application11 -n $namespace
sleep 30
 
kubectl delete application $application12 -n $namespace
sleep 30
 
kubectl delete application $application13 -n $namespace
sleep 30
 
kubectl delete application $application14 -n $namespace
sleep 30
 
kubectl delete application $application15 -n $namespace
sleep 30
 
kubectl delete application $application16 -n $namespace
sleep 30
 
kubectl delete application $application17 -n $namespace
sleep 30
 
kubectl delete application $application18 -n $namespace
sleep 30
 
kubectl delete application $application19 -n $namespace
sleep 30
 
kubectl delete application $application20 -n $namespace
sleep 30
 
kubectl delete application $application21 -n $namespace
sleep 30



echo "-----------------------------------------------"
echo "application deleted from $namespace sucessfully"
