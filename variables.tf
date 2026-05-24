variable "proxmox_host" {
  description = "Proxmox IP или hostname"
  type        = string
}

variable "proxmox_api_token" {
  description = "Proxmox API token"
  type        = string
  sensitive   = true
}
