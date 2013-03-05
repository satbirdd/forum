#encoding: utf-8

FactoryGirl.define do
	factory :user do |f|
		login 'tt_user_login'
		email 'tt_user_email@mail.com'
		password 'password'
		password_confirmation 'password'
		remember_me true
	end
end