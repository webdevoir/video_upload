require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"
require "shrine/storage/tus"

s3_options = {
  bucket:            "8balltv-dev",
  access_key_id:     "AKIAIHAH3WAMGQELTI7Q",
  secret_access_key: "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",
  region:            "us-east-1"
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(**s3_options),
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # refresh metadata when attaching the cached file


#https://github.com/shrinerb/shrine/wiki/Adding-Direct-S3-Uploads
Shrine.plugin :presign_endpoint, presign_options: { method: :put }
route do |r|
  r.on "presign" do
    r.run Shrine.presign_endpoint(:cache)
  end
end
