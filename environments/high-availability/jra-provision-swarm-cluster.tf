# ---------------------------------------------------------------------------
# Provisions Docker Swarm on the newly created EC2 Instances
# ---------------------------------------------------------------------------

resource "null_resource" "swarm-cluster-provision" {
  depends_on = ["aws_instance.swarm-manager-az-1", "aws_instance.swarm-manager-az-1", "aws_instance.swarm-manager-az-3", "aws_instance.build-az-1", "aws_instance.build-az-2", "aws_instance.build-az-3", "aws_instance.app-api-service-az-1", "aws_instance.app-api-service-az-2", "aws_instance.app-api-service-az-3", "aws_instance.app-persistence-az-1", "aws_instance.app-persistence-az-2", "aws_instance.app-persistence-az-3", "aws_instance.app-ui-web-az-1", "aws_instance.app-ui-web-az-1", "aws_instance.app-ui-web-az-3"]

  provisioner "local-exec" {
    command =  "cp ${var.ansible-custom-configuration-file} ."
  }

  # Wait 60 seconds to give all the logging services a chance to start up
  provisioner "local-exec" {
    command =  "echo waiting 180 seconds to allow time for all EC2 instances to be created..."
  }

  # Wait 120 seconds to give all the instances a chance to fully spin up and become available
  provisioner "local-exec" {
    command =  "sleep 180s"
  }

  provisioner "local-exec" {
    command =  "ansible-playbook -i ${var.ansible-host-inventory-file} -v -u ${var.ansible-remote-host-user} -e env=${var.environment} -e docker_install_version=${var.ansible-docker-install-version} --private-key '${var.aws_key_path}' ${var.ansible-provision-swarm-cluster-playbook-file}"
  }
}
