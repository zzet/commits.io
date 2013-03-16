require 'test_helper'

class Cio::HookTest < ActiveSupport::TestCase
  test "processing data from queue must raise exeption if no repository" do
    f = fixture_file_upload('hook_post.json', 'application/json')
    assert_raises(RuntimeError) { Cio::Hook.process f.read }
  end

  test "processing data from queue must return hash" do
    f = fixture_file_upload('hook_post.json', 'application/json')

    #result = Cio::Hook.process f.read

    #p result
  end
end
