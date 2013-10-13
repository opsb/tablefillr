class Layout < Template
	validates_presence_of :name, :body
	belongs_to :theme, :inverse_of => :pages
end
