animal = 'dog'

# def aninal.speak
def animal.speak
	p 'Dog says Woof!'
end
animal.speak

# singleton class
class << animal
	def speak
		p 'Dog says Woof!'
	end
end
animal.speak

# define_method (define_method is private hence send)
animal.class.send(:define_method, :speak, lambda { p 'Dog says Woof!' }) 
animal.speak

# instance_eval
animal.instance_eval do
	def speak
		p 'Dog says Woof!'
	end 
end
animal.speak

# module
module M
	def speak
		p 'Dog says Woof!'
	end 
end

# module, extend
animal.extend M
animal.speak

# module, include (include is private hence send)
animal.class.send(:include, M)
animal.speak

#send, lambda
animal.class.send(:define_method, :speak, lambda { p 'Dog says Woof!' })
animal.speak
