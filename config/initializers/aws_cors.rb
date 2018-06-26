require "aws-sdk-s3"

client = Aws::S3::Client.new(
  access_key_id:     "AKIAIHAH3WAMGQELTI7Q",
  secret_access_key: "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",
  region:            "us-east-1",
)

client.put_bucket_cors(
  bucket: "8balltv-dev",
  cors_configuration: {
    cors_rules: [{
      allowed_headers: ["Authorization", "Content-Type", "Origin"],
      allowed_methods: ["GET", "POST", "PUT"],
      allowed_origins: ["*"],
      max_age_seconds: 3000,
    }]
  }
)
