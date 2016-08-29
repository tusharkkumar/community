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




def send_message(username,id)
	# alert "working fine"
	window() do
		background black(0.6)
		stack(height:100,width:300,left:0,top:0) do
			# background red

			flow do 	
				@searchmember=edit_line("enter name to send Message")
				@findmember=button("Search") do

					if connect
						@searchnames=[]
						@allid=[]
						sql="select username,id from community_details where username like('#{@searchmember.text}%') "
						user=@@con.query(sql)
						user.each do |u|

							@searchnames<<u[:username]
							# @allid<<u[:id]
						end

						@showfindnames=stack(height:500,width:280,top:27,left:0) do 
							background black(0.6)
							@searchnames.each do |names|
								
									flow do

										caption(names,:stroke=>white) 
										button("Send Message") do
											@all_stack=stack(top:10,right:10,height:300,width:300) do 
											
												caption("Send Message",:stroke=>"white",top:0,left:0)
												
												@message_send=edit_box(height:200,width:300,top:30,right:0)
												stack(width:300,height:50,bottom:0)do
													flow do 
														button("send") do 
															if connect
																# alert "working"
																

															
															 sql="insert into communication(id,user,message,message_to) values(#{id},'#{username}','#{@message_send.text}','#{names}') "
																res=@@con.query(sql)
																alert "message successfully send"
																
															end
															@all_stack.hide

														end

														button("clear") do
															@message_send.text="" 

														end
														button("close") do 
															@all_stack.hide

														end

													end

												end




											end

										end


												


									end

									

							end
							@login_ideas=button("x",right:0,top:0,height:20,width:20) do 
								@showfindnames.hide
								@login_ideas.hide

							end
								
						end

					end
 	
				@searchmember.text=""
				end


			end 
		end	
	end
	
end