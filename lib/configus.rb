Configus.build Rails.env do
  env :production do

  end

  env :development, parent: :production do
    system.repositories.path Rails.root.join('data', 'repositories')
  end
end
