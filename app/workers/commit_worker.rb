class CommitWorker
  @queue = :commit_data

  def self.perform(data)
    CommitsService.add(data)
  end
end
