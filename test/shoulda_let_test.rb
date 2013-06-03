require "test/unit"
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "shoulda/let"

class ShouldaLetTest < Test::Unit::TestCase
  context "Readme" do
    example = File.read(File.expand_path("../../Readme.md", __FILE__)).match(/<!-- example -->(.*)<!-- example -->/m)[1]
    eval example
  end

  should "pass through to regular Test::Unit::TestCase method_missing" do
    begin
      undefined_let
    rescue NoMethodError
      flunk
    rescue NameError
    else
      flunk
    end
  end
end
