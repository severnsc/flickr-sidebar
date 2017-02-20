module FlickrHelper

	def user_photos(user_id, photo_count = 12)
		FlickRaw.api_key = ENV['FLICKR_API_KEY']
		FlickRaw.shared_secret = ENV['FLICKR_SECRET']
		flickr.people.getPublicPhotos(:user_id => ENV['FLICKR_ID'])
	end

	def render_feed(user_id, photo_count = 12, columns = 2)
		#begin
			photos = user_photos(user_id, photo_count).to_a.in_groups_of(2)
			render partial: 'flickr/feed', locals: {photos: photos}
		#rescue Exception
		#	render 'flickr/unavailable'
		#end
	end

	def build_url(farm, server, id, secret)
		return "https://farm#{farm}.staticflickr.com/#{server}/#{id}_#{secret}_s.jpg"
	end

end