
$path=File.join(File.dirname(__FILE__),"")
$path_forw=File.join(File.dirname(__FILE__),"lib","")
require $path + "userwindow2.rb"
require "loginpanel.rb"
require $path_forw + "person_details.rb"
require $path_forw + "quara.rb"
require $path_forw + "features.rb"
require $path_forw + "chattingpanel.rb"

#-----------------------------------PROFILE PAGE OF USER------------------------------------------------




def user_hub(username,id)

window(title:"HUB",height:800,width:1300,resizable:false) do 
	# if confim("Please First Fill the Details and Add language below")
	# alert(@make)

	#------for quara--------

	if connect
		
		@quara_ids=[]
		sql="select id from quara"
		@result=@@con.query(sql)

		@result.each do |i|	
			@quara_ids << i[:id]
		end
		

		if @quara_ids.include?(id)

		else
			sql= "insert into quara(id,user) values(#{id},'#{username}')"
			@result=@@con.query(sql)

				
		end

	end
	


	image("images/w1.jpg",height:800,width:1300)
	stack(left:0,height:50,width:1300,top:0)do 

		@id_user=id
		@user_name=username
		caption("WELCOME #{username.upcase}",left:550,underline:"double")

	end
			#---------------------------------------- -----------------------------------------------------------#
	@skip=stack(top:200,right:4,height:45,width:150) do 
		
		if connect
			sql="select * from communication"
			@res=@@con.query(sql)
			@res.each do |u|
				
				@n=u[:send_to]

				if @n==username
						
					background red
					
				end


			end

		end
		
		

	end


			@notify=button("Notifications",right:10,top:205) do 
			@skip.hide
			@send_user=[]
			if connect
				sql="select distinct send_from from communication where send_to='#{username}'"
				@messages=@@con.query(sql)
				@messages.each do |m|
					@message=m[:message]

					@send_user << m[:send_from]
					

				end

					notification_funtion(@send_user,username,id)

				
				
				
			end

	
	end
				#----------------------------------------chatting panel(future modification)-----------------------------------------------------------#

	# stack(height:50,width:150,top:100,right:5) do 
	# 	# background red


	# 	button("Chatting Panel",right:0) do 
	# 		chattingpanel


	# 	end


	# end
				#------------------------------------------REFRESH BUTTON------------------------------------------------

	@refresh_button=button("Refresh",top:0,right:330) do 
		user_hub(username,id)
		self.close
	end


	


				#----------------------------------------SEARCH MEMBER-----------------------------------------------------------#


stack(top:500,width:150,left:0) do 
		# background gray
		caption("MEMBER DETAILS",underline:"double",stroke:white)
		button("MEMBER LIST",width:150) do 
			member_list
		end 
		button("SEND MESSAGE",width:150) do
			
			send_message(username,id)
		end
	end
  



						#----------------------------------------SEARCH MEMBER-----------------------------------------------------------#
	stack(height:100,width:500,left:0,top:0) do
			# background red
		start_option
		
	end
						#----------------------------------------MESSAGE USER-----------------------------------------------------------#


						#----------------------------------------ADD MEMBER-----------------------------------------------------------#

	stack(right:0,top:150,height:50,width:150) do
		# background red
		# button ("check") do 
			if connect
				adminset=[]
				sql="select is_admin from community_details where id=#{id}"
				getadmin=@@con.query(sql)
				getadmin.each do |admin|
					adminset<<admin

				end
				if adminset.include?(:is_admin=>1)
					button("ADD MEMBER",right:13,top:0) do
						addmemberfunction


					end

				else
					

				end


			
			end


		# end


	end


					#------------------------------------------COMPLAINT BOX OPTION------------------------------------------------

	@complaint_boxbutton=button("complaint",top:0,right:78) do 
		@complaint_box.show
		@notify.hide
	
	end

	@complaint_box=stack(top:30,left:830,height:250,width:470,:hidden=>true) do
		background black(0.6)

		button("close",right:0,top:0,height:30,width:50) do 
			@complaint_box.hide
			@notify.show
	
		end
		caption("LIST COMPLAINT",stroke:white)

		@complaint_submitstack=edit_box(top:30,height:190,width:470) do 

		end
		button("send",top:220) do 
			if @complaint_submitstack.text==""
				alert "please write something"
			else
				if connect
					sql="update quara set complaints='#{@complaint_submitstack.text}' where id=#{id} "
					res=@@con.query(sql)
					alert "Complaint Send Successfully"
					@complaint_submitstack.text=""
				else
					alert "Please Contact Software Developer"	
				end	

				
			end

		end 
		button("clear",top:220,left:80) do 
			@complaint_submitstack.text=""			

		end 


	end
				#------------------------------------------PASSWORD CHANGE OPTION------------------------------------------------
	@logout_button=button("Change Password",top:0,right:180) do
						# alert @id_user
						@enterthenewpassword=ask("Enter The New Password:")
						@confirmthepassword=ask("Confirmed The Password")
						# if @enterthenewpassword!="" or @confirmthepassword!=""
							# alert @enterthenewpassword
							
							if !@enterthenewpassword.nil? or !@confirmthepassword.nil?
								if @enterthenewpassword==@confirmthepassword
									if  @enterthenewpassword.to_s.size > 6
										if connect
										 sql="update community_details set password='#{@enterthenewpassword}' where id=#{@id_user}"

										 sql="update community_details set password='#{@enterthenewpassword}' where id=#{@id_user}"

										 res=@@con.query(sql)
										 alert "password Changed!!! Changes will be applied after login."

										end

									else

										alert "password should be atleast 6 digits"
										
									end

								else

									alert "password does not match"
									
								end

							else 
								alert "password should not be empty or not filled correctly"
									
							end


						# else

						# 	alert "field should not be empty "
						# end

					end	

				
					#------------------------------------------LOGOUT OPTION------------------------------------------------


	stack(left:1220,top:0) do 
		button "Logout" do 
			if confirm("Do you want to Logout from your account?")
				# alert "Logout Succeed"
				if connect
					sql="update person_details set last_seen=NOW() where id=#{@id_user}"
					@@con.query(sql)
					alert "logout successful"


					# alert "last seen saved"
					@@con=""
				end

				start_login

				self.close
				@my_project_window.close
				@my_skill.close
				@notification.close

			end

		end
	end


		#-----------------------------------------PROFILE PICTURE STACK ------------------------------------------------

		 
		#------------------------------------------OUES AND ANSWERS OPTION------------------------------------------------

	stack(left:830,top:350,height:400,width:470) do 
		# background green
		caption("Question And Answers:",stroke:white)
	
		@quesans=edit_box(height:250,width:470)
		flow do 
			@btn_post=button "Post" do 
				if connect
					if @quesans.text==""
						alert "Please Ask some question"
					else
						if connect
							quesupdate(@id_user,@quesans.text,@user_name)
							alert "successful in asking a question"
							
						end

					end
				end

			end
			@btn_clear=button "clear" do 
				@quesans.text=""
			end
			@btn_relatedans=button "Related Answers" do
			end
		end
	end


	stack(width:150,left:0,top:350) do 
		# background pink
		caption("MY STATISTICS",underline:"double",stroke:white)
		button("MY PROJECTS",width:150) do 
			my_projects(@id_user)
		end

		button("MY SKILLS",width:150) do 
			my_skills(@id_user)
		end
	end


#------------------------------------------USER RELATED FUNCTIONS------------------------------------------------


	
#------------------------------------------FILL PERSONAL DETAILS OPTION------------------------------------------------

	@detail_show=stack(left:170,top:100,width:260,height:210) do
		stack do 
			button("FILL YOUR PERSONAL DETAILS",width:220) do 
			personal_details(@id_user)
			@detail_stack.show
			@detail_display.hide
			@hub_details.hide
			end
#------------------------------------------SHOW YOU DETAILS  OPTION------------------------------------------------
			button("YOUR DETAILS",width:150) do 
				show_details(@id_user)
				@detail_display.show
				@detail_stack.hide
				@hub_details.hide
			end
#------------------------------------------GROUP RELATED OPTION------------------------------------------------
			flow do 
					button("HUB DETAILS",width:100) do
						hub_details(@id_user)
						@hub_details.show
						@detail_stack.hide
						@detail_display.hide
					end

					para("*",stroke:red)
			end

			
		end
	end

#------------------------------------------SHARE IDEAS FUNCTIONING OPTION------------------------------------------------

	stack(height:300,width:600,left:190,top:400) do 
		caption("Share your ideas:",stroke:white)
		@share_ideas=edit_box(height:200,width:600,left:0,top:30)
		flow do 
			button("Share",left:0,top:193) do 

			if connect

					  @get=selectquara(@id_user)
					  @get.each do |user|
					  	@getid=user[:id]

					  end
					
					if @share_ideas.text==""
						alert "Write something to share with others"
					else
						if @getid==@id_user
						quaraupdateshare(@id_user,@share_ideas.text,@user_name)
						alert "successfully updated"	
						@share_ideas.text=""					
						else
						quarainsertshare(@id_user,@share_ideas.text,@user_name)
						alert "sharing successful"						
						@share_ideas.text=""
						end
					end
				end
			end

			button("clear",top:193,left:100) do 
				@share_ideas.text=""

			end

		end

	end
end

end


def start_option
	flow do 	
		@choose_option=list_box(:items=>["Person","Group","language"],choose: "Person",left:0,top:0)
		@searchmember=edit_line("choose",left:200,top:0)

		
	
		@findmember=button("Search",left:400,top:0) do
			
			if @choose_option.text=="Person"
				@choose= "username" 
			elsif @choose_option.text=="Group"
				@choose= "name_community"
			else
				@choose="language"
			end

			if connect
				@result=[]
				@allid=[]
				sql="select username,id,name_community from community_details where #{@choose} like('#{@searchmember.text}%') "
				user=@@con.query(sql)
				user.each do |u|

					if @choose=="username"
						
						@result<<u[:username]
					elsif @choose=="name_community"
						@result<<u[:name_community]
						
					else
						@result<<u[:language]
					end
					# @allid<<u[:id]
				end

				@showfindnames=stack(height:500,width:280,top:27,left:0,:scroll=>true) do 
					background black(0.6)
					@result.each do |names|

						
							flow do

								caption(names,:stroke=>white) 
								button("Details") do 
									if connect
										sql="select * from community_details where #{@choose}='#{names}' and is_admin=1 "
										res=@@con.query(sql)
										res.each do |i|
											@name_user=i[:username]
											 @id_map=i[:id]
											 @id_email=i[:email]
											 @com_name=i[:name_community]
											
										end
										

										 #---- the thing we are using to send this to the next stage--#
										 

										 # @communityname_name
										 # @id_email
										 # @id_map
										 # @name_user

						
										 #---- the thing we are using to send this to the next stage--#


										sql1="select * from person_details where id='#{@id_map}' "
										result=@@con.query(sql1)
										result.each do |t|
											@personname=t[:person_name]
											@quali=t[:qualification]
											@interest=t[:interests]
											@phoneno=t[:contact_no]
											@exp=t[:experiance]
											@req=t[:requirement]
											@addres=t[:address]

										end

										@details_all=stack(height:300,width:400,:scroll=>true,top:28) do 
										background black(0.6)
										para ""
										caption("Name: #{@name_user}",:stroke=>white)
										caption("Email: #{@id_email}",:stroke=>white)
										caption("Contactno: #{@phoneno}",:stroke=>white)	
										caption("Qualification: #{@quali}",:stroke=>white)
										caption("Experiance: #{@exp}",:stroke=>white)
										caption("Hub Name : #{@com_name}",:stroke=>white)

											button('x',height:20,width:20,top:0,right:0) do 
												@details_all.hide


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


		end
	end 
	
end




#------------------------------------------MY PROJECTS FUNCTIONING OPTION------------------------------------------------

	def my_projects(id)
		@my_project_window=window(title:"Project Area",height:500,width:800,resizable:false) do 
			# background white
			@btn_stack=stack(top:0,left:0,height:100,width:800)do 	
			# background pink
				caption("Click Add button to add a project >>",stroke:white,left:10,top:70)
				button("ADD PROJECT",left:350,top:70,stroke:white) do 
					
					@line_stack.show
					@button_stack.show
				end 
			end
			@line_stack=stack(top:100,left:0,height:100,width:800,:hidden=>true)do 
			# background yellow
				line(100, 150, 400, 0,stroke:white)
				line(850, 250, 400, 0,stroke:white)
			end
			@button_stack=stack(top:200,left:0,height:30,width:800,:hidden=>true) do 
				# background red
				flow do 
					button("WORKING PROJECT",left:100,stroke:white) do 
						@working_prodetail.show
						@live_prodetail.hide
					end	
						button("LIVE PROJECT",left:520,stroke:white) do 

						@live_prodetail.show
						@working_prodetail.hide
					end
				end
			end

			@working_prodetail=stack(top:230,left:0,height:300,width:400,:hidden=>true) do 
				# background lightblue
				stack(top:60) do 
					flow do
					caption("Project Name:",left:37,stroke:white)
					@workproject_name=edit_line(left:164)
					end

					flow do
					caption("Language:",left:70,stroke:white)
					@workproject_lang=edit_line(left:164)
					end

					flow do
					caption("Members Involved:",stroke:white)
					@workproject_members=edit_line
					end

					button("Submit",left:165,top:130,stroke:white) do 

						if connect
							array=[1,2,4,6,7,8,9,10]
							if @workproject_name.text=="" or @workproject_lang.text=="" or @workproject_members.text==""
								alert "All Fields Must Be Filled"
							

							else

								result=updateworking(id,@workproject_name.text,@workproject_lang.text,@workproject_members.text)
								result2=updateworking_saved(id,@workproject_name.text,@workproject_members.text,@workproject_lang.text);
								alert "data gets Saved..."
								@@con=nil
								@working_prodetail.hide
							end
						end

						
					end
				end
			end
			@live_prodetail=stack(top:230,height:300,width:400,left:400,:hidden=>true) do 
				# background green
				stack(top:60) do 
					flow do
					caption("Project Name:",left:37,stroke:white)
					@liveproject_name=edit_line(left:164)
					end

					flow do
					caption("Language:",left:70,stroke:white)
					@liveproject_lang=edit_line(left:164)
					end

					flow do
					caption("Members Involved:",stroke:white)
					@liveproject_members=edit_line
					end

					
					button("Submit",left:165,top:130) do 
						if connect
							if @liveproject_name.text=="" or @liveproject_lang.text=="" or @liveproject_members.text==""
								alert "All Fields Must Be Filled"
							else

								result=updatelive(id,@liveproject_name.text,@liveproject_lang.text,@liveproject_members.text)
								result2=updatelive_saved(id,@liveproject_name.text,@liveproject_members.text,@liveproject_lang.text)
							
							alert "data Saved.."
							@@con=nil
							@live_prodetail.hide
							end
						end
						
					end
				end
			end
		end
	end

#------------------------------------------MY SKILLS FUNCTIONING OPTION------------------------------------------------

	def my_skills(id)
		@my_skill=window(title:"My Skills",height:500,width:800,resizable:false) do
			stack() do

				flow do 
					caption("Click to Add Skills >>",stroke:white)
					button("ADD Your Skills") do 
						@skill.show
						@skill_fields.show
					end
				end

				@skill=flow(:hidden=>true) do 
					caption("Skills:",stroke:white)
				end

				@skill_fields=stack(:hidden=>true) do 
					flow do 
					para "1",stroke:white
					@l1=edit_line
					end
					flow do 
					para "2",stroke:white
					@l2=edit_line
					end
					flow do 
					para "3",stroke:white	
					@l3=edit_line
					end
					flow do 
					para "4",stroke:white
					@l4=edit_line
					end
					flow do 
					para "5",stroke:white
					@l5=edit_line
					end
					@btn5_submit=button("Submit",left:0,top:165,stroke:white) do
						if connect 
							if @l1.text=="" or @l2.text=="" or @l3.text=="" or @l4.text=="" or @l5.text=="" 
								alert "please fill atleast 5 technical skills "
							else
								sql="update person_details set skills='#{@l1.text},#{@l2.text},#{@l3.text},#{@l4.text},#{@l5.text}' where id=#{id} "
								res=@@con.query(sql)
								alert "skills added"
								@@con=nil
									
							end
							
						end
					end
				end
			end 
		end
	end

#------------------------------------------MEMBER LIST FUNCTIONING  OPTION------------------------------------------------


