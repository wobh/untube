require 'rails_helper'
require Rails.root.join('spec/support/factory_girl_support.rb')

RSpec.describe "videos/index", type: :view do
  before(:each) { assign(:videos, [ create(:video), create(:video) ]) }

  it "renders a list of videos" do
    render
    assert_select "tr>td", :text => "foo".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "foo".to_s, :count => 2
  end
end
