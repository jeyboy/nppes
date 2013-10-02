Nppes.setup do |config|

  #############Whitelists################

  # Accepts args as Hash and as Array
  #if column name or attribute contains one of listened pieces - it will be ignore in output list

  # Ignore token list for columns
  #config.columns_black_list = ["_at", "id"]
  #config.columns_black_list = {'*' => ["_at", "id"], "some_object" => ["complete"]}

  # Ignore token list for attributes
  #config.attributes_black_list = []

  #######################################

  # Method header for object methods which will be output in usable tokens list. By default eql "et_"
  #config.methods_header = "et_"
end
