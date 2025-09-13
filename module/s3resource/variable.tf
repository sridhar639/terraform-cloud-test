variable "bucket_name" {
    type = string
    description = "Enter the Name of the bucket"
}

variable "s3_tag" {
  type = map(string)
  description = "Enter the Tags in Dict format"
}