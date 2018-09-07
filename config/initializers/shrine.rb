require "shrine"
require "shrine/storage/s3"

puts ENV["S3-REGION"]
s3_options = {
  bucket:            ENV["S3-BUCKET"],
  access_key_id:     ENV["S3-ACCESS"],
  secret_access_key: ENV["S3-SECRET"],
  region:            ENV["S3-REGION"]
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(**s3_options),
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # refresh metadata when attaching the cached file
Shrine.plugin :uppy_s3_multipart # load the plugin
