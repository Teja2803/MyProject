module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "Jenkins"

  instance_type          = "t2.medium"
  key_name               = "key"
  monitoring             = true
  vpc_security_group_ids = module.aws.vpc_security_group_ids
  subnet_id              = module.aws.vpc.public_subnets.subnet_id

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}