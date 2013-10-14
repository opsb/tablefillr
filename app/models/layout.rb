class Layout < Template
	validates_presence_of :name, :content
	belongs_to :theme, :inverse_of => :pages

	def self.main
		find_by_name("main")
	end
end
