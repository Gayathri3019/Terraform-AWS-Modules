resource "aws_instance" "web-server-instance" {
  ami = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.availability_zone}"
  key_name = "${var.key_name}"
  network_interface {
    device_index = 0
    network_interface_id = "${var.interface_id}"
  
  }
  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install apache2 -y
                sudo systemctl start apache2
                sudo bash -c 'echo this is my terrafrom project> /var/www/html/index.html'
                EOF
  # provisioner "remote-exec" {
  #   inline = [
  #     "mkdir sample"
  #   ]
  
  # }
 
  tags = {
    Name = "web-server"
  }

}