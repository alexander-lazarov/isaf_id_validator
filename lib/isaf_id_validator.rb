class IsafIdValidator < ActiveModel::EachValidator
  @@default_options = {}

  def self.valid?(value, options = {})
    value = value.to_s.upcase
    regexp = /^([A-Z]{3})([A-Z]{2})([1-9][0-9]*)$/

    !!regexp.match(value)
  end

  def self.default_options
    @@default_options
  end

  def validate_each(record, attribute, value)
    options = @@default_options.merge(self.options)

    unless self.class.valid?(value, self.options)
      record.errors.add(attribute, options[:message] || :invalid)
    end
  end
end