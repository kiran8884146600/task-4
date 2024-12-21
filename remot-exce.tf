resource "aws_instance" "instance_1" {
    ami = "ami-0e2c8caa4b6378d8c"  
    instance_type = "t2.micro" 
    key_name= "aws_key"
    subnet_id       = aws_subnet.public_1a.id,aws_subnet.public_1b.id
    security_groups = [aws_security_group.instances.id]

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }
  }
