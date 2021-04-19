class Category < ApplicationRecord
    has_many :contents
    enum status: [ :staff, :other]
end
