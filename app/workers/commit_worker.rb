class CommitWorker
  @queue = :commit

  def self.perform(data)
    CommitsService.add(data)
  end
end
