require 'rails_helper'
require Rails.root.join('spec/support/factory_girl_support.rb')

RSpec.describe "videos/edit", type: :view do
  before(:each) { @video = assign(:video, create(:video)) }

  it "renders the edit video form" do
    render

    assert_select "form[action=?][method=?]", video_path(@video.to_param), "post" do

      assert_select "input#video_data[type=file][name=?]", "video[data]"

      assert_select "input#video_title[type=text][name=?]", "video[title]"

      assert_select "textarea#video_description[name=?]", "video[description]"
    end
  end
end
