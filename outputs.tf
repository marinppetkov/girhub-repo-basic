output "random_pet_names" {
  value = random_pet.random_names.*.id
}
output "null_generator" {
  value = null_resource.generate_names.*.id
}