resource "aws_eip" "master-1" {
  vpc      = true
  tags { 
    Name = "Master-1"
  }
}


resource "aws_eip" "master-2" {
  vpc      = true
  tags { 
    Name = "Master-2"
  }
}



resource "aws_eip" "master-6" {
  vpc      = true
  tags { 
    Name = "Master-6"
  }
}
