class Video < ApplicationRecord
  #see https://github.com/shrinerb/shrine for more info
  #on Shrine's uploader objects
  include ClipUploader::Attachment.new(:clip)
  validates :uploader_name, :uploader_email, :title, presence: true
end
