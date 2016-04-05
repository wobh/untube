# Setup FactoryGirl

RSpec.configure do |config|
  # Don't require qualified FactoryGirl methods
  config.include FactoryGirl::Syntax::Methods

  # Setup factory linting
  # TODO: install DatabaseCleaner
  # config.before(:suite) do
  #   begin
  #     DatabaseCleaner.start
  #     FactoryGirl.lint
  #   ensure
  #     DatabaseCleaner.clean
  #   end
  # end
end
