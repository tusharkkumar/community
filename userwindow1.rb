
$path=File.join(File.dirname(__FILE__),"")
$path_forw=File.join(File.dirname(__FILE__),"lib","")
require $path + "userwindow2.rb"
require "loginpanel.rb"
require $path_forw + "person_details.rb"
require $path_forw + "quara.rb"



def user_hub(username,id)



Shoes.app(height:800,width:1300,resizable:false) do 
	image("images/w1.jpg",height:800,width:1300)
	


	stack(left:0,height:50,width:1300,top:0)do 
	# background yellow
		@id_user=id
		@user_name=username
		caption("Welcome #{username}",left:550,underline:"double")
	end


	stack(left:1220,top:0) do 
		button "Logout" do 
			if confirm("Do you want to Logout from your account?")
				# alert "Logout Succeed"
				if connect
					sql="update person_details set last_seen=NOW() where id=#{@id_user}"
					@@con.query(sql)
					alert "logout successful"
					# alert "last seen saved"
				end
				start_login
				self.close

			end

		end
	end



	stack(top:200,left:0) do 
		# background yellow
		button("UPDATE PICTURE",width:150)do 
			@profile_picture=ask_open_file
		end
	end


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

	stack(top:50,height:180,width:150,left:0) do 
		background black 
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





	stack(top:500,width:150,left:0) do 
		# background gray
		caption("MEMBER DETAILS",underline:"double",stroke:white)
		button("MEMBER LIST",width:150) do 
			member_list
		end 
		button("MEMBER SEARCH",width:150) do
			member_search
		end
	end

	@detail_show=stack(left:170,top:50,width:260,height:210) do
		stack do 
			button("FILL YOU PERSONAL DETAILS") do 
			personal_details(@id_user)
			@detail_stack.show
			@detail_display.hide
			@hub_details.hide
			end
			button "YOUR DETAILS" do 
				show_details(@id_user)
				@detail_display.show
				@detail_stack.hide
				@hub_details.hide
			end
			button "HUB DETAILS" do
				hub_details(@id_user)
				@hub_details.show
				@detail_stack.hide
				@detail_display.hide
			end
			
		end
	end

	stack(height:300,width:600,left:190,top:400) do 
		caption("Share your ideas:",stroke:white)
		@share_ideas=edit_box(height:200,width:600,left:0,top:30)
		button("Share",left:0,top:230) do 

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
	end
end
end
	def my_projects(id)
		window(height:500,width:800,resizable:false) do 
			# background white
			@btn_stack=stack(top:0,left:0,height:100,width:800)do 	
			background pink
				caption("Click Add button to add a project >>",left:10,top:70)
				button("ADD PROJECT",left:350,top:70) do 
					
					@line_stack.show
					@button_stack.show
				end 
			end
			@line_stack=stack(top:100,left:0,height:100,width:800,:hidden=>true)do 
			# background yellow
				line(100, 150, 400, 0)
				line(850, 250, 400, 0)
			end
			@button_stack=stack(top:200,left:0,height:30,width:800,:hidden=>true) do 
				# background red
				flow do 
					button("WORKING PROJECT",left:100) do 
						@working_prodetail.show
						@live_prodetail.hide
					end	
						button("LIVE PROJECT",left:520) do 

						@live_prodetail.show
						@working_prodetail.hide
					end
				end
			end

			@working_prodetail=stack(top:230,left:0,height:300,width:400,:hidden=>true) do 
				# background lightblue
				stack(top:60) do 
					flow do
					caption("Project Name:",left:37)
					@workproject_name=edit_line(left:164)
					end

					flow do
					caption("Language:",left:70)
					@workproject_lang=edit_line(left:164)
					end

					flow do
					caption("Members Involved:")
					@workproject_members=edit_line
					end

					button("Submit",left:165,top:130) do 

						if connect


							# result=selectall
							# result.each do |user|
							# 	@userId=user[:id]
							# end

							result=updateworking(id,@workproject_name.text,@workproject_lang.text,@workproject_members.text)
							alert "data gets Saved..."
							@@con=nil
						end



						@working_prodetail.hide
					end
				end
			end
			@live_prodetail=stack(top:230,height:300,width:400,left:400,:hidden=>true) do 
				# background green
				stack(top:60) do 
					flow do
					caption("Project Name:",left:37)
					@liveproject_name=edit_line(left:164)
					end

					flow do
					caption("Language:",left:70)
					@liveproject_lang=edit_line(left:164)
					end

					flow do
					caption("Members Involved:")
					@liveproject_members=edit_line
					end

					
					button("Submit",left:165,top:130) do 
						if connect

							result=updatelive(id,@liveproject_name.text,@liveproject_lang.text,@liveproject_members.text)
							alert "data Saved.."
							@@con=nil
						end
						@live_prodetail.hide
					end
				end
			end
		end
	end



	def my_skills(id)
		window(height:500,width:800,resizable:false) do
			stack() do

				flow do 
					caption("Click to Add Skills >>")
					button("ADD Your Skills") do 
						@skill.show
						@skill_fields.show
					end
				end

				@skill=flow(:hidden=>true) do 
					caption("Skills:")
				end

				@skill_fields=stack(:hidden=>true) do 
					flow do 
					para "1"
					@l1=edit_line
					end
					flow do 
					para "2"
					@l2=edit_line
					end
					flow do 
					para "3"	
					@l3=edit_line
					end
					flow do 
					para "4"
					@l4=edit_line
					end
					flow do 
					para "5"
					@l5=edit_line
					end
					@btn5_submit=button("Submit",left:0,top:165) do
					




						if connect 
							# @t.show
							# @s=edit_box("#{@l1.text},#{@l2.text},#{@l3.text},#{@l4.text},#{l5.text}")
							
							# alert id
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


	def member_list
		window(height:500,width:800,resizable:false) do 
			caption("Click to Display Your Members >>")
			button "Your Members" do 
				@memberlist_stack.show
			end

			@memberlist_stack=stack(:hidden=>true,left:10,top:70)do 
				flow do 
				para "1"
				@member1=edit_line
				end
				flow do 

				para "2"
				@member2=edit_line
				end
				flow do 
				para "3"
				@member3=edit_line
				end
				flow do 
				para "4"
				@member4=edit_line
				end
				flow do 
				para "5"
				@member5=edit_line
				end
				flow do 
				para "6"
				@member6=edit_line
				end
				flow do 
				para "7"
				@member7=edit_line
				end
				flow do 
				para "8"
				@member8=edit_line
				end
			end
		end
	end

