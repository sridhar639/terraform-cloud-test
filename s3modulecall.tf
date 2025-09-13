module "mys3call" {
  source = "./module/s3resource"

  bucket_name = var.mybuckname
  s3_tag      = var.mytagname
}