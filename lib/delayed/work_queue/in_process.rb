module Delayed
module WorkQueue
# The simplest possible implementation of a WorkQueue -- just turns around and
# queries the queue inline.
class InProcess
  def get_and_lock_next_available(worker_name, queue_name, min_priority, max_priority)
    Delayed::Worker.lifecycle.run_callbacks(:work_queue_pop, self) do
      Delayed::Job.get_and_lock_next_available(worker_name, queue_name, min_priority, max_priority)
    end
  end
end
end
end
