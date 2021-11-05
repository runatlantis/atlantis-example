resource "random_pet" "dog" {
  length = 2
  separator = "-"
}

output "pet-name" {
  value = random_pet.dog.id
}

