module Models
    class TransformerArg 
        attr_accessor :name, :type

        def initialize(name, type)
            @name = name 
            @type = type
        end 

        def to_proper_type(arg)            

            return arg if arg.is_a?(type)

            if arg.is_a?(String)
                return arg if type == String
                return arg.to_i if type == Integer 
    
                raise "Cannot convert string to #{type}"                
            end 

            raise "Cannot convert #{arg.class} to #{type}"
        end
    end 
end