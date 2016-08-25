$path_back=File.join(File.dirname(__FILE__),"../")
require $path_back + "loginpanel.rb"
require $path_back + "userwindow2.rb"
require $path_back + "userwindow1.rb"
def addmemberfunction
	# alert "hello"
	window(title:"Add Member",resizable:false) do
		background black(0.6)
		stack do 
			flow do 
				@membername=edit_line("add using the username")
				@search_button=button("Search") do

					if @membername.text==""
						alert "Enter the Username You want to Search"
					else
						if connect
						alluser=[]
						sql="select username from community_details"
						allusername=@@con.query(sql)
						allusername.each do |name|
							alluser<<name
						end
						# alert alluser

						if alluser.include?(:username=>"#{@membername.text}")
							stack() do
								# background red
								stack do 
									flow do 
									caption(@membername.text,left:0)
									button("Add",right:0) do 

									end 
								end


								end
								@membername.text=""


							end
						else
							alert "user not found"
							
						end
						@@con=nil
								 	
					end			 
						
					end


				end


			end

		end
	end
	
end
