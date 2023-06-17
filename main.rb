require_relative 'initialize'

@registrar = Services::TransformerRegistrar.new 
@registrar.register_module(Services::Transformers)
@transformer = Services::Transformer.new 

def prompt 
    print '> '
    gets.chomp
end

def help 
    puts 'list - list transformers'
    puts 'args <transformer> - list args for a transformer'
    puts 'add <transformer>,<arg1>,<arg2>, ... - adds a transformer'
    puts 'transform <input> - transforms the input'
    puts 'exit - quit the program'
end 

def list 
    @registrar.transformer_classes.each do |c|
        puts "* #{c.metadata['name']} - #{c.metadata['help']}"
    end
end

def show_args(class_name)
    klass = @registrar.get_transformer_class(class_name)

    if klass.args.length == 0
        puts 'No args'
    end 

    klass.args.each do |arg|
        puts "* #{arg.name} (#{arg.type})"
    end
end

def add_transformer(class_name, args)
    transformer = @registrar.create_transformer(class_name, *args)
    @transformer.add_transformer(transformer)
end 

def transform(input)
    puts @transformer.transform(input)
end

def parse_input
    selection = prompt.split(' ')
    action = selection.first 
    args = selection[1..].join(' ').split(',') if action

    case action
        when 'exit'
            @done = true
        when 'list'
            list 
        when 'args'
            show_args args[0]
        when 'add'
            add_transformer args[0], args[1..]
        when 'transform'
            transform args[0]
        else 
            help
    end 
rescue StandardError => e
    puts e.message
    puts e.backtrace
end

help

@done = false 
while !@done
    parse_input
end
