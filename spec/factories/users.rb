#encoding: utf-8

FactoryGirl.define do
	factory :user do |f|
		sequence(:login) { |n| "login#{n}" }
		sequence(:email) { |n|  "email#{n}@mail.com" }
		password 'password'
		password_confirmation 'password'
		remember_me true
	end
end