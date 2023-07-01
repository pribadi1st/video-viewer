class Video < ApplicationRecord
    has_one_attached :video
    has_one_attached :thumbnail_small
    has_one_attached :thumbnail_medium
    has_one_attached :thumbnail_large

    belongs_to :category, foreign_key: :categories_id, class_name: "Category"

    def get_thumbnails
        {
            small: thumbnail_small.url,
            medium: thumbnail_medium.url,
            large: thumbnail_large.url
        }
    end

    def generate_thumbnails(video_file=nil)
        if !video_file.present? && !video.attached?
            return
        end

        video_path = video_file.tempfile.path

        generate_thumbnail(video_path, :thumbnail_small, 64)
        generate_thumbnail(video_path, :thumbnail_medium, 128)
        generate_thumbnail(video_path, :thumbnail_large, 256)
    end

    private

    def generate_thumbnail(video_path, thumbnail_name, size)
        thumbnail_path = "#{Rails.root}/tmp/#{SecureRandom.hex}.png"

        # Use FFmpeg to extract the thumbnail
        `ffmpeg -i #{video_path} -ss 00:00:02.000 -vframes 1 -vf "scale=#{size}:-1" #{thumbnail_path}`

        # Attach the thumbnail to the video
        send(thumbnail_name).attach(io: File.open(thumbnail_path), filename: 'thumbnail.png')

        # Delete the temporary thumbnail file
        File.delete(thumbnail_path) if File.exist?(thumbnail_path)
    end
end
