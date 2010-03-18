# aliasing.rb
 
module RubyLearning
  module Module
    def alias_method_chain(target, feature)
 
      target = target.to_s if target.is_a?(Symbol)
 
      # 1. Strip out the final exclamation mark or question mark or equal mark
      # from the name of the method, to put it at the end of the new aliases.    
      punctuation = target[-1,1]
      
      p "***called alias_method_chain***"
 
      if  /[\?!=]{1}$/.match(punctuation)
        aliased_target = target.chop
        p "aliased_target is: #{aliased_target}"
        p "punctuation is: #{punctuation}"
      else
        punctuation = ""
        aliased_target = target
        p "aliased_target is: #{aliased_target}"
      end
 
      # 2. If block given, it can pass the aliased method name and punctuation
      # to the block.
      yield(aliased_target, punctuation) if block_given?
      
      # 3. Alias the methods operation_with_feature() and operation_without_feature().
      operation_with_feature = "#{aliased_target}_with_#{feature}#{punctuation}"    
      operation_without_feature = "#{aliased_target}_without_#{feature}#{punctuation}"
      alias_method operation_without_feature, target
      alias_method target, operation_with_feature 
      
      # 4. Set the same visibility as original method - private or public or protected
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

