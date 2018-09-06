require "aws-sdk-s3"

client = Aws::S3::Client.new(
  access_key_id:     ENV["S3-ACCESS"],
  secret_access_key: ENV["S3-SECRET"],
  region:            ENV["S3-REGION"],
)

client.put_bucket_cors(
  bucket: ENV["S3-BUCKET"],
  cors_configuration: {
    cors_rules: [{
      allowed_headers: ["Authorization", "Content-Type", "Origin", "ETag"],
      allowed_methods: ["GET", "POST", "PUT", "DELETE"],
      allowed_origins: ["*"],
      max_age_seconds: 3000,
    }]
  }
