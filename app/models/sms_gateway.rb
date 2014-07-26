require 'openssl'
require 'unirest'
class SMSGateway
  def initialize(host)
    @smsapi_host = host
  end
  def verifySignature(from, message, application, shortcode, app_secret, signature)
    response = false
    payload_str = "{from: '" + from + ", message: '" + message + "', application: '" + application + "', shortcode: '"+ shortcode +"'}";
    check_sig = signString(payload_str, app_secret)
    if(check_sig.eql? signature)
      response = true
    end
    return response
  end
  def signString(payload_str, key)
    return OpenSSL::HMAC.hexdigest(OpenSSL::Digest::Digest.new('sha256'), key, payload_str)
  end
  def sendSMS(to, message, app_key, app_secret)
    payload_str = "{\"to\":\"" + to + "\",\"message\":\"" + message + "\"}";
    signature = signString(payload_str, app_secret)
    puts payload_str
    puts signature
    response = Unirest.get @smsapi_host,
      parameters: {:to => to, :message => message, :app_key => app_key, :signature => signature} {|response|
        puts response.code
      }
  end
end