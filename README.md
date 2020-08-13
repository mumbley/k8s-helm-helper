# k8s-helper
Container running Kubernetes `kubectl` and `helm` clients.  Useful for CI deployment tasks into Kubernetes
The build also includes `jamal`. A tool for converting json to yaml and yaml to json, AWS client and `git`.

The installation of AWS client does not include any authenticaiton method.  The assumption is that AWS EC2 
roles provide the required access priviliges for the container to perform AWS API tasks. See the documentation 
at the link below for details on how to configure IAM.

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html

The helper is fixed at `helm` version `2.11.0`.

`kubectl` cli is fixed at version `1.16.3`.
