output "app_info" {
  value       = null_resource.cf_app_deploy
  description = "The metadata of the deployed app."
}
