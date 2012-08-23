require "test/unit"
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "shoulda/let"

class ShouldaLetTest < Test::Unit::TestCase
  context "Readme" do
    example = File.read(File.expand_path("../../Readme.md", __FILE__)).match(/<!-- example -->(.*)<!-- example -->/m)[1]
    eval example
  end
end
