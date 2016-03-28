require 'rails_helper'

RSpec.describe "videos/new", type: :view do
  before(:each) do
    assign(:video, Video.new(
      :data => "",
      :filename => "",
      :extension => "MyText",
      :mime_type => "MyText",
      :title => "MyText",
      :description => "MyText"
    ))
  end

  it "renders new video form" do
    render

    assert_select "form[action=?][method=?]", videos_path, "post" do

      assert_select "filefield#video_data[name=?]", "video[id]"

      assert_select "textfield#video_title[name=?]", "video[title]"

      assert_select "textarea#video_description[name=?]", "video[description]"
    end
  end
end
