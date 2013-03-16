class HookWorker
  @queue = :hook

  def self.perform(data)
    Cio::Hook.process data
    repo = Repository.find_by external_id: data["repository"]["id"], external_type: :github
    Cio::Sync.process :repository, :update, repo
  end
end
