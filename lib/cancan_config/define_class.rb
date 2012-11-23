module CanCanConfig
  class RolesHelper
    @@last_roles = {}
    @@last_helpers = []

    # 得到最后定义的roles
    def self.last_roles
      @@last_roles
    end

    # 得到最后定义的helpers
    def self.last_helpers
      @@last_helpers
    end

    def initialize
      @roles = {}
      @helpers = []
      @@last_roles = @roles
      @@last_helpers = @helpers
    end

    #################################
    #
    # => 权限定义Helper
    #
    #################################
    def group(name, &block)
      @roles[name.to_s] = block
    end

    def helper(&block)
      @helpers << block
    end
  end
end
