# Use this file to base further factories on. A few guides:
#
# - Default factory should be have valid factory object
# - Use traits to specialize

# Required for using fixture_file_upload
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :video do
    data "\x00\xDE\xAD\xBE\xEF\x01" # TODO replace with minimal valid mp4
    mime_type "video/mp4"
    extension ".mp4"
    base_name "foo"
    title "Foo"
    description "Bar baz qux."
  end

  factory :video_parameters, class: ActionController::Parameters do
    skip_create

    data { fixture_file_upload(Rails.root.join('spec/fixtures/test.mp4'), 'video/mp4') }
    title "Foo"
    description "Bar baz qux"

    after(:build) do |_, proxy|
      proxy.file.close
    end
  end
end
