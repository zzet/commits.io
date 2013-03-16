Configus.build Rails.env do
  env :production do
    system do
      repositories do
        path Rails.root.join('data', 'repositories')
      end
    end
  end

  env :development, parent: :production do
    system do
      repositories do
        path Rails.root.join('data', 'repositories')
      end
    end
  end
end
