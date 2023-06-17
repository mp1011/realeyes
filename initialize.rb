require 'byebug'
require "pry-byebug"
require 'pry'
require 'yaml'

require_relative 'services/transformer_registrar'
require_relative 'services/transformer'
require_relative 'services/transformers/meta'
require_relative 'services/transformers/to_lower'
require_relative 'services/transformers/prepend'
require_relative 'services/transformers/replace'
require_relative 'services/transformers/slice'
require_relative 'models/transformer_arg'
