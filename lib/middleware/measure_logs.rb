module Middleware
  class MeasureLogs
    def initialize(app)
      @app = app
    end

    def call(env)
      start_time = Time.now
      request = @app.call(env)
      end_time = Time.now
      status, headers, response = request

      total_time = calculate_total_time(start_time, end_time)
      log_status(total_time, status)
      add_request_time_header(total_time, headers)

      [status, headers, response]
    end

    private

    def log_status(total_time, status)
      # Store the status result somewhere.
      Rails.logger.info("----- [HTTP Request] status=#{status} time=#{total_time.to_s} -----")
    end

    def add_request_time_header(total_time, headers)
      headers["X-request-time"] = total_time
    end

    def calculate_total_time(start_time, end_time)
      end_time - start_time
    end
  end
end
