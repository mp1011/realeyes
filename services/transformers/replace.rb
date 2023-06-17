module Services
    module Transformers
        class Replace
            extend Services::Transformers::Meta 

            def initialize(find, replace)
                @find = find
                @replace = replace
            end 

            def transform(input)
                input.sub(@find, @replace)
            end
        end
    end
end