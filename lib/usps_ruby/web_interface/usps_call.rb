module UspsCall
  require 'uri'
  require 'net/http'
  require 'net/https'
  require 'openssl'

  # This method gets called by main class DHLMemnosyne.
  # It makes actual http request to get the shipment details.
  def self.response(tracking_number,usps_id,usps_password)
    uri            = URI.parse 'production.shippingapis.com'
    http           = Net::HTTP.new uri.host, uri.port
    http.use_ssl, http.verify_mode = use_ssl?(uri)
    request = usps_request(tracking_number,usps_id,usps_password)
    return Net::HTTP.get(uri.path, request)
  end

  def self.usps_request(tracking_number,usps_id,usps_password)
    require 'rubygems'
    require 'nokogiri'
    method = "/ShippingAPI.dll?API=TrackV2&XML="
    xml_request = Nokogiri::XML::Builder.new do |xml|
        xml.TrackFieldRequest('USERID' => usps_id, 'PASSWORD' => usps_password) {
          xml.TrackID('ID' => tracking_number){
          }
        }
    end
    method +  parse_xml_request(xml_request) 
  end

  def self.use_ssl?(uri)
    uri.port == 443 ?
    (return true, OpenSSL::SSL::VERIFY_NONE) : (return false, OpenSSL::SSL::VERIFY_NONE)
  end

  def self.parse_xml_request(xml)
    return xml.to_xml(:save_with => Nokogiri::XML::Node::SaveOptions::AS_XML | Nokogiri::XML::Node::SaveOptions::NO_DECLARATION).strip.gsub("\"","\'").gsub(" ","%20")
  end
end
