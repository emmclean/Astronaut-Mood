# Prototyping with Framer
#---------Variables-------__#
#Axis
axis_height = 500
axis_width = 1400

#Label vars
x_counter = 51
x_counter_3 = 51
emotion_Array = []

#---------Arrays-------#
#Vigor-Activity
vigor_Array = [8.705, 7.63, 9.655, 7.535, 8.45]

#Anger-Aggression
anger_agro_Array = [2.16, 2.14, 3.57, 2.39, 3.59]

#Tension-Anxiety
tension_Array = [4.11, 8.04, 4.97, 7.1, 10.7]

#Depression-Dejection
depression_Array = [2.16, 5.89, 3.4, 2.52, 8.6]

#Anger-Hostility
anger_hos_Array = [2.67, 5.63, 5.12, 3.26, 8.9]

#Confusion-Bewilderment
confusion_Array = [3.26, 3.61, 2.93, 2.44, 7.1]

#Fatigue-Inertia
fatigue_Array = [3.63, 4.38, 4.19, 2.65, 9]

#workpressure
work_pressure_Array = [6.63, 4.06, 7.75, 5.38, 5.31]

#task orientation
task_orientation_Array = [7.94, 8.31, 7.43, 8.41, 7.07]

#order & organization
order_Array = [6.59, 7.43, 5.8, 7.27, 5.93]

#independence
independence_Array = [6.69, 6.2, 4.38, 6.42, 6.46]

#Groups Array
group_array = ["ISS US", "ISS Russian", "Mir US", "Mir Russian", "Non-Astronaut"]

#Emotion LAbels
emotion_labels = ["Vigor-Activity", "Anger-Aggression", "Tension-Anxiety", "Depression-Dejection", "Anger-Hostility", "Confusion-Bewilderment", "Fatigue-Inertia"]

#empty_Arrays
workArray = []
taskArray = []
orderArray = []
independenceArray = []

#---------Styles-------#
headerstyle =
	"font-family" : "Roboto Black"
	"font-size" : "36pt"
	"text-align" : "center"
	"line-height" : "50px"
	"color" : "#253b56"

label1 =
	"font-family" : "Roboto"
	"font-size" : "12pt"
	"padding-left" : "10px"
	"padding-right" : "10px"
	"text-align" : "center"
	"line-height" : "40px"
	"color" : "#253b56"

label2 =
	"font-family" : "Roboto"
	"font-size" : "12pt"
	"padding-left" : "10px"
	"padding-right" : "10px"
	"text-align" : "left"
	"line-height" : "20px"
	"color" : "#253b56"

tooltipStyle =
	"font-family" : "Roboto"
	"font-size" : "10pt"
	"padding-left" : "5px"
	"padding-right" : "5px"
	"text-align" : "center"
	"line-height" : "30px"
	"color" : "#253b56"

#---------Header-------#
header = new Layer
	width: Screen.width
	height: 100
	y: 32
	backgroundColor: null
	html: "Astronaut Mood Profile"
	style: headerstyle


#---------Create bar graph charts-------__#

#Bounding Box
bounding_box = new Layer
	x: Align.center()
	y: 164
	width: 1450
	height: 1000
	backgroundColor: null

#Axis
y_axis = new Layer
	parent: bounding_box
	width: 1
	height: axis_height
	x: 50
	y: 50
	backgroundColor: "black"

x_axis = new Layer
	parent: bounding_box
	width: axis_width
	height: 1
	x: 50
	y: 50 + y_axis.height
	backgroundColor: "black"

#Create Labels
for i in emotion_labels
	emotion_section = new Layer
		name: i
		parent: bounding_box
		backgroundColor: "null"
		width: axis_width / 7
		height: 40
		x: x_counter
		y: x_axis.y + x_axis.height + 5
		html: i
		style: label1
	emotion_Array.push(emotion_section)
	x_counter = x_counter + (axis_width / 7)

more_intense = new Layer
	style: label1
	parent: bounding_box
	html: "<i>More Intense</i>"
	width: 200
	height: 30
	rotationZ: 270
	x: -65
	y: 135
	backgroundColor: "null"
more_intense.style.textAlign = "right"
more_intense.style.lineHeight = "30px"

emotional_intense = new Layer
	style: label1
	parent: bounding_box
	html: "<b>Emotional Intensity</b>"
	width: 200
	height: 30
	rotationZ: 270
	x: -70
	y: 285
	backgroundColor: "null"
more_intense.style.textAlign = "right"
more_intense.style.lineHeight = "30px"

less_intense = new Layer
	parent: bounding_box
	style: label1
	html: "<i>Less Intense</i>"
	width: 200
	height: 30
	rotationZ: 270
	x: -65
	y: 435
	backgroundColor: "null"
less_intense.style.textAlign = "left"
less_intense.style.lineHeight = "30px"

#Create bars
bar_array = []

vigorLayer = new Layer
	parent: bounding_box
angerAgroLayer = new Layer
	parent: bounding_box
tensionLayer = new Layer
	parent: bounding_box
depressionLayer = new Layer
	parent: bounding_box
angerHosLayer = new Layer
	parent: bounding_box
confusionLayer = new Layer
	parent: bounding_box
fatigueLayer = new Layer
	parent: bounding_box
# emotionLayer = new Layer

bar_creator = (array, layername, xx, color) ->
	min = 10
	max = 0
	for i in array
		if i < min
			min = i
		if i > max
			max = i
	layername.y = 50 + axis_height - (max * 50)
	layername.x = xx
	layername.height = 50 * (max - min)
	#layername.opacity = 0.6
	layername.backgroundColor = color

	for j in array
		line = new Layer
			width: 200
			height: 1
			backgroundColor: "black"
			parent: layername
			y: (max - j) * 50
			opacity: 1

	# layername.onMouseOver ->
	# 	layername.opacity = 1
	bar_array.push(layername)

bar_creator(vigor_Array, vigorLayer, 50, "grey")
bar_creator(anger_agro_Array, angerAgroLayer, 250, "#cd1f36")
bar_creator(tension_Array, tensionLayer, 450, "#a1a742")
bar_creator(depression_Array, depressionLayer, 650, "#009989")
bar_creator(anger_hos_Array, angerHosLayer, 850, "#f15a34")
bar_creator(fatigue_Array, fatigueLayer, 1050, "#902e57")
bar_creator(confusion_Array, confusionLayer, 1250, "#ecb824")

#Normal line
normal_line = new Layer
	parent: bounding_box
	x: y_axis.x + y_axis.width
	y: 550 - (50 * 4.84)
	height: 2
	width: x_axis.width - y_axis.width
	backgroundColor: "null"
	borderColor: "black"
	borderStyle: "dashed"
	borderWidth: 2

normal_text = new Layer
	style: label2
	parent: bounding_box
	x: normal_line.x + 5
	y: normal_line.y + 7
	width: 300
	height: 20
	backgroundColor: null
	html: "<i>Normalized Mood Intensity (4.88)</i>"
normal_text.style.color = "#a1a1a1"
#Tooptip
vigor_tooltip = new Layer
	parent: bounding_box
	x: vigorLayer.x + vigorLayer.width
	y: vigorLayer.y - 15
	height:0
	width: 0
	borderRadius: 150
	style: tooltipStyle

vigorLayer.onMouseOver ->

	angerAgroLayer.opacity = 0.6
	tensionLayer.opacity = 0.6
	depressionLayer.opacity = 0.6
	angerHosLayer.opacity = 0.6
	confusionLayer.opacity = 0.6
	fatigueLayer.opacity = 0.6

	vigor_tooltip.html = "Mir U.S. (9.67)"
	vigor_tooltip.animate
		properties:
			height: 30
			width: 175
			y: vigorLayer.y - 15
		curve: Bezier.ease
		time: 0.3
	Utils.delay 0.9, ->
		vigor_tooltip.html = "ISS U.S. (8.71)"
		vigor_tooltip.animate
			properties:
				y: vigorLayer.y + 34
			curve: Bezier.ease
			time: 0.3
	Utils.delay 1.8, ->
		vigor_tooltip.html = "Non-Astronauts (8.45)"
		vigor_tooltip.animate
			properties:
				y: vigorLayer.y + 48
			curve: Bezier.ease
			time: 0.3
	Utils.delay 2.7, ->
		vigor_tooltip.html = "ISS Russian (7.64)"
		vigor_tooltip.animate
			properties:
				y: vigorLayer.y + 80
			curve: Bezier.ease
			time: 0.3
	Utils.delay 3.6, ->
		vigor_tooltip.html = "Mir Russian (7.53)"
		vigor_tooltip.animate
			properties:
				y: vigorLayer.y + vigorLayer.height - 15
			curve: Bezier.ease
			time: 0.3

vigorLayer.onMouseOut ->
	angerAgroLayer.opacity = 1
	tensionLayer.opacity = 1
	depressionLayer.opacity = 1
	angerHosLayer.opacity = 1
	confusionLayer.opacity = 1
	fatigueLayer.opacity = 1

	vigor_tooltip.animate
		properties:
			height: 0
			width: 0
			y: vigorLayer.y
		curve: Bezier.ease
		time: 0.3
	vigor_tooltip.visible = false

angerAgroLayer.onMouseOver ->
	vigorLayer.opacity = 0.6
	tensionLayer.opacity = 0.6
	depressionLayer.opacity = 0.6
	angerHosLayer.opacity = 0.6
	confusionLayer.opacity = 0.6
	fatigueLayer.opacity = 0.6
angerAgroLayer.onMouseOut ->
	vigorLayer.opacity = 1
	tensionLayer.opacity = 1
	depressionLayer.opacity = 1
	angerHosLayer.opacity = 1
	confusionLayer.opacity = 1
	fatigueLayer.opacity = 1

#Tooptip
tension_tooltip = new Layer
	parent: bounding_box
	x: tensionLayer.x + tensionLayer.width
	y: 132 - 15
	height:0
	width: 0
	borderRadius: 150
	#backgroundColor: "#a1a742"
	style: tooltipStyle

tensionLayer.onMouseOver ->
	vigorLayer.opacity = 0.6
	angerAgroLayer.opacity = 0.6
	depressionLayer.opacity = 0.6
	angerHosLayer.opacity = 0.6
	confusionLayer.opacity = 0.6
	fatigueLayer.opacity = 0.6

	tension_tooltip.html = "ISS Russian (8.04)"
	tension_tooltip.animate
		properties:
			height: 30
			width: 175
			y: 132
		curve: Bezier.ease
		time: 0.3
tensionLayer.onMouseOut ->
	vigorLayer.opacity = 1
	angerAgroLayer.opacity = 1
	depressionLayer.opacity = 1
	angerHosLayer.opacity = 1
	confusionLayer.opacity = 1
	fatigueLayer.opacity = 1

	tension_tooltip.animate
		properties:
			height: 0
			width: 0
			y: tensionLayer.y
		curve: Bezier.ease
		time: 0.3
	tension_tooltip.visible = false

angerHosLayer.onMouseOver ->
	angerHosLayer.opacity = 1
angerHosLayer.onMouseOut ->
	angerHosLayer.opacity = 0.6

depressionLayer.onMouseOver ->
	depressionLayer.opacity = 1
depressionLayer.onMouseOut ->
	depressionLayer.opacity = 0.6

confusionLayer.onMouseOver ->
	confusionLayer.opacity = 1
confusionLayer.onMouseOut ->
	confusionLayer.opacity = 0.6

fatigueLayer.onMouseOver ->
	fatigueLayer.opacity = 1
fatigueLayer.onMouseOut ->
	fatigueLayer.opacity = 0.6


#############TIPS#######################
tips = new Layer
	width: 350
	height: 500
	parent: bounding_box
	x: bounding_box.width - 375
	# y: 50
	backgroundColor: "white"
	visible: false
	opacity: 0

tipheader = new Layer
	parent: tips
	backgroundColor: null
	html: "<b>Suggestions</b>"
	style: label2
	width: 300
	height: 20
	y: 190

tipheader.style.fontSize = "16pt"
tipheader.style.lineHeight = "20px"

tip1 = new Layer
	parent: tips
	width: 350
	height: 50
	y: 230
	backgroundColor: "null"
	html: "<b>1.</b>  Eliminate or minimize tedious work such as routine inspections so that more meaningful work can occur."
	style: label2
tip2 = new Layer
	parent: tips
	width: 350
	height: 50
	y: 300
	backgroundColor: "null"
	html: "<b>2.</b> Add padding to the mission schedule to allow time for rest and completing small tasks."
	style: label2
tip3 = new Layer
	parent: tips
	width: 350
	height: 50
	y: 370
	backgroundColor: "null"
	html: "<b>3.</b> Allow for astronaut input on task design. Test new and novel tasks with them on ground before attempting them in-situ."
	style: label2
tip4 = new Layer
	parent: tips
	width: 350
	height: 50
	y: 440
	backgroundColor: "null"
	html: "<b>4.</b> Allow multiple days for unpacking and adjustment when new crew arrive to the station or spacecraft."
	style: label2
tip5 = new Layer
	parent: tips
	width: 350
	height: 50
	y: 510
	backgroundColor: "null"
	html: "<b>5.</b> Schedule solo work activities and tasks for astronauts."
	style: label2

keytitle = new Layer
	parent: tips
	backgroundColor: null
	html: "<b>Effects of Interactions</b>"
	style: label2
	width: 300
	height: 20

keytitle.style.fontSize = "16pt"
keytitle.style.lineHeight = "20px"

key1 = new Layer
	width: 40
	height: 40
	parent: tips
	borderWidth: 2
	borderColor: "#253b56"
	borderStyle: "dashed"
	backgroundColor: "#66c2a5"
	y: 35
	x: 10

key1name = new Layer
	style: label2
	parent: tips
	width: 125
	height: 40
	backgroundColor: "null"
	x: 55
	y: 35
	html: "Work Pressure"
key1name.style.lineHeight = "40px"

key2 = new Layer
	width: 40
	height: 40
	parent: tips
	borderWidth: 2
	borderColor: "#253b56"
	borderStyle: "dashed"
	backgroundColor: "#fc8d62"
	y: 35
	x: 185

key2name = new Layer
	style: label2
	parent: tips
	width: 125
	height: 40
	backgroundColor: "null"
	x: 230
	y: 35
	html: "Task Orientation"


key3 = new Layer
	width: 40
	height: 40
	parent: tips
	borderWidth: 2
	borderColor: "#253b56"
	borderStyle: "dashed"
	backgroundColor: "#e78ac3"
	y: 100
	x: 10

key3name = new Layer
	style: label2
	parent: tips
	width: 125
	height: 40
	backgroundColor: "null"
	x: 55
	y: 100
	html: "Order & Organization"


key4 = new Layer
	width: 40
	height: 40
	parent: tips
	borderWidth: 2
	borderColor: "#253b56"
	borderStyle: "dashed"
	backgroundColor: "#a6d854"
	y: 100
	x: 185

key4name = new Layer
	style: label2
	parent: tips
	width: 125
	height: 40
	backgroundColor: "null"
	x: 230
	y: 100
	html: "Independence"
key4name.style.lineHeight = "40px"

#############TIPS#######################

tensionLayer.onClick ->
	#Remove tooltip
	tension_tooltip.animate
		properties:
			height: 0
			width: 0
			y: tensionLayer.y
		curve: Bezier.ease
		time: 0.3
	tension_tooltip.visible = false

	#Remove LAbels
	for i in emotion_Array
		i.animate
			properties:
				opacity: 0
			time: 0.3
			curve: Bezier.ease

	#Remove normal line
	normal_text.animate
		properties:
			opacity: 0
		time: 0.3
		curve: Bezier.ease
		
	normal_line.animate
		properties:
			opacity: 0
		time: 0.3
		curve: Bezier.ease

	#Remove bars
	for i in bar_array
		# if i isnt tensionLayer
		i.animate
			properties:
				opacity: 0
				# x: tensionLayer.x
				# height: 0
				# y: 550
			time: 0.3
			curve: Bezier.ease

	Utils.delay 0.3, ->
		for i in bar_array
			i.visible = false

	#Change x axis width
	x_axis.animate
		properties:
			width: 1000
		time: 0.3
		curve: Bezier.ease

	#Create new bars
	Utils.delay 0.3, ->
		header.animate
			properties:
				opacity: 0
			time: 0.3
		Utils.delay 0.3, ->
			header.html = "Tension-Anxiety vs Crew & Crew-Ground Interactions"

			header.animate
				properties:
					opacity: 1
				time: 0.3

		#Show tips
		tips.visible = true
		tips.animate
			properties:
				opacity: 1
			time: 0.3
			curve: Bezier.ease
		#create new labels
		for i in group_array
			group_section = new Layer
				name: i
				parent: bounding_box
				backgroundColor: "null"
				width: axis_width / 7
				height: 40
				x: x_counter_3
				y: x_axis.y + x_axis.height + 5
				html: i
				style: label1

			x_counter_3 = x_counter_3 + (axis_width / 7)

		#turn off bar visibility
		for i in bar_array
			i.visible = false

		x_counter_2 = 50
		for i in tension_Array
			index = (x_counter_2 - 50) / 200
			workvar = work_pressure_Array[index]
			taskvar = task_orientation_Array[index]
			ordervar = order_Array[index]
			independencevar = independence_Array[index]
			totalvars = workvar + taskvar + ordervar + independencevar

			bar = new Layer
				parent: bounding_box
				width: 200
				x: x_counter_2
				y: 550
				height: 0
				backgroundColor: null
			x_counter_2 = x_counter_2 + 200

			workbox = new Layer
				parent: bar
				height: 0
				width: bar.width
				y: bar.height
				backgroundColor: "#66c2a5"
			workArray.push(workbox)

			taskbox = new Layer
				parent: bar
				height: 0
				width: bar.width
				y: bar.height
				backgroundColor: "#fc8d62"
			taskArray.push(taskbox)

			orderbox = new Layer
				parent: bar
				height: 0
				width: bar.width
				y: bar.height
				backgroundColor: "#e78ac3"
			orderArray.push(orderbox)

			independencebox = new Layer
				parent: bar
				height: 0
				width: bar.width
				y: bar.height
				backgroundColor: "#a6d854"
			independenceArray.push(independencebox)

			bar.animate
				properties:
					y: 550 - (i * 50)
					height: i * 50
				time: 0.6
				curve: Bezier.ease

			workbox.animate
					height: (workvar / totalvars) * i * 50
				time: 0.2
				curve: Bezier.ease

			taskbox.animate
					height: (taskvar / totalvars) * i * 50
					y: (workvar / totalvars) * i * 50
				time: 0.2
				curve: Bezier.ease

			orderbox.animate
					height: (ordervar / totalvars) * i * 50
					y: [(taskvar / totalvars) + (workvar / totalvars)] * i * 50
				time: 0.2
				curve: Bezier.ease

			independencebox.animate
					height: (independencevar / totalvars) * i * 50
					y: [(taskvar / totalvars) + (workvar / totalvars) + (ordervar / totalvars)] * i * 50
				time: 0.2
				curve: Bezier.ease

			x_axis.bringtoFront

tip1.onMouseOver ->
	tip2.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	tip3.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	tip4.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	tip5.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease

	key2.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key2name.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key3.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key3name.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key4.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key4name.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease

	for i in independenceArray
		i.animate
			properties:
				opacity: 0.3
			time: 0.3
			curve: Bezier.ease
	for i in taskArray
		i.animate
			properties:
				opacity: 0.3
			time: 0.3
			curve: Bezier.ease
	for i in orderArray
		i.animate
			properties:
				opacity: 0.3
			time: 0.3
			curve: Bezier.ease
tip1.onMouseOut ->
	tip2.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	tip3.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	tip4.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	tip5.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease

	key2.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key2name.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key3.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key3name.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key4.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key4name.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	for i in independenceArray
		i.animate
			properties:
				opacity: 1
			time: 0.3
			curve: Bezier.ease
	for i in taskArray
		i.animate
			properties:
				opacity: 1
			time: 0.3
			curve: Bezier.ease
	for i in orderArray
		i.animate
			properties:
				opacity: 1
			time: 0.3
			curve: Bezier.ease

tip2.onMouseOver ->
	tip1.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	tip3.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	tip4.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	tip5.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key3.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key3name.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key4.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key4name.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	for i in independenceArray
		i.animate
			properties:
				opacity: 0.3
			time: 0.3
			curve: Bezier.ease
	for i in orderArray
		i.animate
			properties:
				opacity: 0.3
			time: 0.3
			curve: Bezier.ease
tip2.onMouseOut ->
	tip1.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	tip3.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	tip4.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	tip5.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease

	key3.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key3name.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key4.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key4name.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	for i in independenceArray
		i.animate
			properties:
				opacity: 1
			time: 0.3
			curve: Bezier.ease
	for i in orderArray
		i.animate
			properties:
				opacity: 1
			time: 0.3
			curve: Bezier.ease

tip3.onMouseOver ->
	tip2.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	tip1.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	tip4.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	tip5.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key1.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key1name.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key3.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key3name.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key4.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key4name.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	for i in independenceArray
		i.animate
			properties:
				opacity: 0.3
			time: 0.3
			curve: Bezier.ease
	for i in workArray
		i.animate
			properties:
				opacity: 0.3
			time: 0.3
			curve: Bezier.ease
	for i in orderArray
		i.animate
			properties:
				opacity: 0.3
			time: 0.3
			curve: Bezier.ease
tip3.onMouseOut ->
	tip2.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	tip1.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	tip4.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	tip5.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease

	key1.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key1name.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key3.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key3name.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key4.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key4name.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	for i in independenceArray
		i.animate
			properties:
				opacity: 1
			time: 0.3
			curve: Bezier.ease
	for i in workArray
		i.animate
			properties:
				opacity: 1
			time: 0.3
			curve: Bezier.ease
	for i in orderArray
		i.animate
			properties:
				opacity: 1
			time: 0.3
			curve: Bezier.ease

tip4.onMouseOver ->
	tip2.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	tip3.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	tip1.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	tip5.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key2.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key2name.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key1.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key1name.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key3.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key3name.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	for i in independenceArray
		i.animate
			properties:
				opacity: 0.3
			time: 0.3
			curve: Bezier.ease
	for i in taskArray
		i.animate
			properties:
				opacity: 0.3
			time: 0.3
			curve: Bezier.ease
	for i in workArray
		i.animate
			properties:
				opacity: 0.3
			time: 0.3
			curve: Bezier.ease
tip4.onMouseOut ->
	tip2.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	tip3.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	tip1.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	tip5.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease

	key2.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key2name.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key1.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key1name.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key3.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key3name.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	for i in independenceArray
		i.animate
			properties:
				opacity: 1
			time: 0.3
			curve: Bezier.ease
	for i in workArray
		i.animate
			properties:
				opacity: 1
			time: 0.3
			curve: Bezier.ease
	for i in orderArray
		i.animate
			properties:
				opacity: 1
			time: 0.3
			curve: Bezier.ease

tip5.onMouseOver ->
	tip2.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	tip3.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	tip4.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	tip1.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key2.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key2name.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key3.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key3name.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key1.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	key1name.animate
		properties:
			opacity: 0.3
		time: 0.3
		curve: Bezier.ease
	for i in workArray
		i.animate
			properties:
				opacity: 0.3
			time: 0.3
			curve: Bezier.ease
	for i in taskArray
		i.animate
			properties:
				opacity: 0.3
			time: 0.3
			curve: Bezier.ease
	for i in orderArray
		i.animate
			properties:
				opacity: 0.3
			time: 0.3
			curve: Bezier.ease
tip5.onMouseOut ->
	tip2.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	tip3.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	tip4.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	tip1.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease

	key2.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key2name.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key3.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key3name.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key1.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	key1name.animate
		properties:
			opacity: 1
		time: 0.3
		curve: Bezier.ease
	for i in workArray
		i.animate
			properties:
				opacity: 1
			time: 0.3
			curve: Bezier.ease
	for i in taskArray
		i.animate
			properties:
				opacity: 1
			time: 0.3
			curve: Bezier.ease
	for i in orderArray
		i.animate
			properties:
				opacity: 1
			time: 0.3
			curve: Bezier.ease
