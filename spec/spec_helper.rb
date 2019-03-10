require 'pry-gem'
require 'pry/testable'
require 'rspec'

RSpec.configure do |c|
  c.order = 'random'
  c.color = true
  c.disable_monkey_patching!
  c.include Pry::Testable::Evalable
end
