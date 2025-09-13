module "mys3call2" {
  source = "./module/s3resource"

  bucket_name = var.mybuckname2
  s3_tag      = var.mytagname2
}