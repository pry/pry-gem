module PryGem
  # @since 1.0.0
  class GemList < Pry::ClassCommand
    match 'gem-list'
    group 'Gems'
    description 'List and search installed gems.'

    banner <<-'BANNER'
      Usage: gem-list [REGEX]

      List all installed gems, when a regex is provided, limit the output to
      those that match the regex.
    BANNER

    def process(pattern = nil)
      gems(pattern).each do |gem, specs|
        sort_specs!(specs)

        versions = specs.each_with_index.map do |spec, index|
          index == 0 ? bright_green(spec.version.to_s) : green(spec.version.to_s)
        end

        output.puts "#{default gem} (#{versions.join ', '})"
      end
    end

    private

    def gems(pattern)
      Rubygem.list(Regexp.compile(pattern || '')).group_by(&:name)
    end

    def sort_specs!(specs)
      specs.sort! do |a, b|
        Gem::Version.new(b.version) <=> Gem::Version.new(a.version)
      end
    end
  end
end

Pry::Commands.add_command(PryGem::GemList)
