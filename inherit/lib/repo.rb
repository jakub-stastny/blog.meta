require 'erb'
require 'yaml'

class ValidationError < StandardError; end

class Repo
  def self.build(data_string, **params)
    meta_raw_data, full_description = data_string.split("\n---\n")
    meta = YAML.load(meta_raw_data).transform_keys(&:to_sym)
    self.new(**params.merge(
      meta.merge(full_description: full_description.strip,
        description: meta[:description] || full_description.strip)
    ))
  end

  attr_reader :context
  def initialize(**context)
    @context = context
  end

  def validate
    unless context[:language]
      raise ValidationError,  "Headers must include language, for instance: language: Rust"
    end

    unless context[:description]
      raise ValidationError,  "Headers must include description"
    end

    unless context[:full_description]
      raise ValidationError,  "Headers must include full description"
    end
  end

  def result(template_string)
    template = ERB.new(template_string)
    template.result_with_hash(context).split("\n").map(&:rstrip).join("\n")
  end
end
