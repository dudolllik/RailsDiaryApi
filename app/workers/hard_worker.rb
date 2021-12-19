require 'sidekiq-scheduler'

class HardWorker
  include Sidekiq::Worker

  def perform(*args)
    Diary.where("expiration <= ?", DateTime.now).destroy_all
  end
end
