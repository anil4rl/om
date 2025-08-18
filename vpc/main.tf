# ---- Get Latest Ubuntu 22.04 AMI ----
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# ---- Jenkins Master ----
module "jenkins" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  
  name                    = "jenkins-master"
  instance_type           = "t3.medium"
  vpc_security_group_ids  = ["sg-058443bbe0a580930"]
  subnet_id               = "subnet-03c601f524ea1c8b3"
  associate_public_ip_address = true
  key_name                = "anil44"
  ami                     = data.aws_ami.ubuntu.id
  user_data               = file("jenkins.sh")

  tags = {
    Role = "jenkins-master"
  }
}

# ---- Jenkins Agent ----
module "jenkins-agent" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  
  name                    = "jenkins-agent"
  instance_type           = "t3.medium"
  vpc_security_group_ids  = ["sg-058443bbe0a580930"]
  subnet_id               = "subnet-03c601f524ea1c8b3"
  associate_public_ip_address = true
  key_name                = "anil44"
  ami                     = data.aws_ami.ubuntu.id
  user_data               = file("jenkins-agent.sh")

  tags = {
    Role = "jenkins-agent"
  }
}

# ---- Outputs ----
output "jenkins_master_public_ip" {
  description = "Public IP of the Jenkins Master"
  value       = module.jenkins.public_ip
}

output "jenkins_agent_public_ip" {
  description = "Public IP of the Jenkins Agent"
  value       = module.jenkins-agent.public_ip
}
