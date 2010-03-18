module ClassMethods
 define_method :tr_vowel, lambda { |str| str.tr 'aeiou', '*' }
end

module InstanceMethods
 define_method :tr_vowel, lambda { tr 'aeiou', '*' }
end

MaskedString = Class.new(String) do
 extend ClassMethods
 include InstanceMethods
end
