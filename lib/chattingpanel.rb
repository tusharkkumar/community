
$path_back=File.join(File.dirname(__FILE__),"../")

require $path_back + "loginpanel.rb"
require $path_back + "userwindow1.rb"
require $path_back + "userwindow2.rb"

def chattingpanel
		
	Shoes.app(width:800,height:700) do
		



				stack(left:00,top:00,height:40,width:950)do
					background silver
					caption("CHATTING ONE")
					line(00,38,800,35)
				end

				line(950,00,950,700)

				stack(right:0,top:350,width:415,height:350)do
					background lightgreen
					button("ACTIVE MEMBERS",weight:200,height:30,top:1) do
					end
					line(00,35,415,35)
				end

				stack(right:0,top:0,width:415,height:350)do
					background gold
					button("NOT ACTIVE",weight:200,height:30,top:1) do 

					end
					line(00,35,415,35)

				end

	end		
	
end
