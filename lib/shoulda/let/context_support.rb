module Shoulda
  module Let

    module ContextSupport
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

      def let!(name, &block)
        let(name, &block)
        setup { let(name) }
      end

      def let_defined?(name)
        name = name.to_sym
        ( @let && @let.has_key?(name) ) ||
        ( parent.respond_to?(:let_defined?) && parent.let_defined?(name) )
      end
    end

  end
end
