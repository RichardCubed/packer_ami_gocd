# packer_ami_gocd

Packer scripts to create AWS AMIs for a GOCD server and agent.  Both use t3.micro instances which should be enough for small to medium build tasks.  If you insist on using Java you might want to bump the agent to a t3.large ;)

## AMI Configuration

Source AMI: ami-035b3c7efe6d061d5 (Amazon Linux)
Instance size: t3.micro
Storage: Block (So it's ephemeral)

## Agent Configuration

Java (1.8.0-openjdk)
Telnet
Node.JS (Latest)
Newman (The POSTman CLI runner)
Terraform 0.12.1
Docker (Latest)

## Building

You'll need HashiCorp Packer (obvioiusly) an AWS account, the AWS CLI tools installed locally and configured with your aws_access_key, aws_secret_key and aws_region.

```bash
packer build
```