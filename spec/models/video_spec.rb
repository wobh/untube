require 'rails_helper'

RSpec.describe Video, type: :model do
  let(:video) { Video.new(video_params) }
  let(:video_params) { { :data => video_data,
                         :mime_type => video_mime_type,
                         :extension => video_extension,
                         :filename => video_filename } }
  let(:video_data) { "\x00\xDE\xAD\xBE\xEF\x01" } # TODO replace with minimal valid mp4
  let(:video_mime_type) { "video/mp4" }
  let(:video_extension) { ".mp4" }
  let(:video_filename) { "foo" }

  describe ".new" do

    it "should be valid" do
      expect(video.valid?).to be true
    end

    context "with invalid mime type" do
      let(:video_mime_type) { "video/foo" }

      it "should be invalid" do
        expect(video.invalid?).to be true
      end

      it "should have a error on mime_type" do
        expect{ video.valid? }.to change{ video.errors[:mime_type] }
      end
    end

  end

end
