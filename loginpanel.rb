
$path=File.join(File.dirname(__FILE__),"lib","")
require $path + "person_details.rb"
require $path + "comunitydetails.rb"
require $path + "adminpanel.rb"
# require $path + "chattingpanel.rb"
require "userwindow1.rb"

#-----------------------------------------------SETUP----------------------------------------##



Shoes.setup do 
gem "mysql2"
gem "prawn"
end




	require "mysql2"
	require "prawn"

#-----------------------------------------------CONNECT----------------------------------------##


	def connect
		@@con=Mysql2::Client.new(:host=>"localhost",:database=>"communitybase",:username=>"root",:password=>"Tushar786")
		@@con.query_options.merge!(:symbolize_keys=>true)
		return true if @@con
	end



#-----------------------------------------------MAINPAGE----------------------------------------##
def main_screen
	

	Shoes.app(title:"WELCOME TO THE FUSION HUB",height:800,width:1300,:scroll=>false,resizable:false) do 

		
		image"images/welcome3.jpg",height:800,width:1300,top:00
		timer(1) do 
		image "images/logo.png",height:60,width:200,top:00,left:800
		end
		
		image("images/title.png",left:400,top:0,height:80,width:400)


		
		
		#-----------------------------------------------DOWNIMAGES----------------------------------------##
		downstack=stack(top:650,left:0) do 
			# background red

			image_login=flow do 
				image("images/login.png",height:35,width:90) do 
				start_login
				self.close
				end
				para("|",stroke:white,size:16,left:85)

				image("images/signup.png",height:35,width:110) do
				start_signup 
				self.close
				end
				image("images/aboutus.png",height:35,width:110,right:130) do 
					window(title:"AboutUs",height:800,width:800) do 
						background black
						image("images/aboutus.png")
					end
					
				end
				para("|",stroke:white,size:15.5,left:1171)
				image("images/contactus.png",height:35,width:120,right:0) do 
					window(title:"ContactUs",height:800,width:800) do 
						background black
						image("images/contactus.png")
					end
			end #image_login

		end #downstack 
	end #shoes app end
			
end # main screen


#-----------------------------------------------LOGINFUNCTION----------------------------------------##

def start_login

	window(title:"COMMUNITY LOGIN",height:800,width:1300,resizable:false) do 

		image "images/w1.jpg",height:800,width:1300,top:00
		timer(1) do 
		image "images/logo.png",height:60,width:200,top:00,left:800
		end
	
		image("images/loginpanel2.png",height:80,width:400,left:400)


		#--------------------------------------------ADMIN BUTTON---------------------------------------#


		@admin_button=image("images/adminpanel.png",right:0,top:0,height:30,width:140)do
				admin_panel 
				self.close
		end

				


		#-----------------------------------------------SHARE IDEAS BUTTON----------------------------------------##
					
		share_idea_button=image("images/futureideas.png",left:0,height:30,width:140) do 
			if connect
				@user_array=[]
				@ideas_array=[]

				sql="select * from quara"
				@res=@@con.query(sql)
				@res.each do |u|
					usernameget=u[:user]
					@user_array << usernameget 
					ideasget=u[:shareideas]
					@ideas_array << ideasget 
				end
				

			
				@@con=nil	
			end

			 #-----------------------------------------------SHAREIDEAS----------------------------------------##

						


			@shareideasstack=stack(top:25,left:0,height:800,width:500,:scroll=>true) do 
				background black(0.6)
				

				@login_ideas=button("x",left:480,top:0,height:20,width:20) do 
				@shareideasstack.hide
				@login_ideas.hide

				end

		

				@user_array.each do |u|
					stack do 
						flow do 
						 if u==""
						 	u="NULL"
						 	caption(u,stroke:white)
							caption("says:",stroke:white)
							# caption(i,stroke:white)
						 else	
						 	caption(u,stroke:white)
							caption("says:",stroke:white)
							# caption(i,stroke:white)
						 end
							
						end
					end
				end 
				para ""

				stack(top:0,left:120) do 
					@ideas_array.each do |i|
						
						flow do 
						   
							if i!=""
							 	caption(i,stroke:white)
							else
								i="NULL"
							 	caption(i,stroke:white)
							end
							  
						end

					end
				end
			end	#share idea stack
		end	#share_idea_button 

 			#------------------------------------------LOGINPANELOPTINS------------------------------------------------
		login_option=stack(top:300,left:400,height:200,width:400)do
			background black(0.6)

			

			flow(top:10,left:20) do

				image("images/username2.png",height:30,width:120)
			
				para " "
				@username=edit_line 
			end

			flow(top:50,left:24) do
				image("images/password2.png",height:30,width:120)
				para " "
				@password=edit_line :secret=>true
			end


				
				 #--------------------------------------LOGIN FUNCTION----------------------------------------------------------
			login_function=flow(left:0,top:100) do 
				login_button=button("LOGIN",left:150) do
					if connect
					
						if @username.text=="" or @password.text==""
							alert "Check all the fields ...it must be filled"

						else

							sql="select id,username from community_details where username= '#{@username.text.downcase}' and password='#{@password.text.downcase}'"
							result=@@con.query(sql)
							result.each do |user|
								@id=user[:id]

							end



							res=result.count
							if res >0
								result.each do |user|	

									@@id=user[:id]
									@username=user[:username]
								end

								

								sql="select id from person_details"
								result_id= @@con.query(sql)
								@id_new=[]
								result_id.each do |i|
									@id_new << i[:id]

								end



								if @id_new.include?(@id)

								else
									sql ="insert into person_details(id) values(#{@id})"
									result=@@con.query(sql)
								end

								#-----------------------------------------------WELCOME--------------------------------------------##
								alert "Welcome To Your Fusion Hub"
								user_hub(@username,@id)
								self.close
								@@con=nil
								

							else
								alert "Access Denied.. check your username or password"
							end
						
						end

						
					else
						alert "Failed to Connect to the database"
						@@con=nil
					end #connection_if
				end #login_button

				# @forget_password=button("Forget Password",left:200) do

					
				# 	# if connect
				# 	if @username.text=="" 
				# 		alert "fill the username first "
				# 	else
				# 		passwordupdate(@username.text)

				# 	end

				# end  
			end #login_function		
		end #login_option
			image("images/back.png",height:30,width:100,left:10,top:650) do 
				main_screen
				self.close
			end

	end # window end
end # fmainscreen 

end

main_screen

def passwordupdate(username)

	window(title:"Forget Password",height:200,width:500) do
	background black(0.6)
		flow do
			@new_password=edit_line
			@savepassword=button("Update Password") do 

				
					if @new_password.text==""
						alert "password field could not be empty"

					else
						if connect
							usernames=[]
							sql2="select username from community_details"
							allusername=@@con.query(sql2)
							allusername.each do |name|
								usernames<<name

							end
							if @new_password.text.size < 6
								alert "Password Must be of atleast 6 digit"
							else
								if usernames.include?(:username=>"#{username}")
									sql="update community_details set password='#{@new_password.text}' where username='#{username}' "
									res=@@con.query(sql)
									alert "Password Recovery Successfully"
									self.close
													
								else
									alert "username does not exists fill correct username to Update password"
								
								end
								
							end
						

							
						else
							alert "connection not established"
						end

						
					end

				
			end
		end
	end

end

#------------------------------------------SIGNUP PANEL------------------------------------------------	

def start_signup
	community_signup=window(title:"COMMUNITY SIGNUP",height:800,width:1300,resizable:false)do 
		image "images/w1.jpg",height:800,width:1300,top:00
		timer(1) do 
		image "images/logo.png",height:60,width:200,top:00,left:800
		end

	
		title("SIGNUP HERE",align:"center",font:"Algerian",stroke:"#00ffff",underline:"double",stroke:black)

			#------------------------------------------SIGNUPDETAILS------------------------------------------------
		signup_details=stack(top:200,left:400,height:350,width:500) do
			background black(0.6)
			flow(top:13,left:110){
			image("images/username3.png",width:100,height:30)
			para " "
			@username_s=edit_line}

			para " "

				flow(top:50,left:110) do
					image("images/password3.png",width:100,height:30)
					para " "
					@password_s=edit_line :secret=>true
				end
			para " "
				flow(left:60,top:90) do 
					image("images/confirm.png",width:150,height:32)
					para " "
					@confirm_password_s=edit_line :secret=>true
				end

				flow(left:150,top:130) do 
					image("images/email.png",width:60,height:30)
					para " "	
					@email=edit_line
				end

				flow(left:70,top:170) do 
					image("images/hubname.png",width:140,height:35)
					para " "	
					@name_community=edit_line 
				end

				flow(left:120,top:205) do 
					
					image("images/loginas.png",width:100,height:30)
					
					
					para " "
					
					@is_admin=check;
					image("images/admin.png",width:100,height:30)
					@is_admin.checked=false
					
					para "  "
					
					@is_member=check
					image("images/member.png",width:100,height:30)
					@is_member.checked=false

				end

			sign_up=flow(left:20,top:250) do 
				button("Sign Up",left:200,align:"center") do
				 	if connect
				 		usernames=[]
						sql2="select username from community_details"
						allusername=@@con.query(sql2)
						allusername.each do |name|
							usernames<<name

						end	
						emails=[]
						sql2="select email from community_details"
						allemails=@@con.query(sql2)
						allemails.each do |e|
							emails<<e

						end	
						if usernames.include?(:username=>"#{@username_s.text}")

							alert "username already exits try different username"
						elsif emails.include?(:email=>"#{@email.text}")
							alert "email already registered try different email" 

							
						else

							signup_validation
						end
					else
						alert "connection not established"
				 	end					
							

				end

				button("Login",left:300) do
					start_login
					self.close
				end

			end #sign_up
		end #signup_details
			image("images/back.png",height:30,width:100,left:10,top:650) do 


				main_screen
				self.close
			end
	end #community_signup
end #start_signup
#------------------------------------------SIGNUP VALIDATION------------------------------------------------

def signup_validation
	if connect
		if @username_s.text=="" or @password_s.text=="" or @confirm_password_s.text=="" or @email.text=="" or @name_community.text=="" 
			alert "Check all the fields ...it must be filled"
		elsif @username_s.text.length > 5 and @password_s.text.length >5 and @email.text.length > 5
				if	@password_s.text==@confirm_password_s.text
					@email_val=@email.text
					@array=@email_val.split("")
					if @array.include? ("@")
						if @array.include? (".")
							@is_admin=@is_admin.checked ? 1:0
							@is_member=@is_member.checked ? 1:0
							
								
							
							insert_details
						else
							alert "Email does not contain .com or .in "
						end
					else
						alert "Invalid Email address please Enter valid email address contains @ "
					end
				else
				
					alert "Password does not match .. "

				end	
		else
			alert "Username ,Password and Email must be greater than 5 characters"

		end
	else
		alert "Failed to Connect to the database"
	end
					
	
end

#------------------------------------------SIGNUP INSERT DETAILS------------------------------------------------

def insert_details
			res=insert(@username_s.text,@password_s.text,@email.text,@name_community.text,@is_admin,@is_member)
			alert "Sign Up Successfully Saved"
			@username_s.text=""
			@password_s.text=""
			@email.text=""
			@name_community.text=""
			@is_admin=""
			@is_member=""
			@confirm_password_s.text=""

end

	
	#---------------------------------------------ADMIN PANEL -------------------------------#


def admin_panel

	@admin_username=ask("Enter Admin Username:",left:800,top:0)
	@admin_password=ask("Enter Admin Password:",left:800,top:0)
	
	if @admin_username=="tushar" or @admin_password=="0786"
		alert "welcome"

		window(title:"ADMIN PANEL",height:800,width:1300,resizable:false) do 
				image"images/welcome3.jpg",height:800,width:1300,top:00
				title("ADMIN PANEL",stroke:black,font:"Algerian",underline:"double",left:450,top:0) 
				timer(1) do 
				image "images/logo.png",height:60,width:200,top:00,left:800
				end

				@options=button("User Option",left:0,top:200) do 
					@adminprivilages.toggle


				end

				@adminprivilages=flow(left:0,top:240,:hidden=>true,height:100,width:1300) do 
 
					@insert=button("insert",top:5,left:20) do 
						@stack_insert.toggle
					end

					@delete=button("delete",top:5,left:300) do 
						@stack_delete.toggle
					end
					
					@update=button("update",top:5,left:600) do 
						@stack_update.toggle

					end
					
					@misleneous=button("Misleneous",top:5,left:900) do 
						@stack_mislenious.toggle

					end

				end

				@stack_insert=stack(height:300,width:200,:hidden=>true,top:270,left:20) do
					para ""
					
					@user_insert=button("New Owner") do 
						insert_newuser	

					end
					para ""

					@Member_insert=button("New Member") do 

					end
					para ""

					
					@details_insert=button("Important detail") do 

					end
					

				end
					
				@stack_delete=stack(height:300,width:200,:hidden=>true,top:270,left:300) do
					para ""
					
					@user_delete=button(" Owner") do 
					

					end
					para ""


					@Member_delete=button(" Member") do 

					end
					para ""

					
					@details_delete=button("details") do 

					end
					
					
				end
				@stack_update=stack(height:300,width:200,:hidden=>true,top:270,left:600) do
					para ""
					
					@user_update=button("Owner Details") do 
					

					end
					para ""

					@Member_update=button("Member Details") do 

					end
					para ""
					
					@details_update=button("Group details") do 

					end
										
					
				end
				@stack_mislenious=stack(height:300,width:200,:hidden=>true,top:270,left:900) do
					background red


				end

			end



		
	else

		alert "You are not a Authorise Person.."
		start_login

	end

	
end
		
