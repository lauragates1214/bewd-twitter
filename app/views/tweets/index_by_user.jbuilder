json.tweets @tweets do |tweet|
  json.username   tweet.user.username
  json.message    tweet.message
end
