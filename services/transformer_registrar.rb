module Services
    class TransformerRegistrar

        attr_accessor :transformer_classes

        def initialize 
            @transformer_classes = []
        end 

        def register_class(klass)
            @transformer_classes << klass
        end

        def register_module(the_module)
            the_module.constants
                .map { |c| the_module.const_get(c) } 
                .each do |c|               
                    @transformer_classes << c if c.is_a?(Class)
                end
        end

        def get_transformer_class(name)
            @transformer_classes.find { |c| c.metadata['name'] == name }            
        end

        def create_transformer(name, *args)
            klass = get_transformer_class(name)         
            klass.new(*convert_to_proper_type(klass, args))
        end 

        def convert_to_proper_type(klass, args)
            args_meta = klass.args
            args.map.with_index do |a, index|
                args_meta[index].to_proper_type(a)
            end
        end
    end
end