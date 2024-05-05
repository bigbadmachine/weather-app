class ApplicationService
  
  def self.call(*args, &block)
    new(*args, &block).call
  end

  protected

  def return_success(object)
    OpenStruct.new(success?: true, object: object, errors: nil)
  end

  def return_errors(errors)
    OpenStruct.new(success?: false, user: nil, errors: errors)
  end

end