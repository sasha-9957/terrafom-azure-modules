# AKS Deployment and Infrastructure Plan

> **NOTE**: THIS IS A WORK IN PROGRESS
>
> It is changing frequently, contains unfinished thoughts, and not intended to be a finalized proposal.

## Purpose of this document
Define Requirements and Guidelines for Creating Terraform Module for AKS 

### Guidelines

- Use AKS Resource group
- Optional input for the subnet ranges for Pod and Services ( use Vnet module )
- Create Network for AKS Pods and Services
- Has Disk Encryption
- Log Analytics integration
- Alerts and monitoring
- Microsoft Defender deployment
- Azure Policy deployment for AKS
- Create user and machine identity for Control Plane and Data Plane
- Enable command Run
- Enable role based access control
- Disable local User
- Create Private Cluster
- Disable Auto Upgrades and maintenance
- Integrate with frontdoor internal and external load balancers
- Create roles and assignments to have access to storage blobs,KeyVaults
- enable secrets management using KeyVaults
- Create roles and requiremnets for Velero Backup tool for AKS
- enable autoscaling workloads
- Install OMS agent
- Identity creation
 

