require 'test_helper'
require 'generators/chucky_erb/chucky_erb_generator'

class ChuckyErbGeneratorTest < Rails::Generators::TestCase
  tests ChuckyErbGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
