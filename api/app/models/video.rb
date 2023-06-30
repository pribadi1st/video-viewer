class Video < ApplicationRecord
    has_one_attached :video

    belongs_to :category, foreign_key: :categories_id, class_name: "Category"
end
