resource "aws_instance" "ec2_instance" {
    provider           = aws.main
    count              = 3
    ami                = var.ami_id
    instance_type      = var.instance_type
    #availability_zone = element(["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"], count.index)
    availability_zone  = element(["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"], count.index)
    key_name           = var.key_pair
    #security_groups    = [var.security_group]
    vpc_security_group_ids = [var.security_group]


# Additional EBS volume
   root_block_device {
     volume_type = "gp2"
     volume_size = 10  # Size in GiB
    }

    user_data = <<-EOF
        #!/bin/bash
        # Add your user data script here
        yum update -y
        yum install httpd
        yum enabled httpd
        echo "<h1>Hello, World!</h1>" > /var/www/html/index.html
    EOF

    tags = {
    Name = "Testing-EC2-Instance-${count.index + 1}"
    }
}
