module Services
    module Transformers
        class Prepend
            extend Services::Transformers::Meta 

            def initialize(prefix)
                @prefix = prefix 
            end 

            def transform(input)
                "#{@prefix}#{input}"
            end
        end
    end
end