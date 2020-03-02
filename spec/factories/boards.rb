FactoryBot.define do
    factory :board do
        title {'テストを書く'}
        context{'RSpec&Capybara&FactoryBotを準備する'}
        user
    end
end