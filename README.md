# LeAdmin

# Ruby version
ruby 2.7.3p183
# System dependencies
rails >= 6.1.4

postgreSQL >= 13

nodejs >= 14.16.1

yarn >= 1.22.10
# Configuration

    git clone https://github.com/efrenpar/LeAdmin.git
    cd LeAdmin
    yarn install
    bundle install
      
# Set database information database.yml
          development:
          adapter: postgresql
          encoding: unicode
          database: leadmin
          pool: 5
          username: your_user
          password: your_password
          timeout: 5000
# Create database
        rails db:create
# migrate database
        rails db:migrate
# You have to populate database with:
[data_lea_admin.sql](https://github.com/efrenpar/LeAdmin/blob/main/data_lea_admin.sql)
            


