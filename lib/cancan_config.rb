require "cancan_config/version"
require "cancan_config/define_class"
require "cancan_config/ability_config"

module CanCanConfig
  def self.roles_define(&block)
    roles_helper = CanCanConfig::RolesHelper.new

    roles_helper.instance_eval { self.instance_eval &block }
  end
end

