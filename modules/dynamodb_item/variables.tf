
variable "dynamodbitem_prefix_name" {}
variable "account_id" {}

locals {
    json_data = jsondecode(file("${path.module}/../../Pipelines/SourceClass/pipelines.json"))
    #for_each read Pipeline folder and use each file and pass to item (next line)
    for_each = fileset("${path.module}/../../Pipelines/SourceClass/", "*")
    
    json_tmp = jsondecode(templatefile("${path.module}/../../Pipelines/SourceClass/pipelines_tmp.json",
    {
        one_value="one"
        two_value="two"
    }
    ))
}
