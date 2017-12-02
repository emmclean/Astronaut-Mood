#-----Global Variables-----#
#health vars
heart_rate_num = 147

blood_press_num = 140

blood_press_denom = 80

temp_num = 97.9

#Set Device Type
# if innerWidth == 2048 || innerWidth == 1536
#   Framer.Device.deviceType = "fullscreen"

symptoms = ["Nausea", "Vomiting", "Pale skin", "Cold sweats", "Cold or Numb Hands", "Dizziness", "Headache", "Increased salivation", "Fatigue"]

#-----Styles-----#
header_style =
  "fontFamily" : "Montserrat"
  "fontSize" : "64pt"
  "textAlign" : "center"
  "lineHeight" : (Screen.width / 6) + "px"
  "color" : "#ffffff"

h3 =
  "fontFamily" : "Montserrat"
  "fontSize" : "24pt"
  "textAlign" : "center"
  "color" : "#fff"
  "lineHeight" : "32px"
  "color" : "#fff"

s3 =
  "fontFamily" : "Montserrat"
  "fontSize" : "18pt"
  "textAlign" : "center"
  "lineHeight" : "26px"
  "color" : "#ffffff"

s1 =
  "fontFamily" : "Montserrat"
  "fontSize" : "24pt"
  "textAlign" : "center"
  "lineHeight" : Screen.width / 16 + "px"
  "color" : "#253b56"

s2 =
  "fontFamily" : "Montserrat"
  "fontSize" : "32pt"
  "textAlign" : "center"
  "lineHeight" : "40px"
  "color" : "#ffffff"

bio_s1 =
  "fontFamily" : "Montserrat"
  "fontSize" : "32pt"
  "textAlign" : "center"
  "lineHeight" : "42px"
  "padding-top" : (Screen.width / 16) + "px"
  "color" : "#ffffff"

bio_s2 =
  "fontFamily" : "Montserrat"
  "fontSize" : "20pt"
  "textAlign" : "center"
  "lineHeight" : "28px"
  "color" : "#ffffff"

#-----Functions-----#
#create container layer
creater_container = (layerName) ->
  layerName.x = Align.center
  layerName.y = Align.center
  layerName.width = Screen.width
  layerName.height = Screen.height
  layerName.backgroundColor = "#253b46"

#Create header container
create_header = (layerName) ->
  layerName.width = Screen.width
  layerName.height = Screen.height / 3
  layerName.backgroundColor = null
  layerName.style = header_style

#create content box
create_content = (layerName) ->
    layerName.width = 0.8 * Screen.width#(184 * 3) + 32
    layerName.height = Screen.height / 3#184
    layerName.x = Align.center
    layerName.y = Align.center
    layerName.backgroundColor = null

#Create Button
create_bottom = (layerName) ->
  layerName.width = Screen.width
  layerName.height = Screen.height / 3
  layerName.backgroundColor = null
  layerName.y = Screen.height * (2 / 3)

create_button = (layerName, WW) ->
  if !WW
    WW = Screen.width / 6
  layerName.width = WW
  layerName.height = Screen.width / 16
  layerName.borderRadius = 10
  layerName.backgroundColor = "white"
  layerName.style = s1

  layerName.onTouchStart ->
    layerName.backgroundColor = "#19b7d7"
    layerName.style.color = "white"
  layerName.onTouchEnd ->
    layerName.backgroundColor = "white"
    layerName.style.color = "black"

#-----Layers-----#

#create container layers
container1 = new Layer
container2 = new Layer
container3 = new Layer
creater_container(container1)
creater_container(container2)
creater_container(container3)

#Container 1 Header
header_1 = new Layer
  html: "Are You Feeling OK?"
  parent: container1

create_header(header_1)

A1 = new Layer
  parent: header_1
  width: 180
  height: 180
  image: "images/chair2.png"
  x: 16
  y: 16

A1_sub = new Layer
  parent: header_1
  width: 180
  height: 60
  x: 16
  y: A1.height + 16
  html: "A1"
  style: s1
  backgroundColor: "null"
A1_sub.style.lineHeight = "60px"
A1_sub.style.color = "#19b7d7"

arrow = new Layer
  parent: header
  image: "images/arrow.png"
  y: 16
  x: A1.width + 24
  width: 180
  height: 180
  
A2 = new Layer
  parent: header_1
  x: Screen.width - 196
  width: 180
  height: 180
  image: "images/chair.png"
  y: 16

A2_sub = new Layer
  parent: header_1
  width: 180
  height: 60
  x: Screen.width - 196
  y: A1.height + 16
  html: "A2"
  style: s1
  backgroundColor: "null"
A2_sub.style.lineHeight = "60px"
A2_sub.style.color = "white"


subheader_1 = new Layer
  html: "We detected the following biometrics which indicate you might be feeling motion sick"
  parent: header_1
  width: header_1.width * 0.7
  height: 50
  y: (header_1.height / 2) + 16
  x: Align.center
  backgroundColor: null
  style: s2

#Container 1 Content
bio_markers_container = new Layer
  parent: container1

create_content(bio_markers_container)

heart_rate = new Layer
  parent: bio_markers_container
  height: bio_markers_container.height
  width: bio_markers_container.height
  borderRadius: bio_markers_container.height
  borderWidth: 4
  borderColor: "red"
  backgroundColor: null
  html: "<b>Heart Rate</b></br>" + heart_rate_num + " bpm"
  style: bio_s1

heart_at_start = new Layer
  parent: heart_rate
  width: 0.75 * heart_rate.width
  height: 32
  y: (bio_markers_container.height / 2) + 20
  x: Align.center
  backgroundColor: null
  html: "Takeoff: 84 bpm"
  style: bio_s2

blood_press = new Layer
  parent: bio_markers_container
  height: bio_markers_container.height
  width: bio_markers_container.height
  x: Align.center
  borderRadius: bio_markers_container.height
  borderWidth: 4
  borderColor: "orange"
  backgroundColor: null
  html: "<b>Blood Pressure</b></br>" + blood_press_num + " / " + blood_press_denom
  style: bio_s1

press_at_start = new Layer
  parent: blood_press
  width: 0.75 * heart_rate.width
  height: 32
  y: (bio_markers_container.height / 2) + 20
  x: Align.center
  backgroundColor: null
  html: "Takeoff: 100/60"
  style: bio_s2

skin_temp = new Layer
  parent: bio_markers_container
  height: bio_markers_container.height
  width: bio_markers_container.height
  x: Align.right
  borderRadius: bio_markers_container.height
  borderWidth: 4
  borderColor: "teal"
  backgroundColor: null
  html: "<b>Temperature</b></br>" +  temp_num + "F"
  style: bio_s1

temp_at_start = new Layer
  parent: skin_temp
  width: 0.75 * heart_rate.width
  height: 32
  y: (bio_markers_container.height / 2) + 20
  x: Align.center
  backgroundColor: null
  html: "Takeoff: 98.6F"
  style: bio_s2

button_container = new Layer
  parent: container1

create_bottom(button_container)

yes_btn_1 = new Layer
  parent: button_container
  html: "I Feel Unwell"
  x: (button_container.width / 2) - 8 - (Screen.width / 6)
  y: Align.center
create_button(yes_btn_1)

no_btn_1 = new Layer
  parent: button_container
  html: "I'm Ok"
  x: (button_container.width / 2) + 8
  y: Align.center
create_button(no_btn_1)


#Steps we will run them through

header2 = new Layer
  parent: container2
  html: "Follow These Steps to Wellness"

create_header(header2)

instructions = new Layer
  parent: container2

create_content(instructions)


rescue = new Layer
  parent: instructions
  width: instructions.height
  height: instructions.height
  backgroundColor: null

palm_down = new Layer
  width: rescue.width * (2/3)
  height: (rescue.width / 700) * 272 * (2/3)
  image: "images/palm_down.png"
  parent: rescue

p6_side = new Layer
  width: rescue.width * (5 / 12)
  height: (rescue.width / 952) * 618 * (5 / 12)
  y: palm_down.height + 4
  image: "images/side_view_p6.png"
  parent: rescue

rescue_text = new Layer
  parent: rescue
  width: instructions.height
  height: (instructions.height / 3) + 40
  y: Align.bottom
  style: h3
  backgroundColor: null
  html: "Rescue from Nausea"
rescue_text.style.fontSize = "40pt"

rescue_text_2 = new Layer
  parent: rescue
  width: instructions.height
  height: (instructions.height / 3)
  y: Align.bottom
  style: s3
  backgroundColor: null
  html: "Putting pressure on the P6 accupressure point (median line of the underside of the wrist) is shown to reduce the feeling of nausea in up to 60% of patients."

up_down = new Animation palm_down,
  y: 20
  time: 0.4
  curve: "ease-in-out"

down_up = new Animation palm_down,
  y: 0
  time: 0.6
  curve: "ease-in-out"

up_down.start()
up_down.onAnimationEnd ->
  down_up.start()
down_up.onAnimationEnd ->
  up_down.start()

relief = new Layer
  parent: instructions
  width: instructions.height
  height: instructions.height
  x: Align.center
  backgroundColor: null

horizon_line_2 = new Layer
  parent: relief
  width: (5 / 6) * relief.width
  height: 1
  x: (1 / 12) * relief.width
  y: (1 / 3) * relief.width
  backgroundColor: "null"
  borderWidth: 1
  borderColor: "white"
  borderStyle: "dashed"

horizon_line = new Layer
  parent: relief
  width: (5 / 6) * relief.width
  height: 1
  x: (1 / 12) * relief.width
  y: (1 / 3) * relief.width
  backgroundColor: "null"
  borderWidth: 1
  borderColor: "white"

pitch = new Animation horizon_line,
  time: 0.6
  rotationZ: 12
  scale: 1

unpitch = new Animation horizon_line,
  time: 0.6
  rotationZ: 0
  scale: 0.9

pitch.start()
pitch.onAnimationEnd ->
  unpitch.start()
unpitch.onAnimationEnd ->
  pitch.start()

relief_text = new Layer
  parent: relief
  width: instructions.height
  height: (instructions.height / 3) + 40
  y: Align.bottom
  style: h3
  backgroundColor: null
  html: "Relief of Symptoms"

relief_text_2 = new Layer
  parent: relief
  width: instructions.height
  height: (instructions.height / 3)
  y: Align.bottom
  style: s3
  backgroundColor: null
  html: "Having visual input that confirms the motion you are feeling will help prevent motion sickness from onsetting again."


relax = new Layer
  parent: instructions
  width: instructions.height
  height: instructions.height
  x: Align.right
  backgroundColor: null

movie_gradient = new Gradient
    start: "#000"
    end: "#fff"
    angle: 45

movie_gradient_2 = new Gradient
    start: "#000"
    end: "#fff"
    angle: 135

movie_gradient_3 = new Gradient
    start: "#000"
    end: "#fff"
    angle: 225

movie_gradient_4 = new Gradient
    start: "#000"
    end: "#fff"
    angle: 315

movie_line = new Layer
  parent: relax
  width: (2 / 3) * relax.width
  height: 1
  x: Align.center
  y: (1 / 3) * relax.width
  backgroundColor: "null"
  borderColor: "white"
  borderWidth: 1

movie_screen = new Layer
  parent: relax
  x: Align.center()
  width: (8 / 30) * relax.width
  height: (45 / 300) * relax.width
  y: ((1 / 3) * relax.width) - ((45 / 600) * relax.width)
  backgroundColor: "black"
  borderColor: "white"
  borderWidth: 1

msA1 = new Animation movie_screen,
  gradient: movie_gradient
  time: 1

msA2 = new Animation movie_screen,
  gradient: movie_gradient_2
  time: 1

msA3 = new Animation movie_screen,
  gradient: movie_gradient_3
  time: 1

msA4 = new Animation movie_screen,
  gradient: movie_gradient_4
  time: 1

msA1.start()
msA1.onAnimationEnd ->
  msA2.start()
msA2.onAnimationEnd ->
  msA3.start()
msA3.onAnimationEnd ->
  msA4.start()
msA4.onAnimationEnd ->
  msA1.start()


relax_text = new Layer
  parent: relax
  width: instructions.height
  height: (instructions.height / 3) + 40
  y: Align.bottom
  style: h3
  backgroundColor: null
  html: "Relax in Flight"

relax_text_2 = new Layer
  parent: relax
  width: instructions.height
  height: (instructions.height / 3)
  y: Align.bottom
  style: s3
  backgroundColor: null
  html: "Continue reading or watching your movie on the immersive contoured screens while the horizon passes by in the background."

button_container_2 = new Layer
  parent: container2
create_bottom(button_container_2)

got_it_btn = new Layer
  parent: button_container_2
  x: Align.center
  y: Align.center
  html: "Got It"
create_button(got_it_btn)



#BioMetrics Reading Screen

header3 = new Layer
  parent: container3
  html: "Press Down on the Hand"

create_header(header3)

#Create Hand
hand = new Layer
  parent: container3
  width: container3.width * (2 / 3)
  height: (540.5009 / (container3.width * (2 / 3))) * 640.30402
  x: Align.center
  y: container3.height / 3
  backgroundColor: "null"
  html:'<svg viewBox="0 0 470.12 542.89"><defs><linearGradient id="linear" x1="50%" y1="0%" x2="50%" y2="100%" ><stop offset="0%" stop-color="#7A5FFF"><animate attributeName="stop-color" values="#7A5FFF; #01FF89; #7A5FFF" dur="4s" repeatCount="indefinite"></animate></stop><stop offset="100%" stop-color="#01FF89"><animate attributeName="stop-color" values="#01FF89; #7A5FFF; #01FF89" dur="4s" repeatCount="indefinite"></animate></stop>></linearGradient></defs><title>Asset 1</title><g id="Layer_2" data-name="Layer 2"><g id="Layer_1-2" data-name="Layer 1"><path id="hand" class="cls-1" d="M233.66,143.62l0,.21-.09.47-.09.34v.09l0,.08v0l0,0,0-.09v0l0-.08v-.17l.09-.21,0-.17ZM129.75,81.1l-.09-1.41-.13-1.32,0-1.32,0-1.24,0-1.28,0-1.19.22-2.34.44-2.26.31-1.11.26-1,.39-1.06.39-1,.44-1,.44-.89,1.14-1.83.61-.89.61-.81.74-.85.7-.77.79-.77.79-.68.92-.73.87-.64,1.92-1.23,2.1-1.15,1.14-.55,1.09-.47,9.53-.64,1.71.38,1.79.47,1.71.51.74.25.61.3,1.09.51.39.25.31.3,1,.68,2.45,3.24.87,2.17.92,2.39.39,1.19.35,1.15.35,1.06.26,1,.31.94.26.9.26.81.17.77.26.68.17.64.17.55.13.51.17.43.13.38.09.3,0,.26.79,2.21.61,2.26.52,2.3.31,2.34.44.09.13.51.13.64.17.68.13.77.22.77.22.85.26.9.22,1,.35,1,.31,1.11.35,1.11.35,1.23.44,1.24.39,1.32.48,1.36.44,1.45,1,2.81,1,2.77,1,2.6.92,2.56,2.89,10.18,0,1.32.26,1.06.26,1.32.17.72.13.81.35,1.79.44,1.92.26,1,.22,1.15.52,2.39.52,2.64.35,1.32.31,1.45.7,3,.39,1.53.35,1.66.39,1.66.35,1.79.44,1.75.39,1.87.87,3.88.48,2,.44,2.09,1,4.3,2.06,8.61,2,8.43,1,4.13,1,4.09,1.88,8.09,1.62,5.54,1.75,5.54,1,2.73,1,2.77,1,2.73.52,1.36.26.68.13.34.09.38,2.23,4.56.57.85.44.68.22.25.17.21.17.17.09.13.44.17h.13l.09,0,.17.08h.39l.09,0h.39l.09,0,.57-.09.52-.08.61-.17.61-.21.44-.21.39-.17.44-.26.13-.09.09,0,.17-.08.66-.43,3.24-6.9,1.84-8.09,1.62-8,1.44-8,1.22-7.88,1-7.88.83-7.79.66-7.75.44-7.67-.31-.51.87-20.57.48-6,.57-5.58.61-5.54.66-5.54.74-5.5.83-5.54.92-5.49,1-5.5,1-5.45.09-.13v-.13l0-.09v-.38l.09-.34,0-.09v-.3l.09-.47v-.51l.22-1.92.17-1.7.09-.76.09-.81.18-1.7.09-.51,0-.26v-.21l.09-1,.17-2,.26-2.3.13-1.19.09-1.24.17-1.32.09-.68,0-.34v-.3l.26-2.81.31-2.6.22-2.47.22-2.34.17-2.21.17-2.17.13-2,.13-1.92,0-1.79.31-4.81.35-4.77.39-4.77.48-4.73.44-2.39.52-2.34.35-1.19.39-1.11.87-2.21.66-1.32.7-1.24.74-1.19.74-1.06L253,8.52l.87-1,.92-.94.92-.85,1.05-.89,1-.77,1.09-.72L260,2.73l1.22-.64,1.27-.51,1.31-.51,1.31-.38,1.4-.38L267.9.09,269.26,0l1.31.09,1.31.13,1.27.34,1.27.43,1.22.6,2,1,1.75,1.15L281,5l1.44,1.32,1.36,1.41L285,9.2l1,1.58.87,1.75.79,1.75.35.9.26,1,.48,1.92.26,2.09.22,2.09V25.6l-.09,1.19-.31,2.43.52,6.56.39,6.56.35,6.47.22,6.43.13,3.15,0,3.19-.13,3.19L290.07,68l-.17,3.36-.17,3.54-.17,3.66-.26,3.88,0,1.87-.09,1.83L289.07,88,289,89.7l0,1.62-.09,1.62,0,1.53L288.72,96v1.36l0,1.36V100l-.09,1.23v3.75l0,.51v.77l0,.6-.09.81-.09.85-.09,1.06-.13,1.15-.17,1.36-.09,1.32,0,.6-.09.6-.09,1.06v.21l0,.26-.09.51V117l0,.43-.09.68v.77l0,.26v.13l.26,3.58.09,3.62-.09,3.62-.31,3.66-.09,1.49-.17,1.66-.09,1.7-.18,1.83-.09,1.87-.17,2-.13,2.09-.17,2.21-.09,2.26-.17,2.34-.13,2.43-.17,2.6-.09,2.6-.17,2.77-.17,2.81-.18,2.94-.09,2.9-.17,2.85-.09,2.77-.17,2.77-.09,2.64,0,1.28-.09,1.32-.09,2.51v.89l0,.34L284,190.9l0,1.87v1.41l0,.51,0,3.75.09,1.83,0,1.87.13,3.66.35,3.58.39,3.66.52,3.66.61,3.75.35,1.11,3.19,12.35,3.8,3.79.48,0,.31,0,.22-.13.13-.17.35-1,.31-1,.35-1.15.35-1.15.44-1.28.35-1.32.44-1.41.39-1.45.26-.81.22-.77.44-1.66.53-1.75.44-1.75.52-1.87.52-1.92.52-2,.52-2.09,4-15.55.44-.21,1.27-4.69,1.18-4.39,1.14-4.22,1-4,1-3.79.92-3.49.87-3.32.79-3.07.79-2.77.7-2.56.7-2.43.61-2.26.61-2.17.57-2,.53-1.83.48-1.66.48-1.58.44-1.4.39-1.28.35-1.06.35-1,.31-.81.26-.68.22-.47.48-.3.66-5.32.74-5.2.92-5.2,1-5.07,1.18-5.07,1.27-5,1.44-5,1.53-4.86,1.75-4.9,1.84-4.77,2-4.77,2.06-4.64L341,75.73l2.36-4.56,2.49-4.56,2.58-4.43.83-1.06.87-.89,1-.81,1-.72,1.09-.64,1.18-.55,1.23-.47,1.27-.38,1.71-.43,1.62-.25,1.62-.13h1.49l1.53.09,1.4.26,1.4.34,1.31.51,1.35.55,1.22.72,1.22.81,1.14,1L375,61.16l1,1.19,1,1.32.92,1.49.87,1.75.26,1.19.22,1.41.17,1.49.13,1.7.13,1.79,0,2,0,2.13,0,2.3v2.26l-.09,2.21-.09,2-.13,2-3.63,24.24-.39.25-.61,3.32-.61,3.24L374,122l-.13.77-.17.81-.26,1.49,0,.34-.09.38-.17.77-.09.68,0,.34-.09.38-.26,1.41-.44,2.68-.17,1.28-.22,1.28-.17,1.23-.09.6v.13l0,.17-.09.34-.39,3.07-.35,3-.13,1.45-.17,1.49-.26,2.94-.17,2.81,0,1.36-.09,1.41-.09,2.68v1.32l0,1.36-2,13.33-.26,1.79-.26,1.75-.26,1.66v.17l0,.21-.09.43-.17.85-.26,1.58-.26,1.53-.26,1.45-.13.68-.17.72-.09.64-.13.68-.26,1.28-.52,2.38-.18,1.11-.26,1.06-.09.47-.13.51-.26,1-.22,1.19-.31,1.36-.31,1.58-.35,1.79-.35,1.92-.39,2.13-.39,2.34-.48,2.56-.35,2.26-.17,1.06-.22,1.11-.35,2-.18.94-.09.47-.13.51-.35,1.75-.35,1.66-.35,1.53-.17.68-.09.34,0,.17-.09.21-.09.85-.09.81-.09.68-.09.6v.43l-.09.38v.26l-.09.21-.09.38-.09.47-.09.55-.13.64-.09.64-.09.81-.26,1.75-.17,1.79-.17,1.66-1.22,4L353.84,246l-1,4.22-.87,4.39-.7,4.39-.57,4.52-.44,4.56-.31,4.73.61.68,1.93.17,1.7-.51,1.71-1.11,1.62-1.06,3.19-2.3,1.57-1.24,1.49-1.24,1.49-1.32,1.4-1.28,2.84-2.81,2.67-2.9,1.31-1.53,1.22-1.53,2.41-3.19,2.1-1.58,2-1.66,1.88-1.7,1.79-1.75,1.79-1.87,1.62-1.92,1.62-2,1.44-2L402,224v-.6l5.86-6.86.57-.13,4.86-6,4.81-6.09,4.81-6.18,4.72-6.22.83-1.19.74-1.15.74-1.19.61-1.19.44-.6.35-.6.35-.64.26-.6.74-1.66.74-1.49.83-1.49.83-1.36.92-1.32,1-1.24,1-1.19,1.05-1.06,1.18-1.06,1.18-.94,1.27-.89,1.27-.81,1.4-.81,1.4-.64,1.49-.64,1.49-.47,1.66-.43L453,167l1.58,0,1.58.3,1.4.34,1.27.47,1.27.55,1.14.72,1.14.77,1,.9,1,1,.87,1.11,1.49,2.09,1.18,2.26.83,2,.57,2.09.52,2.39.18,1.19,0,1.23,0,2.39L470,190l-.18,1.24-.39,2.38-.7,2.39-.39,1.15-.48,1.19-1.18,2.39L462.25,209l-2.19,4.09-2.27,4-4.46,7.92-.53.94-.26.47-.31.51-1.14,2-2.27,3.83-2.19,3.75-2.27,3.71-4.46,7.24L437.71,251l-2.27,3.49L433.25,258,431,261.39l-.66,1.36-1.4,2-1.53,2-1.53,1.92-1.71,1.83-1.71,1.75-1.84,1.66-1.88,1.58-2,1.53-.48,1-.57,1L415,280l-.83.94-1.27,1.36-1.27,1.45-2.45,3L407,289.89l-2.1,3.28-1.84,3.36-1.66,3.53-1.49,3.62-.66,1.87-.66,2-.74,2.26-.17.55-.09.26v0l0,.09-.09.17-.17.51-.22.51,0,.17-.09.21-.17.38-.35.68-.31.6-.13.26-.17.3-.26.51-.09.21-.13.26-.31.94-.17.94,0,.21-.09.21-.13.38v.13l0,.09-.09.21-.17.34-.61,1.15-.7,1-.7.89-.83.77-.13.89-.17,1.06-.17,1.15-.26,1.32-.22,1.41-.31,1.53-.31,1.66-.35,1.79-.35,2-.13.85-.18.81-.13.77-.17.72-.09.64-.17.6-.09.55-.13.51v.3l0,.09-.09.38V342l0,.17-.09.3-.09.34v.09l0,0-1.14,6.86L383,367.45l-.44,2.43-.09.55-.13.6-.26,1.19-.18,1.11-.09.55-.13.6-.44,2.26-.35,2.13-.44,2.09-.35,2-.18,1-.22,1,0,.43-.09.47-.17.94-.35,1.79-.26,1.75v.17l0,.21-.09.43-.17.85-.26,1.58-.26,1.53-.22,1.45-.26,1.41-.35.34-1.44,10.05-.31.34v.17l0,.21-.09.43-.17.85-.35,1.7-.7,3.36L372.6,422l-.61,3.19-.7,3.15-.66,3.07-.7,3.07-.17.94-.26,1-.31.89-.39.94-.39.85-.48.89-.48.85-.57.89-1.4,2.3-1.31,2.3-1,2.3-.48,1.15-.44,1.19-.7,2.3-.53,2.34-.35,2.3-.18,2.39.09,2.3.09,1.19.13,1.19.44,2.3.26,1.19.31,1.19.79,2.3,1,2.39.57,1.19.61,1.19,1.31,2.39,2.36,5.45.66,1.41.61,1.36.57,1.24.48,1.19.48,1,.44,1,.39.81.35.81.31.77.09.85-.13.85-.39.89-.53.89-.79,1-1,1-1.27,1-1.4,1-1.66,1.06-1.84,1.06-2.1,1.15L359.35,506l-2.49,1.19-2.71,1.19-3,1.24-2.58,1-2.71,1-2.8,1-3,1.06-3,1-3.19,1.06-3.28,1.06L327.16,518l-3.5,1.06L320,520.18l-3.76,1.11-3.89,1.11-4,1.11-4.11,1.11L300,525.72l-4.37,1.19-3.76.94-3.76.94-1.84.43-.44.09-.48.13-1,.26-3.76.94-3.67.85-3.67.89-.87.17-.44.09-.48.13-1.84.43L266,534l-1.75.34-.87.17-.44.09-.48.13-3.54.77-3.5.72-3.54.77-.39,0-.44.09-.87.17-1.75.34-3.46.68-3.41.64-3.41.68-2.93.51-1.4.21-1.4.26-2.62.43-2.54.43-1.14.13-1.18.17-.52,0-.57.09-1.09.17-2,.26-1.88.26-.87,0-.83.09-.79,0-.74.09H215l-.61,0h-1.09l-.44-.09h-.39l-.61-.09-.22-.09-.17-.09,0-.09-.09,0-.09-.09-.26-1-.39-.85-.35-.77-.44-.81-.44-.89-.52-.89-1.09-2-.57-1.11-.66-1.11-.61-1.24-.7-1.28-.7-1.32-.79-1.36-.74-1.45-.83-1.49-.83-1.53-.92-1.58-6.52-11.93-1.57-.94-.79-.47-.83-.43L187.52,506l-3.1-1.87-1.49-1-1.53-.94-1.18-.51-.57-.26-.61-.21-.52-.3-.57-.26-1.09-.51-.48-.34-.52-.3-1-.6-1-.64-1-.64-.17-.21-.22-.17-.44-.34-.17-.21-.22-.17-.44-.34-.74-.77-.79-.77-.66-.85-.66-.85-.61-.89-.61-.89-2.89-2.77L156.56,481l-7.17-7.67-6.08-5.88-17.06-18.91-1.75-1.75-3.85-3.41-1.49-1.32-3.37-3.28-3.45-3.15-3.45-3.11-3.54-2.94-.39-.09-13-13.12-6.56-11.5-3.89-12.31-1.31-3.19-1.88-5.24-1-2.56-1.18-2.47-1.18-2.47-1.31-2.39-1.36-2.39-1.44-2.3-3-4.56-1.62-2.21-1.71-2.13-1.75-2.13-1.88-2-1.88-2-2.06-2,0-.17-.22-.26-.13-.21-.17-.26-.22-.3-.31-.3-.57-.85-.35-.47-.44-.47-.39-.6-.48-.6-.48-.64-.57-.64-1.09-1.58-.52-.77-.57-.68-.48-.72-.48-.64-.92-1.24L47.71,340l-.7-1.06-.57-1-.57-.81m0,0-.61-1.41-.7-1.32-.7-1.32L43,331.84l-.79-1.24-.92-1.15-1.92-2.17-4.33-4.56-2.19-2.26-2.27-2.17-4.5-4.3-4.68-4.22-4.68-4.13-4.85-4L7,297.77l-5-3.75-.48-.81L1,292.57.79,292,.7,291.8l-.13-.13L.39,291l-.17-.68-.13-.68L0,288.91v-1.66l.17-1.58.17-.81.22-.77.26-.76.31-.68.61-1.11.66-1,.7-.94.74-.81.83-.81.87-.64.92-.6,1-.47L11,274.72l3.5-1.32,3.59-1.11,3.5-.85,3.59-.68,1.79-.26,1.75-.13,3.59-.21,3.5,0,3.59.21,3.59.47,3.59.64,1.79.43,1.75.51,3.59,1.11,3.59,1.36,3.59,1.53,3.59,1.83,1.4.68,1.44.77,1.53.77,1.57.9,1.62.81.79.38.7.43,1.36.77,1.22.77,1.18.64.57.3.48.34.92.6.44.26.35.3,3.85,4.22,3.24,6,3.59,11,1.09,1.87.31.43.22.38.22.34.13.3.13.21.09.17,0,.13v.09l2.45,3.66,2.41,2.81,3.59,3.45,1.14,1.15,1.31,1.24,1.49,1.32,1.66,1.49.92.72,1,.77,2,1.66,2.19,1.66,2.36,1.83,3.15,2.26,3.24,2.3,2.71,1.83,7.08.21L134,338.4l2.23-2.13,2.23-2.21,2.06-2.26,2.06-2.34,1.88-2.43,1.88-2.51L148,322l0-.09,0-.09.13-.17.13-.17.13-.17.09-.13.13-.17.09-.13.17-.21.13-.17.17-.21.13-.17.74-1,.57-.77L151,318l.17-.26.17-.26.09-.17,1.44-2.3,1.22-2.3,1.09-2.39.48-1.24.39-1.19.83-2.51.61-2.56.48-2.64.31-2.64.48-5.45.31-5.41.22-5.45,0-5.37,0-5.45-.22-5.37-.31-5.37-.48-5.37-.52-5.41-.7-5.37-.83-5.37-1-5.37-1.09-5.37-1.22-5.37-1.36-5.37L150,211.39l-14.83-94.17-1.53-9-1.44-9-1.31-9-1.18-9"/></g></g></svg>'
hand.style['fill'] = "url(#linear)"
# hand.style['stroke-width'] = 10
# hand.style['fill'] = "none"

hand_grow = new Animation hand,
  scale: 1.01
  time: 4
  curve: "ease-in-out"

hand_shrink = new Animation hand,
  scale: 1
  time: 2
  curve: "ease-in-out"


#-----Actions-----#
#flow
myFlow = new FlowComponent
myFlow.showNext(container1)

#Flow Action
yes_btn_1.onTap ->
  myFlow.showNext(container2)

# continue_btn.onTap ->
#   myFlow.showNext(container2)

got_it_btn.onTap ->
  myFlow.showNext(container3)
#animate biometrics
stepper = 3
HR1 = ()->
  new_HR = Utils.randomNumber(130, 160)
  heartnum = Utils.round(new_HR, 0)
  heart_rate.html = "<b>Heart Rate</b></br>" + heartnum + " bpm"
Utils.delay 3, ->
  HR1()
  for i in [0...200]
    Utils.delay stepper, ->
      HR1()
    stepper = stepper + 3

stepper2 = 9
HR2 = ()->
  new_BP_num = Utils.randomNumber(120, 170)
  new_BP_den = Utils.randomNumber(70, 110)
  BPnum = Utils.round(new_BP_num, 0)
  BPdenom = Utils.round(new_BP_den, 0)
  blood_press.html = "<b>Blood Pressure</b></br>" + BPnum + " / " + BPdenom
Utils.delay 9, ->
  HR2()
  for i in [0...300]
    Utils.delay stepper2, ->
      HR2()
    stepper2 = stepper2 + 9

stepper3 = 60
HR3 = ()->
  new_temp = Utils.randomNumber(97, 98)
  tempnum = Utils.round(new_temp, 1)
  skin_temp.html = "<b>Temperature</b></br>" + tempnum + "F"
Utils.delay 30, ->
  HR3()
  for i in [0...40]
    Utils.delay stepper3, ->
      HR3()
    stepper3 = stepper3 + 60

#Animate hand and contaienr 3 gradient
blue = new Gradient
  start: "#05F"
  end: "#0DF"

purple = new Gradient
  start: "#ec6ead"
  end: "#3494e6"

green = new Gradient
  start: "#11998e"
  end: "#38ef7d"


blueAnimation = new Animation container3,
  gradient: blue
  time: 1.2
  curve: "ease-in-out"
purpleAnimation = new Animation container3,
  gradient: purple
  time: 1.2
  curve: "ease-in-out"
greenAnimation = new Animation container3,
  gradient: green
  time: 1.2
  curve: "ease-in-out"
blackAnimation = new Animation container3,
  gradient: null
  time: 1.2
  curve: "ease-in-out"

hand.onLongPressStart ->
  blueAnimation.start()
  blueAnimation.onAnimationEnd ->
    purpleAnimation.start()
  purpleAnimation.onAnimationEnd ->
    greenAnimation.start()
  greenAnimation.onAnimationEnd ->
    blueAnimation.start()
hand.onLongPressEnd ->
  blueAnimation.stop()
  purpleAnimation.stop()
  greenAnimation.stop()
  blackAnimation.start()
