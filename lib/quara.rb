#------------------------------------------UPDATE------------------------------------------------

def quaraupdateshare(id,ideas,username)
	sql="update quara set shareideas='#{ideas}',user='#{username}' where id=#{id}" 
	return runQuery(sql)
end
#------------------------------------------IDEAS INSERT------------------------------------------------


def quarainsertshare(id,ideas,username)
	sql="insert into quara(id,shareideas,user) values(#{id},'#{ideas}','#{username}')"
	return runQuery(sql)
	
end
#------------------------------------------QUES ANS------------------------------------------------

def quesupdate(id,quesans)
	sql="update quara set quesans='#{quesans}' where id=#{id}"
	return runQuery(sql)
end


#------------------------------------------SELECT ALL------------------------------------------------
def selectquara(id)
	sql="select * from quara where id=#{id}"
	return runQuery(sql)
end

#------------------------------------------RUN QUERY------------------------------------------------

def runQuery(sql)
	res=@@con.query(sql)
	return res
end