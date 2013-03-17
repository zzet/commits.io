Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.to_sym == :production
    provider :github, "4381010f282e6b04c5d4", "679ad981db19e01581bd3bd632176eb8560c2a07"
  else
    provider :github, "cf2866e191ced6227026", "9c56321851a5d6aaea569b88286b04e08eb6dc75"
  end
end
