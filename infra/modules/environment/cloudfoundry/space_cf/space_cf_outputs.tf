output "space_id" {
  value       = cloudfoundry_space.space.id
  description = "The GUID of the CF space."
}

output "space_name" {
  value       = cloudfoundry_space.space.name
  description = "The name of the CF space."
}
