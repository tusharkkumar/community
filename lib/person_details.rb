


def selectall(id)
	sql="select * from person_details where id=#{id} "
	res=@@con.query(sql)
	return res
	# return runQuery(sql)
end

def insertinto(id,name,qualification,interests,contact_no,experiance,requirement,address)
	
	sql="insert into person_details(id,person_name,qualification,interests,contact_no,experiance,requirement,address) values(#{id},'#{name}','#{qualification}','#{interests}',#{contact_no},'#{experiance}','#{requirement}','#{address}') "
	res=@@con.query(sql)
	return res
end

def selectbyid(id)
	sql="SELECT person_name,qualification,email,contact_no,experiance,working_projects,live_projects,technical_skills FROM person_details WHERE id=#{id} "
	return runQuery(sql)
end

def updatedata(id,name,qualification,interests,contact_no,experiance,requirement,address)

	# sql="update person_details set person_name='#{name}',qualification='#{qualification}',interests='#{interests}',contact_no=#{contact_no},experiance='#{experiance}',requirement='#{requirement}',address='#{address}' where id=#{id}"
	sql="update person_details set person_name='#{name}',qualification='#{qualification}' ,interests='#{interests}',contact_no=#{contact_no} ,experiance='#{experiance}',requirement='#{requirement}',address='#{address}'where id=#{id}"
	return runQuery(sql)
end

def updateworking(id,working_project,language_working,member_working)

	sql="update person_details SET working_projects='#{working_project}',language_working='#{language_working}',member_working=#{member_working} where id=#{id} "
	return runQuery(sql)	
end

def updateworking_saved(id,working_project,member_working,language_working)
	
	sql="insert into working_project(id,working_projects,member_no,lang) values(#{id},'#{working_project}',#{member_working},'#{language_working}')"	
	return runQuery(sql);
end




def updatelive(id,live_project,language_live,member_live)
	
	sql="update person_details SET live_projects='#{live_project}',language_live='#{language_live}',member_live=#{member_live} where id=#{id} "
	return runQuery(sql)
end


def updatelive_saved(id,live_project,member_live,language_live)
		sql="insert into live_project(id,live_projects,member_no,lang) values(#{id},'#{live_project}',#{member_live},'#{language_live}')"	
	return runQuery(sql);
end

def delete(id) 
	sql="DELETE FROM person_details WHERE id=#{id}"
	return runQuery(sql)
end


def runQuery(sql)
	res=@@con.query(sql)
	if res
	return res
	else
	alert "error in the query"
	end

end

