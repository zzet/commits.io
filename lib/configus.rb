Configus.build Rails.env do
  env :production do
    system_param do
      repositories do
        root_path File.expand_path(Dir.pwd + "/../../data/repositories")
      end
    end
  end

  env :development, parent: :production do
    system_param do
      repositories do
        root_path File.expand_path(Dir.pwd + "/../../data/repositories")
      end
    end
  end

  env :test, parent: :development do
  end
end
