# rubyist_with_count.rb
 
require 'rubyist'
require 'aliasing'
 
class Rubyist
  extend RubyLearning::Module
 
  def say_with_count!
    @count += 1
    p "#{@name}(#{@count}) starts greeting..."
    say_without_count!
    p "#{@name}(#{@count}) finished greeting..."
  end
  
  alias_method_chain(:say!, :count) do |method, punctuation|
  end
end

