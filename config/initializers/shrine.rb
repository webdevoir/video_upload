require "shrine"
require "shrine/storage/file_system"


s3_options = {
  bucket:            "8balltv-dev",
  access_key_id:     "AKIAINVXIEWADMD44UBQ",
  secret_access_key: "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",
  region:            "us-east-1"
}

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
}

Shrine.plugin :activerecord # or :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
Shrine.plugin :rack_file # for non-Rails apps
