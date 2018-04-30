provider "vra7" {
      username = "${var.username}"
      password = "${var.password}"
      tenant = "${var.tenant}"
      host = "${var.host}"
      insecure = true
}
 
resource "vra7_resource" "example" {
     catalog_name = "ServerType"
     count = 4
     resource_configuration = {
	machine.hostname = "somedummyname"
     }
     catalog_configuration = {
         lease_days = "5"
     }
}

output "example" {
  value = "${vra7_resource.example.*.resource_configuration.machine.hostname}"
}
