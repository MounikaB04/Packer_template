packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

# variable "aws_region" {
#   default = "eu-west-1"
# }

source "amazon-ebs" "rhel" {
#   region           = var.aws_region
  source_ami       = "ami-0ec18f6103c5e0491"
  instance_type    = "t2.micro"
  ssh_username     = "ec2-user"
  ami_name         = "rhel-custom-{{timestamp}}"
}

build {
  sources = ["source.amazon-ebs.rhel"]

  provisioner "shell" {
    script = "script.sh"
  }

  post-processor "manifest" {
    output = "manifest.json"
  }
}
  