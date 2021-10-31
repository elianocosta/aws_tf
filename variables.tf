module "key-pair" {
  source     = "terraform-aws-modules/key-pair/aws"
  version    = "1.0.0"
  key_name   = "deployer-one"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDFNv8g5f0rxIFndtPRF8ZKfwA7X3pJhtkPxJpeYwtm+9A6WmERjdvDq2VKo3iLL9BS5ga0MkS+YzLirDhG4wV/pEIekZkJhxWmXTjnI6zlS6GQcONTC5EOSM8wlyr5/U3bmPaHoPdJxyOQYFVrZcLnmDeFQfKcz0iGnIRAcCWfhNTwvqMltJD9JUafkHnle4YH+aXAU6oKUvlMNFS7BUijx88ssUJT4vkpsEqg5KYSNdW+616OXaXLoQIltbaRb5wIfVOXA7NL3lfY00+mvjkaSR9QyYc3IJ4iwvunAN9kUWS1b1/pprsjzKcx+l2WuDqzH/R+v1hEd+gbrp00gKwe+NzbtAzDZlUML0HyU9jsgPraaRg9G55GQbq6hK+bytZ5zRlLwDt0FLfjdVDAB1QTxwnuvBYz6FvBXvkbvP16zbG6gze+YluOV+sMAdeRSRNq7sLzulxb9dTHqVzbyMjS/G+z8T/L4MHBq2DNys87wJPs4CSkMM+Di8P9ndWxb0cyJpghoz6IHjaccadI6UpVTrfRZB24Nkf2Y82+kk4lbkSF9zuKPTEloNXddEaxEdfMP0DlGuplsH4wtq2QvfkozrH7+Vt9aofThWpip5xl0Go/bE6cxtbw3xJj/Ix89RMEtZQLgdehM3mRFFJcsiQiI71+o/pNRgsIjUWfUyuO1w== eliano@DESKTOP-IMI4ATT"
}
resource "tls_private_key" "this" {
  algorithm = "RSA"
}

