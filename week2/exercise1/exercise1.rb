require 'dog'


lassie, fido, stimpy = %w[Lassie Fido Stimpy].collect{|name| Dog.new(name)}
lassie.can :dance, :poo, :laugh
fido.can(:poo){" is smelly."}
stimpy.can :dance
stimpy.can(:cry){" cried AHHHH"}

p lassie.dance
p lassie.poo
p lassie.laugh
puts
p fido.dance
p fido.poo
p fido.laugh
puts
p stimpy.dance
p stimpy.poo
p stimpy.laugh
p stimpy.cry
