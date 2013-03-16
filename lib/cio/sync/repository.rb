class Cio::Sync::Repository
  class << self
    def import(repository)
      cmd = "cd #{configus.system.repositories.path} && git clone --bare #{repository.source} #{repository.owner}/#{repository.name}"
      system(cmd)
    end

    def update(reposutory, push_data)
      # UPDATE repository via hook push data
    end
  end
end
