Rails.application.routes.draw do
	root	'users#home'
	get		'/signup',	to: 'users#new'
	get		'/login',	to: 'sessions#new'
	post	'/login',	to: 'sessions#create'
	delete	'/logout',	to: 'sessions#destroy'
	resources	:users
	resources	:posts, only: [:index, :create, :destroy]
end
