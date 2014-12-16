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

info = new Layer
  x:0, y:300, midX:320, width:640, height:188, backgroundColor: 'transparent'
info.html = 'Ed Chao'
info.style = {
  'font-family':'Roboto',
  'font-weight':'400',
  'padding-top':'40px',
  'color': '#777'
  'font-size':'40px',
  'text-align':'center'
}  

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



flag = 1
Utils.interval 2, ->
	if flag < 4
		changeScene(flag)
		flag += 1
	else		
		flag = 1	


