resource "random_pet" "dog" {
  length = 2
  separator = "-"
}

resource "random_pet" "cat" {
  length = 2
  separator = "-"
}

resource "random_pet" "fish" {
  length = 2
  separator = "-"
}

resource "random_pet" "donkey" {
  length = 2
  separator = "-"
}

output "pet-name" {
  value = random_pet.dog.id
}

output "pet-name" {
  value = random_pet.cat.id
}

output "pet-name" {
  value = random_pet.fish.id
}

output "pet-name" {
  value = random_pet.donkey.id
}

