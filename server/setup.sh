# Install Java 8
sudo yum install -y java-1.8.0-openjdk

# Remove Java 7
sudo yum remove -y java-1.7.0-openjdk

# Install GIT
sudo yum install -y git 

# Install GOCD server
echo "
[gocd]
name     = GoCD YUM Repository
baseurl  = https://download.gocd.io
enabled  = 1
gpgcheck = 1
gpgkey   = https://download.gocd.io/GOCD-GPG-KEY.asc
" | sudo tee /etc/yum.repos.d/gocd.repo
sudo yum install -y go-server

# Install Apache httpd
sudo yum install -y httpd24
sudo service httpd start
sudo chkconfig httpd on

# Proxy incoming traffic
cat << EOF | sudo tee -a /etc/httpd/conf.d/gocd.conf
<VirtualHost *:80>
  ServerName gocd.yourdomain.com
  ProxyPass "/" "http://localhost:8153/"
  ProxyPassReverse "/" "http://localhost:8153/"
  ProxyPreserveHost On
</VirtualHost>
EOF

# Restart httpd
sudo service httpd restart