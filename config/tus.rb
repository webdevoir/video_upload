require "tus/storage/s3"

Tus::Server.opts[:storage] = Tus::Storage::S3.new(
  bucket:            "8ball-tv-dev", # required
  access_key_id:     "AKIAIG3M2QCAUQSG2ROA",
  secret_access_key: "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",
  region:            "us-east-1",
)
