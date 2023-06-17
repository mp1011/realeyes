module Services
    module Transformers
        class Slice
            extend Services::Transformers::Meta 

            def initialize(start, length)
                @start = start
                @length = length
            end 

            def transform(input)
                input.slice(@start, @length)
            end
        end
    end
end