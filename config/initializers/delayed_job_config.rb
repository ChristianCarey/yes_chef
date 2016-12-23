Rails.logger.level = Logger::INFO
# config/initializers/dj_rails5_patches.rb
# RAILS 5 patches for delayed_job
# TODO: REMOVE WHEN upstream is updated

module DelayedWorkerPatches
  def reload!
    return unless self.class.reload_app?
    if defined?(ActiveSupport::Reloader)
      Rails.application.reloader.reload!
    else
      ActionDispatch::Reloader.cleanup!
      ActionDispatch::Reloader.prepare!
    end
  end
end

module Delayed
  class Worker
    prepend DelayedWorkerPatches
  end
end

Delayed::Worker.destroy_failed_jobs = true
Delayed::Worker.sleep_delay = 1
Delayed::Worker.max_attempts = 3
Delayed::Worker.max_run_time = 5.minutes
Delayed::Worker.read_ahead = 10
Delayed::Worker.default_queue_name = 'default'
Delayed::Worker.delay_jobs = !Rails.env.test?
Delayed::Worker.raise_signal_exceptions = :term
Delayed::Worker.logger = Logger.new(File.join(Rails.root, 'log', 'delayed_job.log'))
