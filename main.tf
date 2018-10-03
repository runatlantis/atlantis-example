resource "null_resource" "example" {
}

resource "aws_eip" "master-1" {
  vpc      = true
  tags { 
    Name = "Master-1"
  }
}
