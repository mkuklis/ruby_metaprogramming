# aliasing.rb
 
module RubyLearning
  module Module
    def alias_method_chain(target, feature)
 
      target = target.to_s if target.is_a?(Symbol)
      aliased_target = target
      punctuation = ""
      
      if  /[\?!=]{1}$/.match(target[-1,1])
        aliased_target = target.chop
        punctuation = target[-1,1]
      end
 
      yield(aliased_target, punctuation) if block_given?
      
      operation_with_feature = "#{aliased_target}_with_#{feature}#{punctuation}"    
      operation_without_feature = "#{aliased_target}_without_#{feature}#{punctuation}"
      alias_method operation_without_feature, target
      alias_method target, operation_with_feature 
          
      if self.public_instance_methods(false).include?(target)
        public operation_with_feature, operation_without_feature 
      elsif self.private_instance_methods(false).include?(target)
        private operation_with_feature, operation_without_feature  
      else
        protected operation_with_feature, operation_without_feature 
      end
 
    end
  end
end

