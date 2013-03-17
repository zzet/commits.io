class Cio::Sync::Repository
  class << self
    def import(repository)
      cmd = "cd #{ File.expand_path(Dir.pwd + "/data/repositories") } && git clone --bare #{repository.clone_url} #{repository.user.login}/#{repository.name}.git"
      if system(cmd)
        inspect(repository)
      else
        raise RuntimeError
      end
    end

    def update(reposutory, push_data)
      # UPDATE repository via hook push data
    end

    def inspect(repository)
      repo_path = File.expand_path(Dir.pwd + "/data/repositories") + "/#{repository.user.login}/#{repository.name}.git"
      repo = Grit::Repo.new(repo_path)
      repo.heads.each do |head|
        # TODO. Make batch
        repo.commits(head.name, 10000).each do |commit|
          data_to_metrics = {
            "source" => { },
            "author" => {
            "name" => commit.author.name,
            "email" => commit.author.email,
            "username" => ""
          },
            "committer" => {
            "name" => commit.author.name,
            "email" => commit.author.email,
            "username" => ""
          },
            "message" => commit.message,
            "sha" => commit.id,
            # CHECK. Many parents?
            "ref" => head.name,

            #"files" => {
            #"added" => commit["added"],
            #"modified" => commit["modified"],
            #"removed" => commit["removed"]
            #},
            "diffs" => [ ],
            "timestamp" => commit.authored_date,
            "repository_id" => repository.id
          }

          data_to_metrics["parent_sha"] = commit.parents.first.id if commit.parents.any?

          diffs = commit.diffs
          diffs.each_with_index do |diff, i|
            data_to_metrics["diffs"] << {i => diff.diff}
          end

          Resque.enqueue_to :commit_data, CommitWorker, data_to_metrics
        end
      end

    end
  end
end
