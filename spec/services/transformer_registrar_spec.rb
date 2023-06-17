require_relative '../spec_helper'

RSpec.describe Services::TransformerRegistrar do
    describe '#transformer_classes' do
      it 'lists transformers after adding' do
     
        registrar = Services::TransformerRegistrar.new 
        expect(registrar.transformer_classes).to eq([])
       
        registrar.register_class(Services::Transformers::ToLower)

        expect(registrar.transformer_classes.first.name).to eq('Services::Transformers::ToLower')
        
      end

      it 'can register all classes in a module' do
        registrar = Services::TransformerRegistrar.new
        registrar.register_module(Services::Transformers)
        expect(registrar.transformer_classes.length).to be > 1        
      end
    end

    describe '#get_transformer_class' do 
      it 'gets a transformer class with a given name' do
        registrar = Services::TransformerRegistrar.new
        registrar.register_module(Services::Transformers)

        klass = registrar.get_transformer_class('To Lower')
        expect(klass.name).to eq('Services::Transformers::ToLower')
        expect(klass.metadata['name']).to eq('To Lower')
      end
    end

    describe '#create_transformer' do 
      it 'can create a transformer with arguments' do
        registrar = Services::TransformerRegistrar.new
        registrar.register_module(Services::Transformers)

        transformer = registrar.create_transformer('Prepend', 'Hello ')

        output = transformer.transform('World')
        expect(output).to eq('Hello World')
      end

      it 'can create a transformer with integer arguments from strings' do
        registrar = Services::TransformerRegistrar.new
        registrar.register_module(Services::Transformers)

        transformer = registrar.create_transformer('Slice', '2', '3')

        output = transformer.transform('HELLO WORLD')
        expect(output).to eq('LLO')
      end
    end

  end