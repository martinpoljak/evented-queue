# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

require "evented-queue"

##
# Recurring evented queue implementation.
#

class EventedQueue::Recurring < EventedQueue
  
    ##
    # Holds scheduling routine.
    # @return [Proc]
    #
    
    attr_accessor :scheduler
    @scheduler
    
    ##
    # Constructor.
    # @param [Proc] &scheduler  which indicates how to schedule recurring
    #
    
    def initialize(stack = UnifiedQueues::Single::new(Array), &scheduler)
        super(stack)
        @scheduler = scheduler
    end
     
    ##
    # Pushes value out of the queue.
    #
    # @return [Object] value from the queue
    # @yield [Object] value from the queue
    #

    def pop(&block)
        if self.empty?
            result = super(&block)
        else
            result = super(&block)
            
            if @scheduler.nil?
                self.pop(&block)
            else
                @scheduler.call(Proc::new { self.pop(&block) })
            end
        end
        
        return result
    end
    
end
