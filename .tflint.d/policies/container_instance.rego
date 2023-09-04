package tflint

container_instances := terraform.resources("oci_container_instances_container_instance", {"container_restart_policy": "string"}, {})

deny_always_container_restart_policy[issue] {
  container_restart_policy := container_instances[_].config.container_restart_policy
  
  container_restart_policy.value == "ALWAYS"
    
  issue := tflint.issue("Container restart policy ALWAYS is forbidden", container_restart_policy.range)
}

