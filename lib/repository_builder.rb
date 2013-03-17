class RepositoryBuilder

  class << self

    def build(repo_data, external_type)
      repo = Repository.new
      repo.name = repo_data[:name]
      repo.description = repo_data[:description]
      repo.clone_url = repo_data[:clone_url]
      repo.external_id = repo_data[:id]
      repo.external_type = external_type
      repo
    end

    def build_list(repos_data, external_type)
      # FIXME [Anton Kalyaev] filter forks by now
      filtered_data = repos_data.select {|d| !d[:fork] }
      filtered_data.map {|data| build(data, external_type)}
    end
  end
end
