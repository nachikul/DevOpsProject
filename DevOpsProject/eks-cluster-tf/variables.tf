variable "eks_cluster_name"{
    description = "Name of the EKS Cluster"
    default = "ConcentricAIEKS"
    type = string
}

variable "eks_cluster_version"{
    description = "Version of the EKS Cluster"
    default = "1.29"
    type = string
}

variable "instance_types"{
    description = "Version of the EKS Cluster"
    default = ["t3.medium", "t3.xlarge"]
    type = list
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 5
}
