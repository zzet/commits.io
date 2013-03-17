require 'test_helper'

class CommitsServiceTest < ActiveSupport::TestCase
  def test_find_committer
    source_committer = create(:committer)
    data = generate :metrics_message
    data["author"]["email"] = source_committer.email

    committer = CommitsService.find_or_create_committer data
    committer.reload

    assert_equal committer, source_committer
  end

  def test_create_committer
    data = generate :metrics_message
    data["author"]["email"] = generate :email

    committer = CommitsService.find_or_create_committer data
    committer.reload

    assert committer.present?
  end


  def test_create_commit
    committer = create(:committer)
    data = generate :metrics_message
    data["author"]["email"] = committer.email
    data["repository_id"] = create(:repository_owned_by_committer).id

    commit = CommitsService.create_commit(committer, data)

    assert commit.present?
  end

  def test_create_commit_metric
    commit = create :commit
    data = generate :metrics_message
    data["author"]["email"] = generate :email

    commit_metrics = Metrics.get_metrics_for data

    metric = CommitsService.create_commit_metric(commit, commit_metrics.first, data)

    assert metric.present?
  end
end
