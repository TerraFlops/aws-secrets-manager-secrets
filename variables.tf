variable "base_path" {
  type = string
  description = "Optional base path to be pre-pended to all secrets created"
  default = ""
}

variable "secrets" {
  type = list(object({
    path = string
    secret = string
    description = string
  }))
  description = "Secrets to be created"

}