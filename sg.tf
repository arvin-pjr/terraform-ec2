resource "aws_security_group" "mw-sg" {
  name        = "prometheus-sg"

  tags = {
    Name = "prometheus-sg"
  }
}

## Security group rules

resource "aws_security_group_rule" "mw-asg-ingress-rule" {
  count 			= length([ "22", "80" ])
  type              = "ingress"
  from_port         = element([ "22", "80" ], count.index)
  to_port           = element([ "22", "80" ], count.index)
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.mw-sg.id
}

resource "aws_security_group_rule" "mw-asg-egress-rule" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.mw-sg.id
}
