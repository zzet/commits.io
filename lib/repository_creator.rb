class RepositoryCreator

  def self.create(repo)
    repo.save!
    Resque.enqueue_to :repositories_import, RepositoryWorker, repo.id
  end
end
