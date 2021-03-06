module Spec
  module Path
    def root
      @root ||= Pathname.new(File.expand_path("../../..", __FILE__))
    end

    def tmp(*path)
      root.join("tmp", *path)
    end

    def home(*path)
      tmp.join("home", *path)
    end

    def default_bundle_path(*path)
      home(".bundle/#{Gem.ruby_engine}/#{Gem::ConfigMap[:ruby_version]}", *path)
    end

    def bundled_app(*path)
      root = tmp.join("bundled_app")
      FileUtils.mkdir_p(root)
      root.join(*path)
    end

    alias bundled_app1 bundled_app

    def bundled_app2(*path)
      root = tmp.join("bundled_app2")
      FileUtils.mkdir_p(root)
      root.join(*path)
    end

    def base_system_gems
      tmp.join("gems/base")
    end

    def gem_repo1(*args)
      tmp("gems/remote1", *args)
    end

    def gem_repo2(*args)
      tmp("gems/remote2", *args)
    end

    def system_gem_path
      tmp("gems/system")
    end

    def lib_path(*args)
      tmp("libs", *args)
    end

    extend self
  end
end