require_relative '../spec_helper'

RSpec.describe Services::Transformer do

  describe '#transform' do

    before do
      @transformer = Services::Transformer.new()
    end 

    it 'applies a single transformartion' do  
      @transformer.add_transformer(Services::Transformers::ToLower.new)
      output = @transformer.transform('HELLO WORLD')    
      expect(output).to eq('hello world')        
    end

    it 'applies a transformation with a single argument' do
      @transformer.add_transformer(Services::Transformers::Prepend.new('Hello '))
      output = @transformer.transform('World')    
      expect(output).to eq('Hello World')     
    end

    it 'can apply multiple transformations' do 
      @transformer.add_transformer(Services::Transformers::Prepend.new('HELLO '))
      @transformer.add_transformer(Services::Transformers::ToLower.new())      
      output = @transformer.transform('WORLD')    
      expect(output).to eq('hello world')     
    end 

  end
end