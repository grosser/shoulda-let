require "shoulda"
require "shoulda/context"

context_class = (Shoulda::VERSION >= "3.0.0" ? Shoulda::Context::Context : Shoulda::Context)
context_class.class_eval do
  # setup method used outside of should blocks
  # let(:foo){ "Foo" }
  def let(name, &block)
    @let ||= {}
    if block
      @let[name] = block
    else
      @let.fetch(name){ parent.let(name) }
    end
  end
end

Test::Unit::TestCase.class_eval do
  # instance method used inside of should block
  # assert_equal @result, let(:foo)
  def let(name)
    @let ||= {}
    @let.fetch(name) do
      @let[name] = instance_exec(&@shoulda_context.let(name))
    end
  end
end
