variable "project_id" {
  description = "The ID of the project where this VPC will be created."
  type        = string
}

variable "tag_users" {
  description = "IAM binding for who can use the secure tag, for example 'user:jane@example.com'"
  type        = string
}
