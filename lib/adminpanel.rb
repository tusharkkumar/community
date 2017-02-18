$path=File.join(File.dirname(__FILE__),"")
require $path + "comunitydetails.rb"



def insert_newuser

	window(title:"ADMIN PANEL",height:800,width:1000,resizable:false) do 

		stack(height:800,width:1000) do 
			title("ADD A USER DIRECTLY")

			stack do 
				flow do
					@new_username=edit_line
				end
				flow do 
					@new_password=edit_line
				end

				button "Add user" do 
					if connect
						
						
					end
				end

			end
		end
	end	
end


