resource "null_resource" "example" {
  triggers = {
    cluster_instance_ids = join(",", aws_instance.cluster.*.id)
}
