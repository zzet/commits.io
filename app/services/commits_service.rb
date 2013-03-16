class CommitsService
  class << self
    def add(data)
      committer = find_or_create_committer(data)
      commit = create_commit(committer, data)

      commit_metrics = Metrics.get_metrics_for data

      commit_metrics.each do |commit_metric|
        create_commit_metric(commit_metric, data)
      end
    end

    def find_or_create_committer(data)
      committer = Committer.find_or_initialize_by_email data["author"]["email"]

      if committer.new_record?
        committer.name = data["author"]["email"]
        committer.save
      end

      committer
    end

    def create_commit(committer, data)
      Commit.create(
        committer_id: committer.id,
        sha: data["sha"],
        parent_sha: data["parent_sha"],
        repository_id: data["repository_id"]
      )
    end

    def create_commit_metric(commit, commit_metric, data)
      metric = Metric.find_by_kind commit_metric[:metric] 
      user = User.find_by_email(data["author"]["email"])

      CommitMetric.new(
        metric_id: metric.id,
        commit_id: commit.id,
        data: commit_metric[:data],
        user_id: user.try(:id)
      )
    end
  end
end
