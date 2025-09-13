module "mys3call2" {
  source = "./module/s3resource"

  bucket_name = var.mybuckname
  s3_tag      = var.mytagname
}