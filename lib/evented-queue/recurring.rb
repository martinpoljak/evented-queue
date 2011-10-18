# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

require "evented-queue"

##
# Recurring evented queue implementation.
#

class EventedQueue::Recurring < EventedQueue
  
    ##
    # Pushes value out of the queue.
    #
    # @return [Object] value from the queue
    # @yield [Object] value from the queue
    #

    def pop(&block)
        return super do |result|
            if not block.nil?
                self.pop(&block)
                yield result
            end
        end
    end
    
end
