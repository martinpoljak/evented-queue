# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

require "evented-queue"

class EventedQueue::Recurring < EventedQueue
    def pop(&block)
        return super do |result|
            if not block.nil?
                self.pop(&block)
                yield result
            end
        end
    end
end
