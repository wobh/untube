class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
 
  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  # GET /videos/1{:format}
  def show
    respond_to do |format|
      format.html { @video }
      format.json { render :show, status: :created, location: @video }
      format.mp4  { send_data @video.data,
                    filename: @video.filename + @video.extension,
                    type: @video.mime,
                    disposition: 'inline' }
    end
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_attrs)

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_attrs)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:data, :title, :description)
    end

    # Extract attributes from parameters
    def video_attrs
      data = video_params.fetch(:data)
      extension = File.extname(data.original_filename)
      video_params.slice(:title, :description).merge(
        { data: data.read,
          mime_type: data.content_type,
          extension: extension,
          filename: File.basename(data.original_filename, extension)
        })
    end
end
