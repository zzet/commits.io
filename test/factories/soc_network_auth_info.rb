FactoryGirl.define do
  sequence :github_auth_hash do
    {
      :provider => 'github',
      :uid => '1234567',
      :credentials => {
        token: '123w23534534534512312esdfw523'
      },
      :extra => {
        :raw_info => {
          login: "8xx8ru"
        }
      },
      :info => {
        email: "test@test.test",
        nickname: "8xx8ru",
        name: "8xx8 [18+]",
        location:"Simbirsk",
        image:"http://a0.twimg.com/profile_images/2563494421/u0hxerpikv3rzf76vhsk_normal.jpeg",
        description:"ChaosLab \\u2192 ITECH.group \\u2192 Simtech \\u2192 Undev",
      }
    }
  end
end
