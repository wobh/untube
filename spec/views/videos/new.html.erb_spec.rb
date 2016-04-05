require 'rails_helper'
require Rails.root.join('spec/support/factory_girl_support.rb')

RSpec.describe "videos/new", type: :view do
  before(:each) { assign(:video, build(:video)) }

  it "renders new video form" do
    render

    assert_select "form[action=?][method=?]", videos_path, "post" do

      assert_select "input#video_data[type=file][name=?]", "video[data]"

      assert_select "input#video_title[type=text][name=?]", "video[title]"

      assert_select "textarea#video_description[name=?]", "video[description]"
    end
  end
end
