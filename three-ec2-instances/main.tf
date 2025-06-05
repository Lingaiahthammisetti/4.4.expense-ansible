resource "aws_instance" "expense" {
    for_each = var.instances
    ami           = data.aws_ami.rhel_info.id
    instance_type = each.value
    vpc_security_group_ids = [var.allow_all]
   
    user_data = <<-EOF
              #!/bin/bash
              sudo dnf install ansible -y
              EOF

    tags = {
        Name = each.key
    }
}
resource "aws_route53_record" "expense_r53" {
    for_each = aws_instance.expense
    zone_id = var.zone_id
    #name    = each.key == "frontend"? var.domain_name : "${each.key}.${var.domain_name}" 
    name    = "${each.key}.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = each.key == "frontend" ? [each.value.public_ip]:[each.value.private_ip]
    allow_overwrite = true
}