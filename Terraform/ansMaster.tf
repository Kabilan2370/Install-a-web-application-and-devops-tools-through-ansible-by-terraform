provider "aws" {
  region = "us-east-1"
}

# ec2 master for ansible
resource "aws_instance" "master" {
  ami                     = "ami-0e86e20dae9224db8"
  instance_type           = "t2.micro"
  #vpc_id                     = ["vpc-08ca195199a502e91"]
  subnet_id                  = "subnet-0cd017b940fa1f7e8"
  key_name                = "beankey"
  associate_public_ip_address = "true"
  security_groups         = ["sg-04247582f52776c81","sg-0e133b35a09b1db4f"]
  tags = {
    name = "Master"
}
  user_data = <<EOF

#!/bin/bash

apt update
apt install python3-pip -y
apt install ansible-core -y
apt update
EOF

}

# ec2 master for ansible
resource "aws_instance" "slaves" {
    count = 2
  
  ami                     = "ami-0e86e20dae9224db8"
  instance_type           = "t2.micro"
  #vpc_id                     = ["vpc-08ca195199a502e91"]
  subnet_id                  = "subnet-0ce01f4f6ce8d0b9f"
  key_name                = "beankey"
  associate_public_ip_address = "true"
  security_groups         = ["sg-04247582f52776c81","sg-0e133b35a09b1db4f"]

  tags = {
    name = "Slaves"
}
  user_data = <<EOF
#!/bin/bash

apt update
apt install python3-pip -y
apt update
EOF

}