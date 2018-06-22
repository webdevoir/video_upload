class Video < ApplicationRecord
  include ClipUploader::Attachment.new(:clip) 
end
