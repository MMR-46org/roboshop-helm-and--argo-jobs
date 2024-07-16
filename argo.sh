argocd login argocd.madhanmohanreddy.tech --username admin --password $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d) --insecure --grpc-web


## env dev
kubectl create ns dev
for i in cart catalogue user payment shipping frontend ; do
  #argocd app create $i --repo https://github.com/raghudevopsb77/$i --path k8s --dest-namespace default --dest-server https://kubernetes.default.svc --directory-recurse --sync-policy none --grpc-web

  argocd app create $i --repo https://github.com/MMR-46org/roboshop-helm-and--argo-jobs.git --path helm/ --dest-namespace dev --dest-server https://kubernetes.default.svc --grpc-web --values dev/$i.yaml
  argocd app sync $i
done