# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

##
# Non thread-safe queue working using callbacks
# usable especially for evented environments such as EventMachine
#

class EventedQueue
  
    ##
    # Holds values stack.
    # @return [Array]
    #
    
    attr_accessor :stack
    @stack
    
    ##
    # Holds callbacks waiting for value.
    # @return [Array]
    #
    
    attr_accessor :callbacks
    @callbacks
    
    ##
    # Constructor.
    #
    
    def initialize
        @stack = [ ]
        @callbacks = [ ]
    end
    
    ##
    # Pushes value into the queue.
    # @param [Object]
    #
    
    def push(value)
        @stack << value
        if not @callbacks.empty?
            self.pop &@callbacks.shift
        end
    end
    
    ##
    # Pushes value out of the queue.
    # @yield [Object]
    #
    
    def pop(&block)
        if self.empty?
            @callbacks << block
        else
            yield @stack.shift
        end
    end
    
    ##
    # Indicates length of the queue.
    # @return [Integer]
    #
    
    def length
        @stack.length
    end
    
    ##
    # Indicates queue is empty.
    # @return [Boolean] +true+ it it is, +false+ otherwise
    #
    
    def empty?
        @stack.empty?
    end
    
    ##
    # Clears the queue.
    #
    
    def clear
        @stack.clear
    end
    
    alias :clear! :clear
    
end

=begin
q = EventedQueue::new
q.push("x")
q.push("y")

q.pop do |x|
    p x
end
q.pop do |x|
    p x
end
q.pop do |x|
    p x
end

q.push("z")
=end