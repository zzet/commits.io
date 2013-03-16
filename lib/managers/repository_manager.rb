class RepositoryManager
  class << self
    def create(params)
      Cio::Sync.process :repository, :import, repository
    end

    def update(repository, params)

    end

    def destroy(repository)

    end
  end
end
