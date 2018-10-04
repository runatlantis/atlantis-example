resource "aws_eip" "master-1" {
  vpc      = true
  tags { 
    Name = "Master-1"
  }
}

resource "aws_eip" "master-3" {
  vpc      = true
  tags { 
    Name = "Master-3"
  }
}


resource "aws_eip" "master-4" {
  vpc      = true
  tags { 
    Name = "Master-4"
  }
}
