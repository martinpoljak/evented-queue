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
    #
    # @param value [Object]  object to push
    # @abstract
    #
    
    def push(value, &block)
        not_implemented
    end
    
    ##
    # Pushes value out of the queue.
    #
    # @yield [Object]  an object from the queue
    # @abstract
    #
    
    def pop(&block)
        not_implemented
    end
    
    ##
    # Indicates length of the queue.
    #
    # @return [Integer]  queue length
    # @yield [Integer]  queue length
    # @abstract
    #
    
    def length(&block)
        not_implemented
    end
    
    ##
    # Indicates queue is empty.
    #
    # @return [Boolean] +true+ it it is, +false+ otherwise
    # @yield [Boolean] +true+ it it is, +false+ otherwise
    # @abstract
    #
    
    def empty?(&block)
        not_implemented
    end
    
    ##
    # Clears the queue.
    #
    # @yield [nil]
    # @abstract
    #
    
    def clear(&block)
        not_implemented
    end
    
    alias :clear! :clear
    
end
