# Deployment
> NOTE: Project can also be run locally. Deployment is used to speed up execution by parallelizing across several AWS instances (or fewer larger ones)
## Prerequisites
Successfully deploying the project requires two things to be present in *this* directory:
- An AWS API-key named `aws-key.pem`
- A Google Service Account API-key `gserviceaccount-client-secret.json`

In addition, all AWS instances must be created in the [AWS Management Console](https://aws.amazon.com/console/) before deployment.

## Deploying to AWS instances
To deploy to AWS instances, simply run `transfer.sh` with the public-facing URLs of the instances. For example, to deploy to the two AWS instances `ec2-19-212-134-34.us-east-2.compute.amazonaws.com` and `ec2-18-217-144-34.us-east-2.compute.amazonaws.com`, you would run the following command:
```
transfer.sh ec2-19-212-134-34.us-east-2.compute.amazonaws.com ec2-18-217-144-34.us-east-2.compute.amazonaws.com 
```
Workload will be distributed uniformly among the provided AWS instances.

## Summary of available files
### `deploy.sh`
This script is the one used to deploy to AWS. It takes a list of AWS cloud instances and deploys the application to each one. It does the following:
- Set up an all-included image of the required files, stored in `app/`
- Run `transfer.sh` for each instance

### `transfer.sh`
This file does the following:
- Remotely log in to the AWS instance passed as argument
- Copy the contents of `app/` over to the AWS instance.
- Transfer `build_and_exec.sh` over to the AWS instance and run the script on the remote computer.

### `build_and_exec.sh`
As mentioned, this is run locally on each AWS instance. It does the following:
- Navigate to the directory that the application was deployed to
- Install Anaconda Navigator
- Execute `Analysis.ipynb`
