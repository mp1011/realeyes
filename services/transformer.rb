module Services
    class Transformer
        
        def initialize()
            @transformers = []
        end

        def add_transformer(transformer)
            @transformers << transformer
        end

        def transform(input)
            @transformers.reduce(input) do |output,transformer|                
                transformer.transform(output)
            end 
        end
    end
end