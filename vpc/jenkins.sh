sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install openjdk-17-jdk -y
sudo mkdir -p /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \ https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] \ https://pkg.jenkins.io/debian-stable binary/" | sudo tee \ /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo ufw allow 8080
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status
echo "Jenkins installation completed. Access it at http://your_server_ip:8080"
echo "To unlock Jenkins, run the following command to get the initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo "Copy the password and paste it into the Jenkins setup page."
echo "For further configuration, follow the on-screen instructions in Jenkins."
echo "Jenkins is now set up and running."
echo "You can access Jenkins at http://your_server_ip:8080"