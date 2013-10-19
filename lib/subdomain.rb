class Subdomain
  def self.matches?(request)
  	request.subdomain.present? && request.subdomain != 'www' && request.subdomain != ENV['PRIMARY_SUBDOMAIN']
  end
end