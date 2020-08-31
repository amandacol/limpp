class AuthenticationError < StandardError
  class MissingRequiredHeader < AuthenticationError

    def message
      "Missing required Authentication HTTP Header."
    end
  end


  class Unauthorized < AuthenticationError
    def message
      "Invalid Token key"
    end
  end

end
