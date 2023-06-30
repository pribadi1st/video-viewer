class AddThumbnailsToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :thumb_small, :string
    add_column :videos, :thumb_medium, :string
    add_column :videos, :thumb_large, :string
  end
end
