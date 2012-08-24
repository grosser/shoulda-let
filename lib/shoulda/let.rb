require "shoulda"
require "shoulda/context"

context_class = (Shoulda::VERSION >= "3.0.0" ? Shoulda::Context::Context : Shoulda::Context)
context_class.class_eval do
  def let(name, &block)
    @let ||= {}
    if block
      @let[name] = block
    else
      @let.fetch(name){ parent.let(name) }
    end
  end
end

instance_class = (Shoulda::VERSION >= "3.0.0" ? Test::Unit::TestCase : Shoulda::InstanceMethods)
instance_class.class_eval do
  def let(name)
    @let ||= {}
    @let.fetch(name) do
      @let[name] = instance_exec(&@shoulda_context.let(name))
    end
  end
end
