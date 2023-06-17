module Services
    module Transformers
        module Meta
                       
            def metadata 
                all_metadata = YAML.load_file('metadata.yml')
                class_name = self.name.split('::').last
                meta = all_metadata[class_name]

                meta.store('name', class_name) unless meta.key?('name')
                meta 
            end 

            def args
                args_meta = metadata['args']                
                ret = []
                
                args_meta.each do |key,value|
                    arg_class = Object.const_get(value['type'])
                    ret << Models::TransformerArg.new(key, arg_class)
                end

                ret
            end
        end
    end
end