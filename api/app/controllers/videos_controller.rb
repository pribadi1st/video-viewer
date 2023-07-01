class VideosController < ApplicationController
  before_action :set_video, only: %i[show update destroy]
  before_action :check_video, only: %i[create]

  # GET /videos
  def index
    videos = Video.all.map do |video|
      {
        id: video.id,
        title: video.title,
        category: {
          text: video.category.name,
          value: video.category.id
        },
        url: if video.video.attached?
              rails_blob_url(video.video)
            end,
        thumbnails: video.get_thumbnails
      }
    end

    render_json(videos)
  end

  # GET /videos/1
  def show
    render json: @video
  end

  # POST /videos
  def create
    video = Video.new
    video.title = params[:title]
    video.categories_id= params[:category_id]
    video.video.attach({
      io: params[:video],
      filename: params[:video].original_filename,
      content_type: params[:video].content_type
    })
    if video.save
      video.generate_thumbnails(params[:video])
      render_json
      else
        render_json(nil, 422, "Cannot be procced")
      end

    # if @video.save
    #   render json: @video, status: :created, location: @video
    # else
    #   render json: @video.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /videos/1
  def update
    if @video.update(video_params)
      render json: @video
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  # DELETE /videos/1
  def destroy
    if @video.video.attached?
      @video.video.purge
    end
    @video.destroy
    render_json
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @video = Video.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def video_params
    params.permit(:title, :video, :category_id)
  end

  def check_video
    if params[:video].blank?
      render_json(nil, 422, "Video can't be blank")
    end
    # check video type
    if params[:video]&.content_type != 'video/mp4' && params[:video]&.content_type != 'video/mov'
      render_json(nil, 422, "Video must be mp4 or mov")
    end
    # check video size
    if params[:video]&.size.to_i > 200.megabytes
      render_json(nil, 422, "Video size must be less than 200 megabytes")
    end
  end
end
