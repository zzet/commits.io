class Cio::Sync::Github::Repository
  class << self
    def load_list(user)
      # GH API CALL
    end

    def import(user, list)
      # CREATE NEW REPOS, FROM `LIST`
      params = { } # Here must be some params from GH API
      RepositoryManager.create(params)
    end
  end
end
