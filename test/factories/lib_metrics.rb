FactoryGirl.define do
  sequence :metrics_message do
    {
      :author => {
        name: 'Author',
        email: 'test@test.test'
      },
      :commiter => {
        name: 'Author',
        email: 'test@test.test'
      },
      message: "add dark solarized theme for code preview"
    }
  end
end
