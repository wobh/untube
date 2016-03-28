require 'rails_helper'

RSpec.describe "videos/index", type: :view do
  before(:each) do
    assign(:videos, [
      Video.create!(
        :data => "",
        :filename => "",
        :extension => "MyText",
        :mime_type => "MyText",
        :title => "MyText",
        :description => "MyText"
      ),
      Video.create!(
        :data => "",
        :filename => "",
        :extension => "MyText",
        :mime_type => "MyText",
        :title => "MyText",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of videos" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
