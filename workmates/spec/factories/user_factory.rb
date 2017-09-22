FactoryGirl.define do
  factory :user do |f|
    f.name 'John'
    f.email 'doe@foo.com'
    f.password 'foobar'
    f.password_confirmation 'foobar'
  end
end
