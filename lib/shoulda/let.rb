require "shoulda"
require "shoulda/context"

context_class = (Shoulda::VERSION >= "3.0.0" ? Shoulda::Context::Context : Shoulda::Context)
context_class.class_eval do
  # setup method used outside of should blocks
  # let(:foo){ "Foo" }
  def let(name, &block)
    name = name.to_sym
    @let ||= {}
    if block
      @let[name] = block
    else
      @let.fetch(name){ parent.let(name) }
    end
  end

  def let_defined?(name)
    name = name.to_sym
    ( @let && @let.has_key?(name) ) ||
    ( parent.respond_to?(:let_defined?) && parent.let_defined?(name) )
  end
end

Test::Unit::TestCase.class_eval do
  # instance method used inside of should block
  # assert_equal @result, let(:foo)
  def let(name)
    @let_cache ||= {}
    @let_cache[name] ||= instance_exec(&@shoulda_context.let(name))
  end

  def method_missing(name, *arguments, &block)
    name = name.to_sym
    if arguments.length == 0 && block.nil? && @shoulda_context.let_defined?(name)
      let(name)
    else
      super
    end
  end

  def respond_to?(name, *arguments, &block)
    ( @shoulda_context && @shoulda_context.let_defined?(name) ) || super
  end
end
