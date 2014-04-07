require "shoulda"
require "shoulda/context"
require 'shoulda/let/context_support'
require 'shoulda/let/test_case_support'

context_class = (defined?(Shoulda::Context::Context) ? Shoulda::Context::Context : Shoulda::Context)
context_class.class_eval do
  include Shoulda::Let::ContextSupport
end

if defined?(MiniTest)
  MiniTest::Unit::TestCase.class_eval do
    include Shoulda::Let::TestCaseSupport
  end
end

Test::Unit::TestCase.class_eval do
  include Shoulda::Let::TestCaseSupport
end
