
module CanCanConfig
  module AbilityConfig
    @@roles_paht = "config/cancan_roles.rb"
    @@roles_defined = nil

    def initialize(user)
      load_roles(@@roles_paht, Rails.env == "development")

      @current_user = user || User.new # guest user (not logged in)

      load_user_roles(@current_user)
    end

    def current_user
      @current_user
    end

    def helper(method_name, *args)
      @@helpers.send(method_name, *args)
    end

    # return group name
    # def user_role
    #   if current_user.role  && current_user.role.level
    #     user.role.level
    #   else
    #     Role::CommonUser
    #   end
    # end

    ################################################
    #
    # => Private
    #
    ################################################
    private
    
    def load_roles(path, reload = false)
      return false unless reload || @@roles_defined.nil?
      
      load path
      @@roles_defined = CanCanConfig::RolesHelper.last_roles

      load_helpers

      return true
    end

    def load_user_roles(user)
      block = @@roles_defined[user_role.to_s]
      self.instance_eval &block if block
    end

    def load_helpers
      @@helpers = Object.new
      CanCanConfig::RolesHelper.last_helpers.each do |block|
        @@helpers.instance_eval &block
      end
    end
  end
end

