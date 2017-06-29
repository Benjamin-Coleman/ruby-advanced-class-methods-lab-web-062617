require 'pry'

class Song
	attr_accessor :name, :artist_name
	@@all = []

	def self.all
	@@all
	end

	def save
	self.class.all << self
	end

	def self.create
		new_song = self.new
		self.all << new_song
		new_song
	end

	def self.new_by_name(song_name)
		named_song = self.new
		named_song.name = song_name
		named_song
	end  

	def self.create_by_name(song_name)
		named_song = self.new
		named_song.name = song_name
		self.all << named_song
		named_song
	end

	def self.find_by_name(song_name)
		self.all.detect { |song| song.name == song_name}
	end

	def self.find_or_create_by_name(song_name)
		if self.find_by_name(song_name)
			return self.find_by_name(song_name)
		else
			self.create_by_name(song_name)
		end
	end

	def self.alphabetical
		self.all.sort_by!{ |song| song.name}	
	end

	def self.new_from_filename(file_name)
		song = self.new
		song.name = file_name.split(" - ")[1].chomp(".mp3")
		song.artist_name = file_name.split(" - ")[0]
		song
	end

	def self.create_from_filename(file_name)
		song = self.new
		song.name = file_name.split(" - ")[1].chomp(".mp3")
		song.artist_name = file_name.split(" - ")[0]
		@@all << song
	end

	def self.destroy_all
		@@all = []
	end
end
