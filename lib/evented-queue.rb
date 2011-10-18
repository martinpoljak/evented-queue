# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

require "evented-queue/abstract"
require "unified-queues/single"

##
# Non thread-safe queue working using callbacks
# usable especially for evented environments such as EventMachine
#

class EventedQueue < AbstractEventedQueue
  
    ##
    # Holds values stack.
    # @return [UnifiedQueues::Single]
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
    # @param [UnifiedQueues::Single]  stak holder instance wrapped to unified queue
    #
    
    def initialize(stack = UnifiedQueues::Single::new(Array))
        @stack = stack
        @callbacks = [ ]
    end
    
    ##
    # Pushes value into the queue. Priority isn't supported
    # by default but can be obtained using the +stack+ argument
    # of constructor by giving priority queue instance.
    #
    # @param [Object] value  value to push
    # @param [Object] key  key fo priority purposes
    # @yield [nil]
    #
    
    def push(value, key = value, &block)
        @stack.push(value, key)
        if not @callbacks.empty?
            self.pop &@callbacks.shift
        end
        
        yield if not block.nil?
    end
    
    ##
    # Pushes value out of the queue.
    #
    # @yield [Object] value from the queue
    # @yield [Object] value from the queue
    #
    
    def pop(&block)
        if self.empty?
            @callbacks << block
        else
            result = @stack.pop
            yield result if not block.nil?
            return result
        end
    end
    
    ##
    # Indicates length of the queue.
    #
    # @return [Integer] length of the queue
    # @yield [Integer] length of the queue
    #
    
    def length(&block)
        length = @stack.length
        yield length if not block.nil?
        return length
    end
    
    ##
    # Indicates queue is empty.
    #
    # @return [Boolean] +true+ it it is, +false+ otherwise
    # @yield [Boolean] +true+ it it is, +false+ otherwise
    #
    
    def empty?(&block)
        empty = @stack.empty?
        yield empty if not block.nil?
        return empty
    end
    
    ##
    # Clears the queue.
    #
    
    def clear(&block)
        result = @stack.clear
        yield result if not block.nil?
        return result
    end
    
    alias :clear! :clear
end

require "evented-queue/recurring"

