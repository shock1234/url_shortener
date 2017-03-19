class Url < ApplicationRecord

	def shorten
		self.short_link = SecureRandom.hex(4)
	end
end
