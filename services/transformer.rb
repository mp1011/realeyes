module Services
    class Transformer
        
        def initialize()
            @transformers = []
        end

        def add_transformer(transformer)
            @transformers << transformer
        end

        def transform(input)
            output = input 
            @transformers.each do |t|
                output = t.transform(output)
            end

            output
        end
    end
end