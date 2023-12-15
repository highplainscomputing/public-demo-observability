aws iam create-policy \                           
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam-policy.json

eksctl create iamserviceaccount \                 
--cluster=argo \                                      
--namespace=kube-system \                   
--name=aws-load-balancer-controller \
--attach-policy-arn=arn:aws:iam::xxxxxxxxxxxxx:policy/AWSLoadBalancerControllerIAMPolicy \
--override-existing-serviceaccounts \
--approve

helm repo add eks https://aws.github.io/eks-charts

helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=argo --set serviceAccount.create=false --set serviceAccount.name=aws-load-balancer-controller

kubectl apply -f ingress-resource.yaml
