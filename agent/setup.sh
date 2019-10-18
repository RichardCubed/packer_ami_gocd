# Install Java 8
sudo yum install -y java-1.8.0-openjdk

# Remove Java 7
sudo yum remove -y java-1.7.0-openjdk

# Add the GOCD package repo
echo "
[gocd]
name     = GoCD YUM Repository
baseurl  = https://download.gocd.io
enabled  = 1
gpgcheck = 1
gpgkey   = https://download.gocd.io/GOCD-GPG-KEY.asc
" | sudo tee /etc/yum.repos.d/gocd.repo

# Install a GOCD agent
sudo yum install -y go-agent

# Install GIT
sudo yum install -y git 

# Install telnet
sudo yum install -y telnet

# Install Node and NPM
curl -sL https://rpm.nodesource.com/setup_8.x | sudo bash -
sudo yum install -y nodejs

# Install Newman, the POSTman CLI runner
sudo npm install -g newman

# Install Terraform
sudo wget https://releases.hashicorp.com/terraform/0.12.1/terraform_0.12.1_linux_amd64.zip
sudo unzip terraform_0.12.1_linux_amd64.zip
sudo rm terraform_0.12.1_linux_amd64.zip
sudo mv terraform /bin

# Install Docker and associate it with the go user
sudo yum install -y docker
sudo usermod -a -G docker go
sudo service docker restart