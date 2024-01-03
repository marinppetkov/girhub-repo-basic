resource "random_pet" "random_names" {
  length = var.names_num
  prefix = "name"
  separator = "_"
  count = var.instances
}

resource "null_resource" "generate_names" {
  count = length(random_pet.random_names)
  provisioner "local-exec" {
    command = "echo ${random_pet.random_names[count.index].id} >> test.txt"
  }
  triggers = {
    random_pet_ids = join(",",random_pet.random_names[*].id)
  }
}