module PryGem
  # @since 1.0.0
  class GemReadme < Pry::ClassCommand
    match 'gem-readme'
    description 'Show the readme bundled with a rubygem'
    group 'Gems'
    command_options argument_required: true
    banner <<-BANNER
      gem-readme gem
      Show the readme bundled with a rubygem
    BANNER

    def process(name)
      spec = Gem::Specification.find_by_name(name)
      glob = File.join(spec.full_gem_path, 'README*')
      readme = Dir[glob][0]

      unless File.exist?(readme.to_s)
        raise Pry::CommandError, "Gem '#{name}' doesn't appear to have a README"
      end

      _pry_.pager.page File.read(readme)
    rescue Gem::LoadError
      raise Pry::CommandError,
            "Gem '#{name}' wasn't found. Are you sure it is installed?"
    end
  end
end

Pry::Commands.add_command(PryGem::GemReadme)
