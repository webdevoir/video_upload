class TusUploader < Shrine
  storages[:cache] = storages[:tus]
end
