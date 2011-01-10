module ActiveResourceExtensions
  module GracefulErrors
    private 

    def find_every(options)
      begin
        super
      rescue => exception
        log_error(exception)
        []
      end
    end

    def log_error(exception)
      message = "\n#{exception.class} (#{exception.message}):\n"
      message << exception.annoted_source_code.to_s if exception.respond_to?(:annoted_source_code)
      message << "  " << Rails.backtrace_cleaner.clean(exception.backtrace, :silent).join("\n  ")
      Rails.logger.fatal("#{message}\n\n")
    end
  end
end
