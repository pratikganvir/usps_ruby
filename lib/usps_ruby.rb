# This is the main class. To get the shipment details user has to call
# DHLMemnosyne.track method. DHLMemnosyne.track method receives 3 arguments. First argument is tracking number of a shipment.
# second argument is DHL id provided by DHL. Third argument is Password provided by DHL. DHL id and password can be specified in
# rails_root/config/dhl_config.yml. User can also can the track method by directly providing DHL id and password as second 
# and third argument to track method.
class UspsRuby
  #require '/usps_ruby/credentials/credentials.rb'
  def self.track(tracking_number, dhl_id, dhl_password=nil)
    require 'usps_ruby/web_interface/usps_call'
    UspsCall.response(tracking_number,dhl_id,dhl_password)
  end
end
