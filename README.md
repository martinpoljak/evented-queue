Ruby Evented Queue
==================

**evented-queue** simply wraps non-evented queue to an evented 
interface. It directly uses the [Unified Queues][1] gem which means, 
wide spectrum of queues can be converted to the evented queues. 
Advantage of the evented queue is, they can be *recurring*, so 
can serve as de-facto permanent provider of the events.

An example:

    require "evented-queue"
    require "depq"      # will serve as example here
    
    queue = EventedQueue::new(Depq)
    queue.push(:foo)
    
    queue.pop do |item|
        item    # will contain :foo
    end
    
    queue.push(:bar)
    
    queue.pop do |item|
        item    # will contain :bar
    end 

    
And recurring queue example:

    require "evented-queue/recurring"
    
    queue = EventedQueue::new(Array)
    queue.push(:foo)
    
    queue.pop do |item|     # :foo will be written out now
        p item
    end
    
    queue.push(:bar)        # :bar will be written out now
    queue.push(:delta)      # :delta will be written out now


Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b 20101220-my-change`).
3. Commit your changes (`git commit -am "Added something"`).
4. Push to the branch (`git push origin 20101220-my-change`).
5. Create an [Issue][9] with a link to your branch.
6. Enjoy a refreshing Diet Coke and wait.


Copyright
---------

Copyright &copy; 2011 - 2012 [Martin Kozák][10]. See `LICENSE.txt` for
further details.

[1]: http://github.com/martinkozak/unified-queues
[9]: http://github.com/martinkozak/evented-queue/issues
[10]: http://www.martinkozak.net/
