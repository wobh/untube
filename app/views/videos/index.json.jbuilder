json.array!(@videos) do |video|
  json.extract! video, :id, :data, :filename, :extension, :mime_type, :title, :description
  json.url video_url(video, format: :json)
end
