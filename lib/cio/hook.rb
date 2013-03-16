class Cio::Hook
  class << self
    def process(post_data)
      post_repo = post_data["repository"]
      repository = Repository.find_by external_id: post_repo["id"], external_type: :github
      if repository
        repo_path = "#{configus.system.repositories.path}/#{post_repo["owner"]["name"]}/#{post_repo["name"]}.git"
        r = Grit::Repo.new(repo_path)
        commits = post_data["commits"]
        commits.each do |commit|
          data_to_metrics = {
            source: commit,
            author: commit["author"],
            committer: commiter["committer"],
            message: commit["message"],
            sha: commit["id"],
            #parent_sha: r,
            #ref: r,
            files: {
              added: commit["added"],
              modified: commit["modified"],
              removed: commit["removed"]
            },
            diffs: [ ],
            timestamp: commit["timestamp"],
          }
          diffs = Grit::Commit.diff(r, commit["id"])
          diffs.each_with_index do |i, diff|
            data_to_metrics["diffs"] << {i => diff.diff}
          end

          Resque.enqueue_to :commit_data, CommitWorker, data_to_metrics
        end
      end
    end
  end
end
