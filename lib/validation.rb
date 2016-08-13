

def validationofuserprofiledetails
	if @name.text==""
		alert "name should not be empty"
	
	elsif @address.text=="" 
		alert "address should not be empty"
	
	elsif @interests.text=="" 
		alert "interests should not be empty"
	
	elsif @contact_no.text==""
		alert "contact_no should not be empty"
	
	elsif @requirement.text==""
		alert "requirement should not be empty"

		
	end
	return true

		
	
end