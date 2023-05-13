output "instance_id" {
  value = aws_instance.openvpn_server.id
}

output "elastic_ip" {
  value = aws_eip.openvpn_eip.public_ip
}