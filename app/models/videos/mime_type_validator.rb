# Validate mime type attribute value against types supported by record
# class. Records are invalid, if there are no types supported.
#
class MimeTypeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless valid_types(record).any? { |maybe| lookup(maybe) == lookup(value) }
      record_errors(record, attribute, value)
    end
  end

  private

  # #valid_types : record -> array
  # record.supported_mime_types -> anything or undefined
  def valid_types(record)
    Array(record.supported_mime_types)
  rescue NoMethodError
    Array.new
  end

  # #lookup : Mime::Type or something -> nil or Mime::Type.
  def lookup(mime_type)
    if type = Mime::LOOKUP.assoc(mime_type)
      return type.last
    end
  end

  def record_errors(record, attribute, value)
    message = options[:message] || I18n.t(:mime_type_invalid,
                                          scope: [ :active_record, :errors, :messages ])
    record.errors[attribute] << message
  end
end
