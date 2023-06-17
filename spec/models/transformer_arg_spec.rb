require_relative '../spec_helper'

RSpec.describe Models::TransformerArg do
    it 'lists the arguments of Prepend' do
        
        args = Services::Transformers::Prepend.args
    
        expect(args.length).to eq(1)
        expect(args[0].type).to eq(String)
        expect(args[0].name).to eq('prefix')        
    end    
 end