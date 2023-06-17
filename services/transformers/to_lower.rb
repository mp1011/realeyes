module Services
    module Transformers
        class ToLower
            extend Services::Transformers::Meta

            def transform(input)
                input.downcase
            end
        end
    end
end