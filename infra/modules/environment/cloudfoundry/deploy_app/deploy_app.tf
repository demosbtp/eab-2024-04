resource "null_resource" "cf_app_deploy" {
  provisioner "local-exec" {
    #command = "cf login -a ${var.cf_api_endpoint} -u ${var.username} -p ${var.cf_password}"
    command = "cf login -a ${var.cf_api_endpoint}"
  }
  provisioner "local-exec" {
    command = "cf target -o ${var.cf_org_name} -s ${var.cf_space_name}"
  }
  provisioner "local-exec" {
    command = "cf deploy ${var.folder_cap_mtar}"
  }
}
