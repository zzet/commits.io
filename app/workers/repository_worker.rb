class RepositoryWorker
  @queue = :repositories_import

  def self.perform(id)
    repository = Repository.find(id)
    Cio::Sync.process :repository, :import, repository
  end
end
