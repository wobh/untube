class Video < ActiveRecord::Base
  def supported_mime_types
    %w[video/mp4]
  end

  def file_name
    @file_name ||= base_name + extension
  end
  alias :filename :file_name

  validates :mime_type, presence: true, mime_type: true
end
