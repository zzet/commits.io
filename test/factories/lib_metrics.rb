FactoryGirl.define do
  sequence :metrics_message do
    {
      "author" => {
        "name" => 'Author',
        "email" => 'test@test.test'
      },
      "author" => {
        "name" => 'Author',
        "email" => 'test@test.test'
      },
      "message" => "add dark solarized theme for code preview",
      "sha" => 'asdsdfgwe3qrdsfsr132dsfsdf234qsdfsdf',
      "timestamp" => Time.current
    }
  end
end
