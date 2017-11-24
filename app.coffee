#-----Global Variables-----#
#Set Device Type
if innerWidth == 2048 || innerWidth == 1536
  Framer.Device.deviceType = "fullscreen"

symptoms = ["Nausea", "Vomiting", "Pale skin", "Cold sweats", "Cold or Numb Hands", "Dizziness", "Headache", "Increased salivation", "Fatigue"]

#-----Styles-----#
header_style =
  "fontFamily" : "Nunito Black"
  "fontSize" : "32pt"
  "textAlign" : "center"
  "lineHeight" : "50px"
  "color" : "#ffffff"

s1 =
  "fontFamily" : "Nunito Light"
  "fontSize" : "16pt"
  "textAlign" : "center"
  # "lineHeight" : Screen.width / 4 + "px"
  "color" : "#253b56"

#-----Array-----#
# color_array = [{"left" : "#00c6ff"; "right" : "#0072ff"}, {"left" : "#ffe47a"; "right" : "#f7ff00"}, {"left" : "#64f38c" ; "right" : "#45b649"}, {"left" : "#ff00cc" ; "right" : "#333399"} ]

#-----Functions-----#
#Create Button
create_button = (layerName) ->
  layerName.width = 48 * 4
  layerName.height = 18 * 4
  layerName.borderRadius = 10
  layerName.backgroundColor = "white"
  layerName.style = s1
  layerName.style.lineHeight = (18 * 4) + "px"

#Generate Biometric Circle
bio_circle = (circleColor, dataText, XX, YY, parentLayer) ->
  bioBG = new Layer
    parent: parentLayer
    x: XX
    y: YY
    width: 100
    height: Screen.width / 4
    backgroundColor: "white"
    opacity: 0.6
    borderRadius: 10

  bioCircle = new Layer
    parent: parentLayer
    x: XX
    y: YY
    html: dataText
    style: s1
    width: 100
    height: Screen.width / 4
    backgroundColor: "null"
    borderRadius: 10
    borderWidth: 5
    borderColor: "grey"

#-----Layers-----#
#Background layer
BG = new BackgroundLayer
  width: Screen.width
  height: Screen.height
  # backgroundColor: "black"
  image: "images/debasish-bohidar-288818.jpg"

#Screen for MS detection
container1 = new Layer
  size: 0.9 * Screen.width
  x: Align.center()
  y: Align.center()
  # image: "images/debasish-bohidar-288818.jpg"
  backgroundColor: "#1994d7"

# header_1 = new Layer
#   html: "Hi! Are You Feeling OK?"
#   parent: container1
#   width: container1.width
#   height: 50
#   backgroundColor: null
#   style: header_style

yes_btn_1 = new Layer
  parent: container1
  x: 32
  y: container1.height - (18 * 4) - 32
  html: "Yes"
create_button(yes_btn_1)

no_btn_1 = new Layer
  parent: container1
  x: yes_btn_1.x + yes_btn_1.width + 16
  y: container1.height - (18 * 4) - 32
  html: "No"
create_button(no_btn_1)

#Symptoms Screen
container2 = new Layer
  # image: "images/debasish-bohidar-288818.jpg"
  size: 0.9 * Screen.width
  x: Align.center()
  y: Align.center()
  backgroundColor: "#1994d7"

for i in symptoms
  textButton = new TextLayer
    text: i
    style: s1
#BioMetrics Reading Screen

#Further Interventions Screen

#Video Selection

#-----Actions-----#
#flow
myFlow = new FlowComponent
myFlow.showNext(container1)

#Flow Action
yes_btn_1.onTap ->
  myFlow.showNext(container2)

no_btn_1.onTap ->
  myFlow.showNext(BG)
# bio_circle("#f21b3f", "130/80", 50, 75, container1)









































# #-----Global Variables-----#
# counter = 0
#
# cover = new BackgroundLayer
#   image: "images/ng-978.jpg"
#   width: Screen.width
#   height: (Screen.width / 4896) * 3264
#
# sickIcon = new Layer
#   image: "images/sickIcon.png"
#   parent: cover
#   width: 112
#   height: 112
#   x: 64
#   y: 64
#
# #-----Array-----#
# color_array = [{"left" : "#00c6ff"; "right" : "#0072ff"}, {"left" : "#ffe47a"; "right" : "#f7ff00"}, {"left" : "#64f38c" ; "right" : "#45b649"}, {"left" : "#ff00cc" ; "right" : "#333399"} ]
#
#
# #-----Functions-----#
# side_pulse_func = (dragLayer, timeT, start) ->
#   side_pulse = new Animation
#     layer: dragLayer
#     properties:
#       scale: 1.6
#       opacity: 0
#     time: timeT
#     curve: "linear"
#
#   side_unpulse = new Animation
#     layer: dragLayer
#     properties:
#       scale: 0
#     time: 0.1
#     curve: "linear"
#
#   side_pulse.start()
#
#   side_pulse.onAnimationEnd ->
#     Utils.delay 0.3, ->
#       dragLayer.scale = 0
#       dragLayer.opacity = 0.6
#       side_pulse.start()
#
#   if start is false
#     side_pulse.stop()
#
# side_to_side = (finger, bg, dragLayer)->
#   finger.on Events.Drag, (event) ->
#
#     if event.offsetTime >= 1000 & event.offsetTime < 2000
#       bg.animate
#         gradient:
#           start: color_array[1].left
#           stop: color_array[1].right
#         time: 0.1
#     else if event.offsetTime >= 2000 & event.offsetTime < 3000
#       bg.animate
#         gradient:
#           start: color_array[2].left
#           stop: color_array[2].right
#         time: 0.1
#     else if event.offsetTime >= 3000 & event.offsetTime < 4000
#       bg.animate
#         gradient:
#           start: color_array[0].left
#           stop: color_array[0].right
#         time: 0.1
#     else if event.offsetTime >= 4000 & event.offsetTime < 5000
#       bg.animate
#         gradient:
#           start: color_array[1].left
#           stop: color_array[1].right
#         time: 0.1
#     else if event.offsetTime >= 5000 & event.offsetTime < 6000
#       bg.animate
#         gradient:
#           start: color_array[2].left
#           stop: color_array[2].right
#         time: 0.1
#     else if event.offsetTime >= 7000
#       bg.animate
#         gradient:
#           start: color_array[3].left
#           stop: color_array[3].right
#         time: 0.1
#
#   finger.on "change:point", ->
#       DX = dragLayer.x
#       DY = dragLayer.y
#       bg.rotationZ = @point.x / 4
#       if @point.x >=DX & @point.x <= (DX + 60) & @point.y >= DY & @point.y <= (DY + (Screen.width / 5))
#         counter = counter + 1
#         Utils.delay 0.6, ->
#           if DX is -30
#             dragLayer.x = Screen.width - 30
#           else
#             dragLayer.x = -30
#           if DY >= (0.8 * Screen.height)
#             dragLayer.y = 0
#           else
#             dragLayer.y = DY + (Screen.height / 5)
#   finger.onDragEnd ->
#     dragLayer.x = -30
#     dragLayer.y = 0
#
# #create finger tip
# finger_tip = (finger, sub_finger)->
#   finger.draggable.enabled = true
#   finger.width = 50
#   finger.height = 65
#   finger.borderRadius = 65
#   finger.backgroundColor = "white"
#   sub_finger.parent = finger
#   sub_finger.backgroundColor = "white"
#   sub_finger.borderRadius = 65
#   sub_finger.width = finger.width
#   sub_finger.height = finger.height
#
# # chaser_pulse = (chaser) ->
# #   sub_chaser = new Layer
# #     parent: chaser
# #     backgroundColor: "yellow"
# #     borderRadius: 65
# #     width: chaser.width
# #     height: chaser.height
# #
# #   pulseStart = new Animation
# #     layer: sub_chaser
# #     properties:
# #       scale: 1.6
# #       opacity: 0
# #     curve: "linear"
# #     time: 1.5
# #
# #
# #   pulseStart.start()
# #   pulseStart.onAnimationEnd ->
# #     sub_chaser.scale = 1
# #     sub_chaser.opacity = 1
# #     pulseStart.start()
#
# finger_pulse = (finger, sub_finger) ->
#   XX = finger.x
#   YY = finger.y
#   pulseStart = new Animation
#     layer: sub_finger
#     properties:
#       scale: 1.6
#       opacity: 0
#     curve: "linear"
#     time: 0.9
#
#   finger.onTouchStart ->
#     pulseStart.start()
#     pulseStart.onAnimationEnd ->
#       sub_finger.scale = 1
#       sub_finger.opacity = 1
#       pulseStart.start()
#
#     # if @point.x > (chaser.x - 10) & @point.x < (chaser.x + 10) & @point.y > (chaser.y - 10) & @point.y < (chaser.y + 10)
#     #   print "success"
#     #   finger.animate
#     #     properties:
#     #       scale: 1.2
#     #     time: 0.3
#     #     curve: Bezier(0.25, 0.1, 0.25, 1)
#     #   chaser.animate
#     #     properties:
#     #       scale: 0
#     #     time: 0.3
#     #     curve: Bezier(0.25, 0.1, 0.25, 1)
#
#   finger.onDragEnd ->
#     circle.animate
#       gradient:
#           start: "#00c6ff"
#           end: "#0072ff"
#           angle: 90
#     pulseStart.stop()
#     sub_finger.scale = 1
#     sub_finger.opacity = 1
#     finger.animate
#       properties:
#         x: XX
#         y: YY
#       time: 0.3
#       curve: Bezier(0.25, 0.1, 0.25, 1)
#
# #-----Layers-----#
# circle = new Layer
#   visible: false
#   x: -0.5 * Screen.height
#   y: -0.5 * Screen.height
#   width: 3 * Screen.height
#   height: 3 * Screen.height
#   # opacity: 0
# circle.gradient =
#     start: "#00c6ff"
#     end: "#0072ff"
#     angle: 90
#
#
# # chaser_finger = new Layer
# #   width: 50
# #   height: 65
# #   backgroundColor: "yellow"
# #   borderRadius: 65
# #   x: Utils.randomNumber(100, 800)
# #   y: Utils.randomNumber(50, 400)
#
#
# middle_finger = new Layer
#   x: Screen.width / 2
#   y: 50
#   # scale: 0
#   visible: false
#
# middle_finger_bg = new Layer
#
# # pointer_finger = new Layer
# #   x: middle_finger.x - 100
# #   y: 100
# #
# # pointer_finger_bg = new Layer
#
# drag_here = new Layer
#   width: 60
#   x: -30
#   height: Screen.height / 5
#   borderRadius: Screen.height / 5
#   backgroundColor: "white"
#   opacity: 0.6
#   visible: false
#
# # slider = new SliderComponent
# #    width: 300
# #    height: 65
# #    x: Align.center
# #    y: 100
# #    backgroundColor: "#a6a6a6"
# # slider.fill.backgroundColor = "#ff0080"
# # slider.knob.size = 65
# # slider.knob.borderRadius = 65
# #-----Actions-----#
#
# sickIcon.onTap ->
#
#   #BackgroundLayer
#
#   #icon Animation
#
#   #circle animation
#   circle.opacity = 0
#   circle.visible = true
#   borderRadius: 100%
#   circle.animate
#     properties:
#       borderRadius: 0
#       opacity: 1
#     time: 0.3
#     curve: "linear"
#
#   #middle finger animation
#   Utils.delay 0.6, ->
#     middle_finger.opacity = 0
#     middle_finger.scale = 0
#     middle_finger.visible = true
#     middle_finger.animate
#       properties:
#         scale: 1
#         opacity: 0.6
#     Utils.delay 0.3, ->
#       side_pulse_func(middle_finger, 1.8)
#
# #On tap, set middle finger to 0
# middle_finger.onTap ->
#   if counter is 0
#     counter = 1
#     side_pulse_func(middle_finger, 1.8, false)
#     middle_finger.animate
#       properties:
#         opacity: 1
#         scale: 1
#       time: 0.3
#       curve: "linear"
#     #drag here animation
#     drag_here.visible = true
#     side_pulse_func(drag_here, 1.2)
#
#
# #Detech number of fingers on screen
# middle_finger.on Events.Drag, (event) ->
#     fingers_on_screen = event.fingers
#
#
#
# #Create fingers
# finger_tip(middle_finger, middle_finger_bg)
# # finger_tip(pointer_finger, pointer_finger_bg)
#
# #Pulse fingers
# finger_pulse(middle_finger, middle_finger_bg)
# # finger_pulse(pointer_finger, pointer_finger_bg)
#
# #back and forth
# # slider.onValueChange ->
# #
# #   if slider.value > 0.9
# #     slider.animateToValue(0, { curve: Spring })
# #     if circle.opacity < 1
# #       circle.opacity = circle.opacity + 0.1
# #     else if circle.opacity = 1
# #       slider.visible = false
# #       middle_finger.visible = true
# #       slider.animate
# #         properties:
# #           scale: 0
# #         time: 0.3
# #         curve: "linear"
# #       middle_finger.animate
# #         properties:
# #           scale: 1
# #         time: 0.3
# #         curve: "linear"
#
# #drag here animation
# #side_pulse_func(drag_here, 1.2)
#
# #side to side game
# side_to_side(middle_finger, circle, drag_here)
