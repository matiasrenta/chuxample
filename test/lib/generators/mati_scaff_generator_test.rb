require 'test_helper'
require 'generators/mati_scaff/mati_scaff_generator'

class MatiScaffGeneratorTest < Rails::Generators::TestCase
  tests MatiScaffGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
