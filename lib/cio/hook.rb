class Cio::Hook
  class << self
    def process(post_data)
      post_repo = post_data["repository"]
      repository = Repository.find_by_external_id_and_external_type(post_repo["id"], :github)
      if repository
        repo_path = "#{ File.expand_path(Dir.pwd + "/data/repositories") }/#{post_repo["owner"]["name"]}/#{post_repo["name"]}.git"
        r = Grit::Repo.new(repo_path)
        commits = post_data["commits"]
        commits.each do |commit|
          data_to_metrics = {
            "source" => commit,
            "author" => commit["author"],
            "committer" => committer["committer"],
            "message" => commit["message"],
            "sha" => commit["id"],
            #parent_sha: r,
            #ref: r,
            "files" => {
              "added" => commit["added"],
              "modified" => commit["modified"],
              "removed" => commit["removed"]
            },
            "diffs" => [ ],
            "timestamp" => commit["timestamp"],
            "repository_id" => repository.id
          }
          diffs = Grit::Commit.diff(r, commit["id"])
          diffs.each_with_index do |i, diff|
            data_to_metrics["diffs"] << {i => diff.diff}
          end

          Resque.enqueue_to :commit_data, CommitWorker, data_to_metrics
        end
      else
        raise RuntimeError, "Repository not exist!"
      end
    end
  end
end
