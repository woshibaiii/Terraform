variable "proxmox_host" {
  description = "Proxmox IP или hostname"
  type        = string
}

variable "proxmox_api_token" {
  description = "Proxmox API token"
  type        = string
  sensitive   = true
}

variable "vm_name" {
  description = "Имя VM"
  type        = string
  default     = "terraform-vm"
}

variable "vm_cores" {
  description = "Количество CPU"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "RAM в MB"
  type        = number
  default     = 2048
}

variable "vm_disk_size" {
  description = "Размер диска в GB"
  type        = number
  default     = 20
}

variable "vm_ip" {
  description = "IP адрес VM или dhcp"
  type        = string
  default     = "dhcp"
}

variable "ssh_public_key" {
  description = "SSH публичный ключ"
  type        = string
}

variable "vm_gateway" {
  description = "Gateway сети"
  type        = string
  default     = "192.168.1.1"
}

variable "ssh_user" {
  description = "Имя пользователя"
  type        = string
  default     = "ubuntu"
}

variable "proxmox_ssh_password" {
  description = "Proxmox root SSH password"
  type        = string
  sensitive   = true
}