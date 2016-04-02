class Video < ActiveRecord::Base
  def supported_mime_types
    %w[video/mp4]
  end

  validates :mime_type, presence: true, mime_type: true
end
