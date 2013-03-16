class HookWorker
  @queue = :hook

  def self.perform(data)
    Cio::Hook.process data
  end
end
