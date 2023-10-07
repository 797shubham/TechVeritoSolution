resource "aws_ebs_volume" "data-vol" {
  availability_zone = "us-east-2c"
  size = var.size
  tags ={
      Name = "ems-data-volume"
  }

}

resource "aws_volume_attachment" "data-vol-attach" {
  device_name = "/dev/sdc"
  volume_id = aws_ebs_volume.data-vol.id
  instance_id = aws_instance.ems_host.id

}
