var BG, bio_circle, container1, container2, create_button, header_style, i, j, len, myFlow, no_btn_1, s1, symptoms, textButton, yes_btn_1;

if (innerWidth === 2048 || innerWidth === 1536) {
  Framer.Device.deviceType = "fullscreen";
}

symptoms = ["Nausea", "Vomiting", "Pale skin", "Cold sweats", "Cold or Numb Hands", "Dizziness", "Headache", "Increased salivation", "Fatigue"];

header_style = {
  "fontFamily": "Nunito Black",
  "fontSize": "32pt",
  "textAlign": "center",
  "lineHeight": "50px",
  "color": "#ffffff"
};

s1 = {
  "fontFamily": "Nunito Light",
  "fontSize": "16pt",
  "textAlign": "center",
  "color": "#253b56"
};

create_button = function(layerName) {
  layerName.width = 48 * 4;
  layerName.height = 18 * 4;
  layerName.borderRadius = 10;
  layerName.backgroundColor = "white";
  layerName.style = s1;
  return layerName.style.lineHeight = (18 * 4) + "px";
};

bio_circle = function(circleColor, dataText, XX, YY, parentLayer) {
  var bioBG, bioCircle;
  bioBG = new Layer({
    parent: parentLayer,
    x: XX,
    y: YY,
    width: 100,
    height: Screen.width / 4,
    backgroundColor: "white",
    opacity: 0.6,
    borderRadius: 10
  });
  return bioCircle = new Layer({
    parent: parentLayer,
    x: XX,
    y: YY,
    html: dataText,
    style: s1,
    width: 100,
    height: Screen.width / 4,
    backgroundColor: "null",
    borderRadius: 10,
    borderWidth: 5,
    borderColor: "grey"
  });
};

BG = new BackgroundLayer({
  width: Screen.width,
  height: Screen.height,
  image: "images/debasish-bohidar-288818.jpg"
});

container1 = new Layer({
  size: 0.9 * Screen.width,
  x: Align.center(),
  y: Align.center(),
  backgroundColor: "#1994d7"
});

yes_btn_1 = new Layer({
  parent: container1,
  x: 32,
  y: container1.height - (18 * 4) - 32,
  html: "Yes"
});

create_button(yes_btn_1);

no_btn_1 = new Layer({
  parent: container1,
  x: yes_btn_1.x + yes_btn_1.width + 16,
  y: container1.height - (18 * 4) - 32,
  html: "No"
});

create_button(no_btn_1);

container2 = new Layer({
  size: 0.9 * Screen.width,
  x: Align.center(),
  y: Align.center(),
  backgroundColor: "#1994d7"
});

for (j = 0, len = symptoms.length; j < len; j++) {
  i = symptoms[j];
  textButton = new Layer({
    text: i,
    style: s1
  });
}

myFlow = new FlowComponent;

myFlow.showNext(container1);

yes_btn_1.onTap(function() {
  return myFlow.showNext(container2);
});

no_btn_1.onTap(function() {
  return myFlow.showNext(BG);
});
