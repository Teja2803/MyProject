module "ec2_instance" {
  depends_on = [module.vpc]
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "Jenkins"

  instance_type          = "t2.medium"
  ami                    = "ami-0e35ddab05955cf57"
  iam_instance_profile    = "ec2"
  key_name               = "key"
  monitoring             = true
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}