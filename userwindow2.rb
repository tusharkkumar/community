

$path=File.join(File.dirname(__FILE__),"lib","")
$path_back=File.join(File.dirname(__FILE__),"../")
require $path + "person_details.rb"
require $path + "chattingpanel.rb"







#------------------------------------------PERSONAL DETAILS WORKING ------------------------------------------------


def personal_details(id)

	@detail_stack=stack(left:360,top:100,margin:"black",height:550,width:400,:hidden=>true) do
		background gray(0.6)
		@id_user=id

		flow do 

			btn=button("X",right:0,height:20,width:22)do 
				@detail_stack.hide 
			end
		end
		para ""
		flow do
			caption("Name",left:50)
			@name=edit_line(left:120)
		end

		flow(left:50) do 
			caption("Address",left:40)
			@address=edit_box(width:250,height:100,left:120)
		end


		flow do
			caption("Qualification",left:10)
			@qualification=list_box(:items=>["under graduate","post graduate","others"],choose: "under graduate",left:120)
		end

		flow do 
			caption("Experiance",left:20)
			@experiance=list_box(:items=>["1year","2years","3years","more than 3years","no experiance yet"],choose: "1year",left:120)
		end


		flow()do 
			caption("Interest",left:40)
			@interests=edit_box(left:120,height:100,width:250)
			
		end
		flow(left:50,top:150) do  	
			caption("Contact No",left:20,top:380)
			@contact_no=edit_line(left:70,top:230)
		end

		flow do 
			caption("Requirement",left:5,top:410)
			@requirement=edit_box(left:120,height:100,width:250,top:50)
			
		end

			if connect

				getid=selectall(@id_user)
				getid.each do |user|
					@id_get=user[:id]
				end

				@submit_disapper=stack(top:520,left:120,width:150,height:30) do
						button("update detail") do
								
							
								if @id_get==@id_user

									if connect

											if @name.text=="" or @address.text=="" or @interests.text=="" or @requirement.text=="" or @contact_no==""
												alert "Fill all the fields"
											elsif @address.text.to_s.size<=10
												alert "address must contain the proper desciption"
												

											elsif @contact_no.text.to_s.size<10 or @contact_no.text.to_s.size>10 
												alert "contact must be of 10 digit"
											else
											updatedata(@id_user,@name.text,@qualification.text,@interests.text,@contact_no.text,@experiance.text,@requirement.text,@address.text)
											alert "details Successufully Updated"
											end
										@qualification.text=""
										@interests.text=""
										@contact_no.text=""
										@experiance.text=""
										@requirement.text=""
										@address.text=""
										@detail_stack=""

											@@con=nil
									end

								else
								
									if connect

										insertinto(@id_user,@name.text,@qualification.text,@interests.text,@contact_no.text,@experiance.text,@requirement.text,@address.text)

										alert "Data Successufully Saved"
										
										@qualification.text=""
										@interests.text=""
										@contact_no.text=""
										@experiance.text=""
										@requirement.text=""
										@address.text=""
										@detail_stack=""
										@@con=nil						

									end

								end							

						end

				end
		 end
	end
end















#------------------------------------------SHOW DETAIL FUNCTIONING------------------------------------------------

def show_details(id)

	@detail_display=stack(left:360,top:100,height:550,width:400,:hidden=>true) do 
		background gray(0.6)
		@btn1=button("X",right:0,top:0,height:20,width:22) do

			@detail_display.hide

		end	



			if connect
				result=selectall(@id_user)
				# alert result
				# alert "result now executed"
				result.each do |user|
					# @@userId=user[:id]
					@userName=user[:person_name]
					@userQualification=user[:qualification]
					@userInterests=user[:interests]
					@userContactno=user[:contact_no]
					@userExperiance=user[:experiance]
					@userRequirement=user[:requirement]
					@userAddress=user[:address]
				end

				stack(top:70) do 
				caption "Name: #{@userName}"
				para ""
				caption "Address: #{@userAddress}"
				para ""
				caption "Contactno: #{@userContactno}"	
				para ""
				caption "Qualification:#{@userQualification}"
				para ""
				caption "Experiance: #{@userExperiance}"
				para ""
				caption "Interest: #{@userInterests}"
				para ""
				caption "Requirement:#{@userRequirement}"
				end
				@@con=nil
	
			end
			user_name=@userName
			user_address=@userAddress
			user_contact=@userContactno
			user_quali=@userQualification
			user_exp=@userExperiance
			user_interest=@userInterests
			user_req=@userRequirement
				#----------------------------------------------PDF BUTTTON ---------------------------#
		@pdfgenerate=button("Generate Pdf",top:0,right:150) do 
				Prawn::Document.generate("#{user_name}.pdf") do 
					text "USERNAME :#{user_name} "
					text "ADDRESS :#{user_address}"
					text "CONTACT NO :#{user_contact}"
					text "QUALIFICATION :#{user_quali}"
					text "EXPERIANCE: #{user_exp}"
					text "INTERESTED : #{user_interest}"
					text "REQUIREMENTS :#{user_req}"
					# text user_address
					# text user_contact
					
					# text user_quali
					# text user_exp
					# text user_interest
					# text user_req
				end
				alert "pdf generated"

			end
	
	end
end


#------------------------------------------HUB DETAILS FUNCTIONING OPTION------------------------------------------------


def hub_details(id)


	@hub_details=stack(left:360,top:100,height:550,width:400,:hidden=>true) do
		background gray(0.6)
		button("X",top:0,right:0,height:20,width:22) do
			@hub_details.hide
		end	


		para ""
		
		if connect

			result=selectall(@id_user)
			result.each do |user|
				# @@userId=user[:id]
				@workingproject=user[:working_projects]
				@liveproject=user[:live_projects]
				@languageworking=user[:language_working]
				@languagelive=user[:language_live]
				@last_seen=user[:last_seen]
				
			end

			sql="select * from community_details where id=#{@id_user}"
			@result_timing=@@con.query(sql)
			@result_timing.each do |user|
				@name_community=user[:name_community]
				@is_created=user[:is_created]
				@is_modified=user[:is_modified]		
			end

			stack do 

				flow do 
					caption("Hub Created at :")
					@is_created ="#{@is_created.day}-#{@is_created.month}-#{@is_created.year} #{@is_created.hour}:#{@is_created.min}:#{@is_created.sec}"
					caption @is_created
				end
				para ""
				flow do 
					caption("Last Seen:")
					@last_seen ="#{@last_seen.day}-#{@last_seen.month}-#{@last_seen.year} #{@last_seen.hour}:#{@last_seen.min}:#{@last_seen.sec}"
					caption @last_seen
					end
				para ""
				flow do 

				caption("Modified time:")
				@is_modified ="#{@is_modified.day}-#{@is_modified.month}-#{@is_modified.year} #{@is_modified.hour}:#{@is_modified.min}:#{@is_modified.sec}"
				caption @is_modified
				end
				para ""
				flow do 
					caption("Working Project:")
					caption @workingproject


					button("ADD",right:0) do 
						my_projects(@id_user)
						@hub_details.hide
					end
					
				end

				para ""
				flow do 
					caption("Live Projects:")
					caption @liveproject

					button("ADD",right:0) do
						my_projects(@id_user)
						@hub_details.hide
					end
				end
				para ""

		

				flow do 
					caption("Add Language")
					caption @liveproject
					para("*",stroke:red)
					

					button("ADD",right:0) do
						@add_lang.show

					end
					
				end

				@add_lang=flow(:hidden=>true,height:100,width:400) do 
					stack do 
						flow do
							para("*",stroke:red)
							para("Important to be filled",stroke:red)
						end

						flow do 
							@choose_option=edit_line(stroke:white)
							if @choose_option.text==" "
								alert("Language can't be empty")
							else
								if connect
									
								end
								
							end
							para(" ")
							button("submit") do

								@add_lang.hide
								@hub_details.hide


							end
						end

					end

					

				end





			end
			@@con=nil
		else
			alert "connection not build"
			@@con=nil
		end
	end
end


