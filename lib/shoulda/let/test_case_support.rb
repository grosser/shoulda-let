module Shoulda
  module Let

    module TestCaseSupport
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

  end
end
