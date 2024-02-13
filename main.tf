resource "aws_instance" "my_ubuntu" {
	ami = "ami-03f4878755434977f"
	instance_type = "t2.micro"
	tags ={ 
		Name = "terra-instance"
	}
}


resource "null_resource" "example" {
  provisioner "local_exec" {
	command = "echo hello world"
	}
}
