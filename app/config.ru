require 'rack'

class Fallback
  class << self
    def call(env)
      if env['PATH_INFO'] =~ /^\/health/
        code = '200'
      elsif env['PATH_INFO'] =~ /^\/\d{3}/
        code = env['PATH_INFO'][1..3]
      else
        code = (env['HTTP_X_CODE'] || '404')
      end

      body = "Backend Error"
      
      if codes.has_key? code
        body = template % { code: code, message: codes[code] }
      elsif codes.has_key? "#{code[0]}00"
        code = "#{code[0]}00"
        body = template % { code: code, message: codes[code] }
      end

      code = code.to_i
      code = 500 unless (200..599).include? code
      [code, {'content-type' => 'text/html'}, [body]]
    end

  private

    def template
      File.read 'template.html'
    end

    def codes
      @codes ||= {
        '200' => "OK",
        '400' => "Bad Request",
        '401' => "Unauthorized",
        '403' => "Forbidden",
        '404' => "Not Found",
        '406' => "Not Acceptable",
        '413' => "Payload Too Large",
        '500' => "Application Error",
        '502' => "Bad Gateway",
        '503' => "Service Unavailable",
        '504' => "Gateway Timeout",
      }
    end

  end
end

run Fallback
