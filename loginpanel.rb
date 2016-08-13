

$path=File.join(File.dirname(__FILE__),"lib","")
require $path + "person_details.rb"
require $path + "comunitydetails.rb"

require "userwindow1.rb"



Shoes.setup do 
gem "mysql2"
gem "prawn"
end



	require "mysql2"
	require "prawn"



	def connect
		@@con=Mysql2::Client.new(:host=>"localhost",:database=>"communitybase",:username=>"root",:password=>"")
		@@con.query_options.merge!(:symbolize_keys=>true)
		return true if @@con
	end




	Shoes.app(title:"WELCOME TO THE FUSION HUB",height:800,width:1300,resizable:false) do 
		
		image"images/welcome3.jpg",height:800,width:1300,top:00
		timer(1) do 
		image "images/logo.png",height:60,width:200,top:00,left:800
		end
		
		image("images/title.png",left:400,top:0,height:80,width:400)
		

		stack(top:700,left:0) do 

			flow do 
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
				end

			end


		end

	end

	

def start_login

		window(title:"COMMUNITY LOGIN",height:800,width:1300,resizable:false) do 

					image "images/w1.jpg",height:800,width:1300,top:00
					timer(1) do 
					image "images/logo.png",height:60,width:200,top:00,left:800
					end
					# background "#4169e1".."#191970"
					# title("LOGIN HERE",align:"center",font:"Algerian",stroke:"#00ffff",underline:"double",stroke:black)
					title("LOGIN PANEL",width:400,left:490,top:0,stroke:black,font:"Algerian",underline:"double")
#-----------------------------------------------share ideas button----------------------------------------##
					button "Future Ideas" do 
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

						@login_ideas=button("x",left:480,top:8,height:20,width:20,:hidden=>true ) do 
							@shareideasstack.hide
							@login_ideas.hide

						end


						@shareideasstack=stack(top:25,left:0,height:800,width:500) do 
						background black(0.6)
						@login_ideas.show

						

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






						end

					end 



		#------------------------------------------options------------------------------------------------
					stack(top:300,left:400,height:200,width:400)do
						background black(0.6)
						flow(top:10,left:100){
						caption("Username",height:30,width:120,font:"Algerian",stroke:white)
						# para("username",font:"Algerian",stroke:white,size:15)
						para " "
						@username=edit_line}
						flow(top:50,left:100){
						caption("Password",height:30,width:120,stroke:white,font:"Algerian")
						para " "
						@password=edit_line :secret=>true}
						
		#--------------------------------------buttons----------------------------------------------------------
						flow(left:0,top:100) do 
							button("LOGIN",left:210) do
								if connect
									
									if @username.text=="" or @password.text==""
										alert "Check all the fields ...it must be filled"
									else
										sql="select id,username from community_details where username= '#{@username.text.downcase}' and password='#{@password.text.downcase}'"
										result=@@con.query(sql)
										result.each do |user|
											@id=user[:id]

										end
										# @@store=result[:username]

										res=result.count
										if res > 0


	
												
											result.each do |user|	

												@@id=user[:id]
												@username=user[:username]
											end

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
								end
							end

							button("SignUp",left:300) do 
								start_signup
								self.close

							end
						end
					end	
		


		end
	

end


	

def start_signup
	window(title:"COMMUNITY SIGNUP",height:800,width:1300,resizable:false)do 
		image "images/w1.jpg",height:800,width:1300,top:00
		timer(1) do 
		image "images/logo.png",height:60,width:200,top:00,left:800
		end

	
			title("SIGNUP HERE",align:"center",font:"Algerian",stroke:"#00ffff",underline:"double",stroke:black)

#------------------------------------------options------------------------------------------------
		stack(top:250,left:400,height:400,width:500)do
			background black(0.6)
			flow(top:10,left:100){
			para("username",font:"Algerian",stroke:white,size:15)
			para " "
			@username_s=edit_line}

			para " "

			flow(top:50,left:100){
			para("password",font:"Algerian",stroke:white,size:15)
			para " "
			@password_s=edit_line :secret=>true}
			para " "
			

			flow(left:15,top:90){para("confirm password",font:"Algerian",stroke:white,size:15)
			para " "
			@confirm_password_s=edit_line :secret=>true}

			flow(left:145,top:130){para("email",font:"Algerian",stroke:white,size:15)
			para " "	
			@email=edit_line}

			flow(left:25,top:170){para("HuB(Group) Name",font:"Algerian",stroke:white,size:15)
			para " "	
			@name_community=edit_line }

			flow(left:8,top:205){
			para("Login As",font:"Algerian",stroke:white,size:15)
			
			para(":",font:"Algerian",stroke:white,size:15)
			para " "
			
			@is_admin=check;
			para("Admin",font:"Algerian",stroke:white,size:15)
			@is_admin.checked=false
			
			para "  "
			
			@is_member=check
			para("Member",font:"Algerian",stroke:white,size:15)
			@is_member.checked=false}

				flow(left:10,top:250) do 
				button("Sign Up",left:200,align:"center") do
					signup_validation

				end
				button("Login",left:300) do
					start_login
					self.close
				end

				end



		end


	end


end

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


def insert_details
	# alert "working fine"
	res=insert(@username_s.text,@password_s.text,@email.text,@name_community.text,@is_admin,@is_member)
	alert "Sign Up Successfully Saved"
	@username_s.text=""
	@password_s.text=""
	@email.text=""
	@name_community.text=""
	@is_admin=""
	@is_member=""
	@confirm_password_s.text=""
	@@con=nil

end



# def ball_animation

# 	fill "#FFDAB9"
#   @gravity = 0.05
#   @velocity =10.0
#   @ball_radius = 60
#   @ball = oval(top: 10, 
#               left: width / 4 - @ball_radius, 
#               radius: @ball_radius)
#     animate(60) do
#       @velocity += @gravity
#       @ball.top += @velocity 
#       if @ball.top > height - @ball_radius * 2
#         @ball.top = height - @ball_radius * 2
#         @velocity = @velocity * -0.8
#       end
#     end
		
# end


