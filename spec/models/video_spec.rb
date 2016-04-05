require 'rails_helper'
require Rails.root.join('spec/support/factory_girl_support.rb')

RSpec.describe Video, type: :model do
  subject(:video) { build(:video) }

  describe ".new" do

    it "should be valid" do
      expect(video.valid?).to be true
    end

    context "with invalid mime type" do
      subject(:video) { build(:video, mime_type: "video/foo") }

      it "should be invalid" do
        expect(video.invalid?).to be true
      end

      it "should have a error on mime_type" do
        expect{ video.valid? }.to change{ video.errors[:mime_type] }
      end
    end

  end

end
