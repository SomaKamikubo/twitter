# coding: utf-8

5.times do |no|

        User.create(:name => "user#{no+1}",:email => "#{no+1}@com", 
            :password =>"hogehoge", :password_confirmation =>"hogehoge")
end

100.times do |no|
    tweet_at_user = rand(5)+1
    Tweet.create(:tweet => "これは#{no+1}番目のツイートです",:user_id => tweet_at_user)
end

