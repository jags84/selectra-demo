# Return open or close
unless @location.nil?
  json.location_status @location.current_status
  json.location_name @location.name
end
