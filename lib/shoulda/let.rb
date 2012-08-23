require "shoulda"

Shoulda::Context.class_eval do
  def let(name, &block)
    @let ||= {}
    if block
      @let[name] = block
    else
      @let.fetch(name){ parent.let(name) }
    end
  end
end

Shoulda::InstanceMethods.class_eval do
  def let(name)
    @let ||= {}
    @let.fetch(name) do
      @let[name] = instance_exec(&@shoulda_context.let(name))
    end
  end
end
