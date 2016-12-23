class FixCountersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
  end

  after_perform do
    FixCountersJob.set(wait: 120.minutes).perform_later if Delayed::Job.all.none? {|job| !!(job.handler =~ /FixCountersJob/) }
  end
end
