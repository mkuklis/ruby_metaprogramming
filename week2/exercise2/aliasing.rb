# aliasing.rb
 
module RubyLearning
  module Module
    def alias_method_chain(target, feature)
 
      aliased_target, punctuation = target.to_s.sub(/([?!=])$/, ''), $1
 
      yield(aliased_target, punctuation) if block_given?
      
      operation_with_feature = "#{aliased_target}_with_#{feature}#{punctuation}"    
      operation_without_feature = "#{aliased_target}_without_#{feature}#{punctuation}"
      alias_method operation_without_feature, target
      alias_method target, operation_with_feature 
          
      case
        when public_method_defined?(operation_without_feature)
          public target
        when protected_method_defined?(operation_without_feature)
          protected target
        when private_method_defined?(operation_without_feature)
          private target
      end
    end
  end
end

