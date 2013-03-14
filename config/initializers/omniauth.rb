Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, "cf2866e191ced6227026", "9c56321851a5d6aaea569b88286b04e08eb6dc75"
end
