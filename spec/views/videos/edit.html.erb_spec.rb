require 'rails_helper'

RSpec.describe "videos/edit", type: :view do
  before(:each) do
    @video = assign(:video, Video.create!(
      :data => "",
      :filename => "",
      :extension => "MyText",
      :mime_type => "MyText",
      :title => "MyText",
      :description => "MyText"
    ))
  end

  it "renders the edit video form" do
    render

    assert_select "form[action=?][method=?]", video_path(@video), "post" do

      assert_select "filefield#video_data[name=?]", "video[id]"

      assert_select "textfield#video_title[name=?]", "video[title]"

      assert_select "textarea#video_description[name=?]", "video[description]"
    end
  end
end
