# Create an S3 bucket for storing Terraform state files
resource "aws_s3_bucket" "S3-statefile" {
  # Name of the S3 bucket
  bucket = "omda-remote-statefile" 

  # Tags for identifying the bucket
  tags = {
    # Name of the bucket
    Name        = "remote state file"
    # Environment where the bucket is used
    Environment = "Dev"
  }
}
