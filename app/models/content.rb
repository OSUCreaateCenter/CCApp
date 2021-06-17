class Content < ApplicationRecord
    belongs_to :category
    mount_uploader :file, FileUploader
end
