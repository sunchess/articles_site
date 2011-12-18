# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#

User.create(:email    => 'alexanderdmv@gmail.com',
            :username => "Alex",
            :password => '17021888',
            :password_confirmation => '17021888',
            :role_mask => 1).confirm!

User.create(:email      => 'annai@jsovet.ru',
            :username => "Анна Иванова",
            :password   => 'bilder25',
            :password_confirmation => 'bilder25',
            :role_mask => 2).confirm!

User.create(:email      => 'sveta@jsovet.ru',
            :username => "Светлана Евдокимова",
            :password   => 'bilder25',
            :password_confirmation => 'bilder25',
            :role_mask => 2).confirm!

User.create(:email      => 'lilya@jsovet.ru',
            :username => "Лиля И",
            :password   => 'bilder25',
            :password_confirmation => 'bilder25',
            :role_mask => 2).confirm!

User.create(:email      => 'ustinova@jsovet.ru',
            :username => "Ирина Устинова",
            :password   => 'bilder25',
            :password_confirmation => 'bilder25',
            :role_mask => 2).confirm!

User.create(:email      => 'nata@jsovet.ru',
            :username => "Наталия Юрьевна",
            :password   => 'bilder25',
            :password_confirmation => 'bilder25',
            :role_mask => 2).confirm!

User.create(:email      => 'roza@jsovet.ru',
            :username => "Роза А",
            :password   => 'bilder25',
            :password_confirmation => 'bilder25',
            :role_mask => 2).confirm!

User.create(:email      => 'dvalentina@jsovet.ru',
            :username => "Данилова Валентина",
            :password   => 'bilder25',
            :password_confirmation => 'bilder25',
            :role_mask => 2).confirm!

User.create(:email      => 'rsevast@jsovet.ru',
            :username => "Регина С.",
            :password   => 'bilder25',
            :password_confirmation => 'bilder25',
            :role_mask => 2).confirm!

User.create(:email      => 'vikastoria@jsovet.ru',
            :username => "Викторя Стори",
            :password   => 'bilder25',
            :password_confirmation => 'bilder25',
            :role_mask => 2).confirm!

User.create(:email      => 'elena@jsovet.ru',
            :username => "Елена Фидосеева",
            :password   => 'bilder25',
            :password_confirmation => 'bilder25',
            :role_mask => 2).confirm!
