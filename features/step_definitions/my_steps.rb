Given /the following articles exist/ do |articles|
  articles.hashes.each do |article|
    Article.create!(article)
  end
end

Given /^(?:|I )am editing the article titled "(.*)"$/ do |title|
  article = Article.find_by_title!(title)
  visit article.edit_url
end

Given /^the publisher user exists$/ do
  User.create!({:login => 'publisher',
                :password => 'aaaaaaaa',
                :email => 'joe@smoe.com',
                :profile_id => 2,
                :name => 'publisher',
                :state => 'active'})
end

And /^I am logged into the publisher panel$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'publisher'
  fill_in 'user_password', :with => 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

