# This is the kind of json response that is required by jQuery-File-Upload
# The required bits are buried somewhere in the jquery-file-download scripts
json.array!([@photo]) do |json, photo|
  json.name            	avatar.avatar_file
  json.size            	avatar.avatar_file.size
  json.current_path  		avatar.avatar_file.current_path
  json.url           		avatar.avatar_file.url
  json.thumbnail_url   	avatar.avatar_file.url(:thumb)
end
