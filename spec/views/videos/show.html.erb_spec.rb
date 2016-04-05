require 'rails_helper'
require Rails.root.join('spec/support/factory_girl_support.rb')

RSpec.describe "videos/show", type: :view do
  before(:each) { @video = assign(:video, create(:video)) }

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Foo/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Foo/)
  end
end
