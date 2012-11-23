# CanCanConfig

config/cancan_roles.rb

    CanCanConfig.roles_define do
      group Role::SuperAdmin do
        can :manage, :all
      end

      group Role::CommonUser do
        can [:update, :destroy], File do |file|
          helper :can_manager_question, file, current_user
        end
      end

      group :public do

      end

      helper do
        def can_manager_question(question, user)
          question.user_id == user.id
        end
      end
    end

models/ability.rb

    class Ability
      include CanCan::Ability
      include CanCanConfig::AbilityConfig

      # default load path
      # @@roles_paht = "config/cancan_roles.rb"

      def user_role
        if current_user.role
          current_user.role
        else
          Role::CommonUser
        end
      end
    end


## Installation

Add this line to your application's Gemfile:

    gem 'cancan_config'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cancan_config

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
