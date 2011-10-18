# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

require "abstract"

##
# Abstract evented queue.
# @abstract
#

class AbstractEventedQueue
  
    ##
    # Pushes value into the queue.
    # @param [Object]
    #
    
    def push(value, &block)
        not_implemented
    end
    
    ##
    # Pushes value out of the queue.
    # @yield [Object]
    #
    
    def pop(&block)
        not_implemented
    end
    
    ##
    # Indicates length of the queue.
    #
    # @return [Integer]
    # @yield [Integer]
    #
    
    def length(&block)
        not_implemented
    end
    
    ##
    # Indicates queue is empty.
    # @return [Boolean] +true+ it it is, +false+ otherwise
    #
    
    def empty?(&block)
        not_implemented
    end
    
    ##
    # Clears the queue.
    #
    
    def clear(&block)
        not_implemented
    end
    
    alias :clear! :clear
    
end
