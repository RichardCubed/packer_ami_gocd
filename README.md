# packer_ami_gocd

Packer scripts to create AWS AMIs for a GOCD server and agent.  Both use t3.micro instances which should be enough for small to medium build tasks.  If you insist on using Java you might want to bump the agent to a t3.large ;)

## AMI Configuration

Source AMI: ami-035b3c7efe6d061d5 (Amazon Linux)<br/>
Instance size: t3.micro<br/>
Storage: Block (So it's ephemeral)<br/>

## Agent Configuration

Java (1.8.0-openjdk)<br/>
Telnet<br/>
Node.JS (Latest)<br/>
Newman (The POSTman CLI runner)<br/>
Terraform 0.12.1<br/>
Docker (Latest)<br/>

## Building

You'll need HashiCorp Packer, an AWS account, the AWS CLI tools installed locally and configured with your aws_access_key, aws_secret_key and aws_region.

```bash
packer build
```