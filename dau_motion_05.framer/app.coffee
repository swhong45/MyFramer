# Welcome to Framer
# Global Background Layer
bg = new BackgroundLayer backgroundColor: "white"

Framer.Defaults.Animation = {
    curve: "spring(800,100,0)"
}

# Define Container - superLayers
today = new Layer x:0, y:0, width:1280, height:720, backgroundColor:"transparent"

boundary_x = 20
boundary_y = 120
w_padding = 10
w_color = "white"

widget1 = new Layer x: boundary_x, y: boundary_y, width: 1280 - boundary_x*2, height: 720 - boundary_y, backgroundColor: "#2196F3", borderRadius:5
widget2 = new Layer x:30, y:420, width: 400, height: 290, backgroundColor: "#F4511E", borderRadius: 3
widget3 = new Layer x:440, y:420, width: 400, height: 290, backgroundColor: "#FF9800", borderRadius: 3
widget4 = new Layer x:850, y:420, width:400, height:290, backgroundColor: "#4CAF50", borderRadius:3

widgetGroup = [widget1, widget2, widget3, widget4]

# number1 = new Layer
#   x:0, y:30, midX:320, width:640, height:188, backgroundColor: 'transparent'
# number2 = new Layer
#   x:0, y:50, midX:150, width:300, height:290, backgroundColor: 'transparent'
# number3 = new Layer
#   x:0, y:50, midX:150, width:300, height:290, backgroundColor: 'transparent'
# number4 = new Layer
#   x:0, y:50, midX:150, width:300, height:290, backgroundColor: 'transparent'
# 
# numberGroup = [number1, number2, number3, number4]
# 
# for cnt in [0..3]
# 	 numberGroup[cnt].superLayer = widgetGroup[cnt]
# 	 numberGroup[cnt].style = {
# 		'font-family':'Roboto','font-weight':'800', 'padding-top':'40px','color': 'white', 'font-size':'40px','text-align':'center'
# 		}  

number1 = new Layer
  midX:widget1.midX, y:200, width:640, height:120, backgroundColor: 'white'
number2 = new Layer
  midX: widget2.midX, midY: widget2.midY,  width:100, height:100, backgroundColor: 'white'
number3 = new Layer
  midX: widget3.midX, midY: widget3.midY,  width:100, height:100, backgroundColor: 'white'
number4 = new Layer
  midX: widget4.midX, midY: widget4.midY,  width:100, height:100, backgroundColor: 'white'

numberGroup = [number1, number2, number3, number4]



changeScene = (scene) ->      
  switch scene
    when 1 
      widget2.animate({
      	properties: {width:600}
      })
      widget3.animate({
      	properties: {x: 640, width:300}	
      })
      widget4.animate({
      	properties: {x: 950, width:300}
      })
    when 2 
      widget2.animate({
      	properties: {width:300}
      })
      widget3.animate({
      	properties: {x: 340, width:600}	
      })
      widget4.animate({
      	properties: {x: 950, width:300}
      })

    when 3 
      widget2.animate({
      	properties: {width:300}
      })
      widget3.animate({
      	properties: {x: 340, width:300}	
      })
      widget4.animate({
      	properties: {x: 650, width:600}
      })


flag = 0
Utils.interval 2, ->
	a = Utils.randomNumber(0, 1)
	flag += 1
	if flag < 4
		changeScene(flag)
		numberGroup[0].html = "123456789"
		Utils.delay 0.1, ->
			numberGroup[flag].html = Utils.round(a*100000 + 1000000, 0)
			numberGroup[flag].animate ({
				properties: {scale:1.2}
			})
	else		
		flag = 0

