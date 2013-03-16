class HookWorker
  @queue = :hook

  def self.perform(data)
    p data
  end
end
