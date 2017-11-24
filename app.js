var BG, bio_circle, container1, container2, continue_btn, create_button, header_style, myFlow, no_btn_1, s1, symptom_btn_1, symptom_btn_10, symptom_btn_2, symptom_btn_3, symptom_btn_4, symptom_btn_5, symptom_btn_6, symptom_btn_7, symptom_btn_8, symptom_btn_9, symptoms, yes_btn_1;

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

create_button = function(layerName, WW) {
  if (!WW) {
    WW = 48 * 4;
  }
  layerName.width = WW;
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

symptom_btn_1 = new Layer({
  style: s1,
  parent: container2,
  x: 32,
  y: 32,
  html: "Nausea"
});

create_button(symptom_btn_1, 48 * 3);

symptom_btn_2 = new Layer({
  style: s1,
  parent: container2,
  html: "Vomiting"
});

create_button(symptom_btn_2, 48 * 3);

if ((symptom_btn_1.width + symptom_btn_1.x + 16) < (Screen.width - symptom_btn_2.width - 16)) {
  symptom_btn_2.x = symptom_btn_1.width + symptom_btn_1.x + 16;
  symptom_btn_2.y = 32;
} else {
  symptom_btn_2.x = 32;
  symptom_btn_2.y = symptom_btn_1.y + symptom_btn_1.height + 16;
}

symptom_btn_3 = new Layer({
  style: s1,
  parent: container2,
  html: "Pale skin"
});

create_button(symptom_btn_3, 48 * 3);

if ((symptom_btn_2.width + symptom_btn_2.x + 16) < (Screen.width - symptom_btn_3.width - 16)) {
  symptom_btn_3.x = symptom_btn_2.width + symptom_btn_2.x + 16;
  symptom_btn_3.y = symptom_btn_2.y;
} else {
  symptom_btn_3.x = 32;
  symptom_btn_3.y = symptom_btn_2.y + symptom_btn_2.height + 16;
}

symptom_btn_4 = new Layer({
  style: s1,
  parent: container2,
  html: "Cold sweats"
});

create_button(symptom_btn_4, 48 * 3);

if ((symptom_btn_3.width + symptom_btn_3.x + 16) < (Screen.width - symptom_btn_4.width - 16)) {
  symptom_btn_4.x = symptom_btn_3.width + symptom_btn_3.x + 16;
  symptom_btn_4.y = symptom_btn_3.y;
} else {
  symptom_btn_4.x = 32;
  symptom_btn_4.y = symptom_btn_3.y + symptom_btn_3.height + 16;
}

symptom_btn_5 = new Layer({
  style: s1,
  parent: container2,
  html: "Cold or Numb Hands"
});

create_button(symptom_btn_5, 48 * 5);

if ((symptom_btn_4.width + symptom_btn_4.x + 16) < (Screen.width - symptom_btn_5.width - 16)) {
  symptom_btn_5.x = symptom_btn_4.width + symptom_btn_4.x + 16;
  symptom_btn_5.y = symptom_btn_4.y;
} else {
  symptom_btn_5.x = 32;
  symptom_btn_5.y = symptom_btn_4.y + symptom_btn_4.height + 16;
}

symptom_btn_6 = new Layer({
  style: s1,
  parent: container2,
  html: "Dizziness"
});

create_button(symptom_btn_6, 48 * 3);

if ((symptom_btn_5.width + symptom_btn_5.x + 16) < (Screen.width - symptom_btn_6.width - 16)) {
  symptom_btn_6.x = symptom_btn_5.width + symptom_btn_5.x + 16;
  symptom_btn_6.y = symptom_btn_5.y;
} else {
  symptom_btn_6.x = 32;
  symptom_btn_6.y = symptom_btn_5.y + symptom_btn_5.height + 16;
}

symptom_btn_7 = new Layer({
  style: s1,
  parent: container2,
  html: "Headache"
});

create_button(symptom_btn_7, 48 * 3);

if ((symptom_btn_6.width + symptom_btn_6.x + 16) < (Screen.width - symptom_btn_6.width - 16)) {
  symptom_btn_7.x = symptom_btn_6.width + symptom_btn_6.x + 16;
  symptom_btn_7.y = symptom_btn_6.y;
} else {
  symptom_btn_7.x = 32;
  symptom_btn_7.y = symptom_btn_6.y + symptom_btn_6.height + 16;
}

symptom_btn_8 = new Layer({
  style: s1,
  parent: container2,
  html: "Increased salivation"
});

create_button(symptom_btn_8, 48 * 5);

if ((symptom_btn_7.width + symptom_btn_7.x + 16) < (Screen.width - symptom_btn_8.width - 16)) {
  symptom_btn_8.x = symptom_btn_7.width + symptom_btn_7.x + 16;
  symptom_btn_8.y = symptom_btn_7.y;
} else {
  symptom_btn_8.x = 32;
  symptom_btn_8.y = symptom_btn_7.y + symptom_btn_7.height + 16;
}

symptom_btn_9 = new Layer({
  style: s1,
  parent: container2,
  html: "Dehydration"
});

create_button(symptom_btn_9, 48 * 3);

if ((symptom_btn_8.width + symptom_btn_8.x + 16) < (Screen.width - symptom_btn_9.width - 16)) {
  symptom_btn_9.x = symptom_btn_8.width + symptom_btn_8.x + 16;
  symptom_btn_9.y = symptom_btn_8.y;
} else {
  symptom_btn_9.x = 32;
  symptom_btn_9.y = symptom_btn_8.y + symptom_btn_8.height + 16;
}

symptom_btn_10 = new Layer({
  style: s1,
  parent: container2,
  html: "Fatigue"
});

create_button(symptom_btn_10, 48 * 3);

if ((symptom_btn_9.width + symptom_btn_9.x + 16) < (Screen.width - symptom_btn_10.width - 16)) {
  symptom_btn_10.x = symptom_btn_9.width + symptom_btn_9.x + 16;
  symptom_btn_10.y = symptom_btn_9.y;
} else {
  symptom_btn_10.x = 32;
  symptom_btn_10.y = symptom_btn_9.y + symptom_btn_9.height + 16;
}

continue_btn = new Layer({
  style: s1,
  parent: container2,
  html: "Continue",
  x: Align.center(),
  y: symptom_btn_10.y + symptom_btn_10.height + 48
});

create_button(continue_btn);

myFlow = new FlowComponent;

myFlow.showNext(container1);

yes_btn_1.onTap(function() {
  return myFlow.showNext(container2);
});

no_btn_1.onTap(function() {
  return myFlow.showNext(BG);
});
