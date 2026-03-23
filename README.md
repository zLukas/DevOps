# DevOps
Devops usefull snippets

# Ansible
run single command on hosts:
```
$ ansible-cmd="ansible <group> -i <hosts_file> -m command -a"
$ $ansible-cmd " CMD "
```

# Gerrit
push new WIP:  
```
  $ git commit -m " message "
  $ git push origin HEAD:refs/for/branchr%wip`
```

push/change wip to active patset (not commit):
```
  $ git commit --ammend
  $ git push origin HEAD:refs/for/branch`
```


# Kubernetes
fetch and update kubeconfig from rancher rke2 master node:
```
$ master-fqdn=<fqdn>
$ ssh user@${master-fqdn} sudo  cat /etc/rancher/rke2/rke2.yaml > .kube/config && sed -i 's/127.0.0.1/'${master-fqdn}'/' .kube/config
```


# Salt

run state on host matching regex:  
` salt 'nodeName' state.apply state-name --output-diff test=True `  

run single command on hosts:  
`salt 'nodeName' run.cmd ' CMD '`
