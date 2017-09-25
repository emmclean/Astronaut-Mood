var angerAgroLayer, angerHosLayer, anger_agro_Array, anger_hos_Array, axis_height, axis_width, bar_array, bar_creator, bounding_box, confusionLayer, confusion_Array, depressionLayer, depression_Array, emotion_Array, emotion_labels, emotion_section, emotional_intense, fatigueLayer, fatigue_Array, group_array, header, headerstyle, i, independenceArray, independence_Array, k, key1, key1name, key2, key2name, key3, key3name, key4, key4name, keytitle, label1, label2, len, less_intense, more_intense, normal_line, normal_text, orderArray, order_Array, taskArray, task_orientation_Array, tensionLayer, tension_Array, tension_tooltip, tip1, tip2, tip3, tip4, tip5, tipheader, tips, tooltipStyle, vigorLayer, vigor_Array, vigor_tooltip, workArray, work_pressure_Array, x_axis, x_counter, x_counter_3, y_axis;

axis_height = 500;

axis_width = 1400;

x_counter = 51;

x_counter_3 = 51;

emotion_Array = [];

vigor_Array = [8.705, 7.63, 9.655, 7.535, 8.45];

anger_agro_Array = [2.16, 2.14, 3.57, 2.39, 3.59];

tension_Array = [4.11, 8.04, 4.97, 7.1, 10.7];

depression_Array = [2.16, 5.89, 3.4, 2.52, 8.6];

anger_hos_Array = [2.67, 5.63, 5.12, 3.26, 8.9];

confusion_Array = [3.26, 3.61, 2.93, 2.44, 7.1];

fatigue_Array = [3.63, 4.38, 4.19, 2.65, 9];

work_pressure_Array = [6.63, 4.06, 7.75, 5.38, 5.31];

task_orientation_Array = [7.94, 8.31, 7.43, 8.41, 7.07];

order_Array = [6.59, 7.43, 5.8, 7.27, 5.93];

independence_Array = [6.69, 6.2, 4.38, 6.42, 6.46];

group_array = ["ISS US", "ISS Russian", "Mir US", "Mir Russian", "Non-Astronaut"];

emotion_labels = ["Vigor-Activity", "Anger-Aggression", "Tension-Anxiety", "Depression-Dejection", "Anger-Hostility", "Confusion-Bewilderment", "Fatigue-Inertia"];

workArray = [];

taskArray = [];

orderArray = [];

independenceArray = [];

headerstyle = {
  "font-family": "Roboto Black",
  "font-size": "36pt",
  "text-align": "center",
  "line-height": "50px",
  "color": "#253b56"
};

label1 = {
  "font-family": "Roboto",
  "font-size": "12pt",
  "padding-left": "10px",
  "padding-right": "10px",
  "text-align": "center",
  "line-height": "40px",
  "color": "#253b56"
};

label2 = {
  "font-family": "Roboto",
  "font-size": "12pt",
  "padding-left": "10px",
  "padding-right": "10px",
  "text-align": "left",
  "line-height": "20px",
  "color": "#253b56"
};

tooltipStyle = {
  "font-family": "Roboto",
  "font-size": "10pt",
  "padding-left": "5px",
  "padding-right": "5px",
  "text-align": "center",
  "line-height": "30px",
  "color": "#253b56"
};

header = new Layer({
  width: Screen.width,
  height: 100,
  y: 32,
  backgroundColor: null,
  html: "Astronaut Mood Profile",
  style: headerstyle
});

bounding_box = new Layer({
  x: Align.center(),
  y: 164,
  width: 1450,
  height: 1000,
  backgroundColor: null
});

y_axis = new Layer({
  parent: bounding_box,
  width: 1,
  height: axis_height,
  x: 50,
  y: 50,
  backgroundColor: "black"
});

x_axis = new Layer({
  parent: bounding_box,
  width: axis_width,
  height: 1,
  x: 50,
  y: 50 + y_axis.height,
  backgroundColor: "black"
});

for (k = 0, len = emotion_labels.length; k < len; k++) {
  i = emotion_labels[k];
  emotion_section = new Layer({
    name: i,
    parent: bounding_box,
    backgroundColor: "null",
    width: axis_width / 7,
    height: 40,
    x: x_counter,
    y: x_axis.y + x_axis.height + 5,
    html: i,
    style: label1
  });
  emotion_Array.push(emotion_section);
  x_counter = x_counter + (axis_width / 7);
}

more_intense = new Layer({
  style: label1,
  parent: bounding_box,
  html: "<i>More Intense</i>",
  width: 200,
  height: 30,
  rotationZ: 270,
  x: -65,
  y: 135,
  backgroundColor: "null"
});

more_intense.style.textAlign = "right";

more_intense.style.lineHeight = "30px";

emotional_intense = new Layer({
  style: label1,
  parent: bounding_box,
  html: "<b>Emotional Intensity</b>",
  width: 200,
  height: 30,
  rotationZ: 270,
  x: -70,
  y: 285,
  backgroundColor: "null"
});

more_intense.style.textAlign = "right";

more_intense.style.lineHeight = "30px";

less_intense = new Layer({
  parent: bounding_box,
  style: label1,
  html: "<i>Less Intense</i>",
  width: 200,
  height: 30,
  rotationZ: 270,
  x: -65,
  y: 435,
  backgroundColor: "null"
});

less_intense.style.textAlign = "left";

less_intense.style.lineHeight = "30px";

bar_array = [];

vigorLayer = new Layer({
  parent: bounding_box
});

angerAgroLayer = new Layer({
  parent: bounding_box
});

tensionLayer = new Layer({
  parent: bounding_box
});

depressionLayer = new Layer({
  parent: bounding_box
});

angerHosLayer = new Layer({
  parent: bounding_box
});

confusionLayer = new Layer({
  parent: bounding_box
});

fatigueLayer = new Layer({
  parent: bounding_box
});

bar_creator = function(array, layername, xx, color) {
  var j, l, len1, len2, line, m, max, min;
  min = 10;
  max = 0;
  for (l = 0, len1 = array.length; l < len1; l++) {
    i = array[l];
    if (i < min) {
      min = i;
    }
    if (i > max) {
      max = i;
    }
  }
  layername.y = 50 + axis_height - (max * 50);
  layername.x = xx;
  layername.height = 50 * (max - min);
  layername.backgroundColor = color;
  for (m = 0, len2 = array.length; m < len2; m++) {
    j = array[m];
    line = new Layer({
      width: 200,
      height: 1,
      backgroundColor: "black",
      parent: layername,
      y: (max - j) * 50,
      opacity: 1
    });
  }
  return bar_array.push(layername);
};

bar_creator(vigor_Array, vigorLayer, 50, "grey");

bar_creator(anger_agro_Array, angerAgroLayer, 250, "#cd1f36");

bar_creator(tension_Array, tensionLayer, 450, "#a1a742");

bar_creator(depression_Array, depressionLayer, 650, "#009989");

bar_creator(anger_hos_Array, angerHosLayer, 850, "#f15a34");

bar_creator(fatigue_Array, fatigueLayer, 1050, "#902e57");

bar_creator(confusion_Array, confusionLayer, 1250, "#ecb824");

normal_line = new Layer({
  parent: bounding_box,
  x: y_axis.x + y_axis.width,
  y: 550 - (50 * 4.84),
  height: 2,
  width: x_axis.width - y_axis.width,
  backgroundColor: "null",
  borderColor: "black",
  borderStyle: "dashed",
  borderWidth: 2
});

normal_text = new Layer({
  style: label2,
  parent: bounding_box,
  x: normal_line.x + 5,
  y: normal_line.y + 7,
  width: 300,
  height: 20,
  backgroundColor: null,
  html: "<i>Normalized Mood Intensity (4.88)</i>"
});

normal_text.style.color = "#a1a1a1";

vigor_tooltip = new Layer({
  parent: bounding_box,
  x: vigorLayer.x + vigorLayer.width,
  y: vigorLayer.y - 15,
  height: 0,
  width: 0,
  borderRadius: 150,
  style: tooltipStyle
});

vigorLayer.onMouseOver(function() {
  angerAgroLayer.opacity = 0.6;
  tensionLayer.opacity = 0.6;
  depressionLayer.opacity = 0.6;
  angerHosLayer.opacity = 0.6;
  confusionLayer.opacity = 0.6;
  fatigueLayer.opacity = 0.6;
  vigor_tooltip.html = "Mir U.S. (9.67)";
  vigor_tooltip.animate({
    properties: {
      height: 30,
      width: 175,
      y: vigorLayer.y - 15
    },
    curve: Bezier.ease,
    time: 0.3
  });
  Utils.delay(0.9, function() {
    vigor_tooltip.html = "ISS U.S. (8.71)";
    return vigor_tooltip.animate({
      properties: {
        y: vigorLayer.y + 34
      },
      curve: Bezier.ease,
      time: 0.3
    });
  });
  Utils.delay(1.8, function() {
    vigor_tooltip.html = "Non-Astronauts (8.45)";
    return vigor_tooltip.animate({
      properties: {
        y: vigorLayer.y + 48
      },
      curve: Bezier.ease,
      time: 0.3
    });
  });
  Utils.delay(2.7, function() {
    vigor_tooltip.html = "ISS Russian (7.64)";
    return vigor_tooltip.animate({
      properties: {
        y: vigorLayer.y + 80
      },
      curve: Bezier.ease,
      time: 0.3
    });
  });
  return Utils.delay(3.6, function() {
    vigor_tooltip.html = "Mir Russian (7.53)";
    return vigor_tooltip.animate({
      properties: {
        y: vigorLayer.y + vigorLayer.height - 15
      },
      curve: Bezier.ease,
      time: 0.3
    });
  });
});

vigorLayer.onMouseOut(function() {
  angerAgroLayer.opacity = 1;
  tensionLayer.opacity = 1;
  depressionLayer.opacity = 1;
  angerHosLayer.opacity = 1;
  confusionLayer.opacity = 1;
  fatigueLayer.opacity = 1;
  vigor_tooltip.animate({
    properties: {
      height: 0,
      width: 0,
      y: vigorLayer.y
    },
    curve: Bezier.ease,
    time: 0.3
  });
  return vigor_tooltip.visible = false;
});

angerAgroLayer.onMouseOver(function() {
  vigorLayer.opacity = 0.6;
  tensionLayer.opacity = 0.6;
  depressionLayer.opacity = 0.6;
  angerHosLayer.opacity = 0.6;
  confusionLayer.opacity = 0.6;
  return fatigueLayer.opacity = 0.6;
});

angerAgroLayer.onMouseOut(function() {
  vigorLayer.opacity = 1;
  tensionLayer.opacity = 1;
  depressionLayer.opacity = 1;
  angerHosLayer.opacity = 1;
  confusionLayer.opacity = 1;
  return fatigueLayer.opacity = 1;
});

tension_tooltip = new Layer({
  parent: bounding_box,
  x: tensionLayer.x + tensionLayer.width,
  y: 132 - 15,
  height: 0,
  width: 0,
  borderRadius: 150,
  style: tooltipStyle
});

tensionLayer.onMouseOver(function() {
  vigorLayer.opacity = 0.6;
  angerAgroLayer.opacity = 0.6;
  depressionLayer.opacity = 0.6;
  angerHosLayer.opacity = 0.6;
  confusionLayer.opacity = 0.6;
  fatigueLayer.opacity = 0.6;
  tension_tooltip.html = "ISS Russian (8.04)";
  return tension_tooltip.animate({
    properties: {
      height: 30,
      width: 175,
      y: 132
    },
    curve: Bezier.ease,
    time: 0.3
  });
});

tensionLayer.onMouseOut(function() {
  vigorLayer.opacity = 1;
  angerAgroLayer.opacity = 1;
  depressionLayer.opacity = 1;
  angerHosLayer.opacity = 1;
  confusionLayer.opacity = 1;
  fatigueLayer.opacity = 1;
  tension_tooltip.animate({
    properties: {
      height: 0,
      width: 0,
      y: tensionLayer.y
    },
    curve: Bezier.ease,
    time: 0.3
  });
  return tension_tooltip.visible = false;
});

angerHosLayer.onMouseOver(function() {
  return angerHosLayer.opacity = 1;
});

angerHosLayer.onMouseOut(function() {
  return angerHosLayer.opacity = 0.6;
});

depressionLayer.onMouseOver(function() {
  return depressionLayer.opacity = 1;
});

depressionLayer.onMouseOut(function() {
  return depressionLayer.opacity = 0.6;
});

confusionLayer.onMouseOver(function() {
  return confusionLayer.opacity = 1;
});

confusionLayer.onMouseOut(function() {
  return confusionLayer.opacity = 0.6;
});

fatigueLayer.onMouseOver(function() {
  return fatigueLayer.opacity = 1;
});

fatigueLayer.onMouseOut(function() {
  return fatigueLayer.opacity = 0.6;
});

tips = new Layer({
  width: 350,
  height: 500,
  parent: bounding_box,
  x: bounding_box.width - 375,
  backgroundColor: "white",
  visible: false,
  opacity: 0
});

tipheader = new Layer({
  parent: tips,
  backgroundColor: null,
  html: "<b>Suggestions</b>",
  style: label2,
  width: 300,
  height: 20,
  y: 190
});

tipheader.style.fontSize = "16pt";

tipheader.style.lineHeight = "20px";

tip1 = new Layer({
  parent: tips,
  width: 350,
  height: 50,
  y: 230,
  backgroundColor: "null",
  html: "<b>1.</b>  Eliminate or minimize tedious work such as routine inspections so that more meaningful work can occur.",
  style: label2
});

tip2 = new Layer({
  parent: tips,
  width: 350,
  height: 50,
  y: 300,
  backgroundColor: "null",
  html: "<b>2.</b> Add padding to the mission schedule to allow time for rest and completing small tasks.",
  style: label2
});

tip3 = new Layer({
  parent: tips,
  width: 350,
  height: 50,
  y: 370,
  backgroundColor: "null",
  html: "<b>3.</b> Allow for astronaut input on task design. Test new and novel tasks with them on ground before attempting them in-situ.",
  style: label2
});

tip4 = new Layer({
  parent: tips,
  width: 350,
  height: 50,
  y: 440,
  backgroundColor: "null",
  html: "<b>4.</b> Allow multiple days for unpacking and adjustment when new crew arrive to the station or spacecraft.",
  style: label2
});

tip5 = new Layer({
  parent: tips,
  width: 350,
  height: 50,
  y: 510,
  backgroundColor: "null",
  html: "<b>5.</b> Schedule solo work activities and tasks for astronauts.",
  style: label2
});

keytitle = new Layer({
  parent: tips,
  backgroundColor: null,
  html: "<b>Effects of Interactions</b>",
  style: label2,
  width: 300,
  height: 20
});

keytitle.style.fontSize = "16pt";

keytitle.style.lineHeight = "20px";

key1 = new Layer({
  width: 40,
  height: 40,
  parent: tips,
  borderWidth: 2,
  borderColor: "#253b56",
  borderStyle: "dashed",
  backgroundColor: "#66c2a5",
  y: 35,
  x: 10
});

key1name = new Layer({
  style: label2,
  parent: tips,
  width: 125,
  height: 40,
  backgroundColor: "null",
  x: 55,
  y: 35,
  html: "Work Pressure"
});

key1name.style.lineHeight = "40px";

key2 = new Layer({
  width: 40,
  height: 40,
  parent: tips,
  borderWidth: 2,
  borderColor: "#253b56",
  borderStyle: "dashed",
  backgroundColor: "#fc8d62",
  y: 35,
  x: 185
});

key2name = new Layer({
  style: label2,
  parent: tips,
  width: 125,
  height: 40,
  backgroundColor: "null",
  x: 230,
  y: 35,
  html: "Task Orientation"
});

key3 = new Layer({
  width: 40,
  height: 40,
  parent: tips,
  borderWidth: 2,
  borderColor: "#253b56",
  borderStyle: "dashed",
  backgroundColor: "#e78ac3",
  y: 100,
  x: 10
});

key3name = new Layer({
  style: label2,
  parent: tips,
  width: 125,
  height: 40,
  backgroundColor: "null",
  x: 55,
  y: 100,
  html: "Order & Organization"
});

key4 = new Layer({
  width: 40,
  height: 40,
  parent: tips,
  borderWidth: 2,
  borderColor: "#253b56",
  borderStyle: "dashed",
  backgroundColor: "#a6d854",
  y: 100,
  x: 185
});

key4name = new Layer({
  style: label2,
  parent: tips,
  width: 125,
  height: 40,
  backgroundColor: "null",
  x: 230,
  y: 100,
  html: "Independence"
});

key4name.style.lineHeight = "40px";

tensionLayer.onClick(function() {
  var l, len1, len2, m;
  tension_tooltip.animate({
    properties: {
      height: 0,
      width: 0,
      y: tensionLayer.y
    },
    curve: Bezier.ease,
    time: 0.3
  });
  tension_tooltip.visible = false;
  for (l = 0, len1 = emotion_Array.length; l < len1; l++) {
    i = emotion_Array[l];
    i.animate({
      properties: {
        opacity: 0
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  normal_text.animate({
    properties: {
      opacity: 0
    },
    time: 0.3,
    curve: Bezier.ease
  });
  normal_line.animate({
    properties: {
      opacity: 0
    },
    time: 0.3,
    curve: Bezier.ease
  });
  for (m = 0, len2 = bar_array.length; m < len2; m++) {
    i = bar_array[m];
    i.animate({
      properties: {
        opacity: 0
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  Utils.delay(0.3, function() {
    var len3, n, results;
    results = [];
    for (n = 0, len3 = bar_array.length; n < len3; n++) {
      i = bar_array[n];
      results.push(i.visible = false);
    }
    return results;
  });
  x_axis.animate({
    properties: {
      width: 1000
    },
    time: 0.3,
    curve: Bezier.ease
  });
  return Utils.delay(0.3, function() {
    var bar, group_section, independencebox, independencevar, index, len3, len4, len5, n, o, orderbox, ordervar, p, results, taskbox, taskvar, totalvars, workbox, workvar, x_counter_2;
    header.animate({
      properties: {
        opacity: 0
      },
      time: 0.3
    });
    Utils.delay(0.3, function() {
      header.html = "Tension-Anxiety vs Crew & Crew-Ground Interactions";
      return header.animate({
        properties: {
          opacity: 1
        },
        time: 0.3
      });
    });
    tips.visible = true;
    tips.animate({
      properties: {
        opacity: 1
      },
      time: 0.3,
      curve: Bezier.ease
    });
    for (n = 0, len3 = group_array.length; n < len3; n++) {
      i = group_array[n];
      group_section = new Layer({
        name: i,
        parent: bounding_box,
        backgroundColor: "null",
        width: axis_width / 7,
        height: 40,
        x: x_counter_3,
        y: x_axis.y + x_axis.height + 5,
        html: i,
        style: label1
      });
      x_counter_3 = x_counter_3 + (axis_width / 7);
    }
    for (o = 0, len4 = bar_array.length; o < len4; o++) {
      i = bar_array[o];
      i.visible = false;
    }
    x_counter_2 = 50;
    results = [];
    for (p = 0, len5 = tension_Array.length; p < len5; p++) {
      i = tension_Array[p];
      index = (x_counter_2 - 50) / 200;
      workvar = work_pressure_Array[index];
      taskvar = task_orientation_Array[index];
      ordervar = order_Array[index];
      independencevar = independence_Array[index];
      totalvars = workvar + taskvar + ordervar + independencevar;
      bar = new Layer({
        parent: bounding_box,
        width: 200,
        x: x_counter_2,
        y: 550,
        height: 0,
        backgroundColor: null
      });
      x_counter_2 = x_counter_2 + 200;
      workbox = new Layer({
        parent: bar,
        height: 0,
        width: bar.width,
        y: bar.height,
        backgroundColor: "#66c2a5"
      });
      workArray.push(workbox);
      taskbox = new Layer({
        parent: bar,
        height: 0,
        width: bar.width,
        y: bar.height,
        backgroundColor: "#fc8d62"
      });
      taskArray.push(taskbox);
      orderbox = new Layer({
        parent: bar,
        height: 0,
        width: bar.width,
        y: bar.height,
        backgroundColor: "#e78ac3"
      });
      orderArray.push(orderbox);
      independencebox = new Layer({
        parent: bar,
        height: 0,
        width: bar.width,
        y: bar.height,
        backgroundColor: "#a6d854"
      });
      independenceArray.push(independencebox);
      bar.animate({
        properties: {
          y: 550 - (i * 50),
          height: i * 50
        },
        time: 0.6,
        curve: Bezier.ease
      });
      workbox.animate({
        height: (workvar / totalvars) * i * 50
      });
      ({
        time: 0.2,
        curve: Bezier.ease
      });
      taskbox.animate({
        height: (taskvar / totalvars) * i * 50,
        y: (workvar / totalvars) * i * 50
      });
      ({
        time: 0.2,
        curve: Bezier.ease
      });
      orderbox.animate({
        height: (ordervar / totalvars) * i * 50,
        y: [(taskvar / totalvars) + (workvar / totalvars)] * i * 50
      });
      ({
        time: 0.2,
        curve: Bezier.ease
      });
      independencebox.animate({
        height: (independencevar / totalvars) * i * 50,
        y: [(taskvar / totalvars) + (workvar / totalvars) + (ordervar / totalvars)] * i * 50
      });
      ({
        time: 0.2,
        curve: Bezier.ease
      });
      results.push(x_axis.bringtoFront);
    }
    return results;
  });
});

tip1.onMouseOver(function() {
  var l, len1, len2, len3, m, n, results;
  tip2.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip3.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip4.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip5.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key2.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key2name.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3name.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key4.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key4name.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  for (l = 0, len1 = independenceArray.length; l < len1; l++) {
    i = independenceArray[l];
    i.animate({
      properties: {
        opacity: 0.3
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  for (m = 0, len2 = taskArray.length; m < len2; m++) {
    i = taskArray[m];
    i.animate({
      properties: {
        opacity: 0.3
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  results = [];
  for (n = 0, len3 = orderArray.length; n < len3; n++) {
    i = orderArray[n];
    results.push(i.animate({
      properties: {
        opacity: 0.3
      },
      time: 0.3,
      curve: Bezier.ease
    }));
  }
  return results;
});

tip1.onMouseOut(function() {
  var l, len1, len2, len3, m, n, results;
  tip2.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip3.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip4.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip5.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key2.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key2name.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3name.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key4.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key4name.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  for (l = 0, len1 = independenceArray.length; l < len1; l++) {
    i = independenceArray[l];
    i.animate({
      properties: {
        opacity: 1
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  for (m = 0, len2 = taskArray.length; m < len2; m++) {
    i = taskArray[m];
    i.animate({
      properties: {
        opacity: 1
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  results = [];
  for (n = 0, len3 = orderArray.length; n < len3; n++) {
    i = orderArray[n];
    results.push(i.animate({
      properties: {
        opacity: 1
      },
      time: 0.3,
      curve: Bezier.ease
    }));
  }
  return results;
});

tip2.onMouseOver(function() {
  var l, len1, len2, m, results;
  tip1.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip3.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip4.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip5.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3name.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key4.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key4name.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  for (l = 0, len1 = independenceArray.length; l < len1; l++) {
    i = independenceArray[l];
    i.animate({
      properties: {
        opacity: 0.3
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  results = [];
  for (m = 0, len2 = orderArray.length; m < len2; m++) {
    i = orderArray[m];
    results.push(i.animate({
      properties: {
        opacity: 0.3
      },
      time: 0.3,
      curve: Bezier.ease
    }));
  }
  return results;
});

tip2.onMouseOut(function() {
  var l, len1, len2, m, results;
  tip1.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip3.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip4.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip5.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3name.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key4.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key4name.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  for (l = 0, len1 = independenceArray.length; l < len1; l++) {
    i = independenceArray[l];
    i.animate({
      properties: {
        opacity: 1
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  results = [];
  for (m = 0, len2 = orderArray.length; m < len2; m++) {
    i = orderArray[m];
    results.push(i.animate({
      properties: {
        opacity: 1
      },
      time: 0.3,
      curve: Bezier.ease
    }));
  }
  return results;
});

tip3.onMouseOver(function() {
  var l, len1, len2, len3, m, n, results;
  tip2.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip1.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip4.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip5.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key1.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key1name.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3name.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key4.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key4name.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  for (l = 0, len1 = independenceArray.length; l < len1; l++) {
    i = independenceArray[l];
    i.animate({
      properties: {
        opacity: 0.3
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  for (m = 0, len2 = workArray.length; m < len2; m++) {
    i = workArray[m];
    i.animate({
      properties: {
        opacity: 0.3
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  results = [];
  for (n = 0, len3 = orderArray.length; n < len3; n++) {
    i = orderArray[n];
    results.push(i.animate({
      properties: {
        opacity: 0.3
      },
      time: 0.3,
      curve: Bezier.ease
    }));
  }
  return results;
});

tip3.onMouseOut(function() {
  var l, len1, len2, len3, m, n, results;
  tip2.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip1.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip4.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip5.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key1.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key1name.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3name.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key4.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key4name.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  for (l = 0, len1 = independenceArray.length; l < len1; l++) {
    i = independenceArray[l];
    i.animate({
      properties: {
        opacity: 1
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  for (m = 0, len2 = workArray.length; m < len2; m++) {
    i = workArray[m];
    i.animate({
      properties: {
        opacity: 1
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  results = [];
  for (n = 0, len3 = orderArray.length; n < len3; n++) {
    i = orderArray[n];
    results.push(i.animate({
      properties: {
        opacity: 1
      },
      time: 0.3,
      curve: Bezier.ease
    }));
  }
  return results;
});

tip4.onMouseOver(function() {
  var l, len1, len2, len3, m, n, results;
  tip2.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip3.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip1.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip5.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key2.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key2name.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key1.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key1name.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3name.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  for (l = 0, len1 = independenceArray.length; l < len1; l++) {
    i = independenceArray[l];
    i.animate({
      properties: {
        opacity: 0.3
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  for (m = 0, len2 = taskArray.length; m < len2; m++) {
    i = taskArray[m];
    i.animate({
      properties: {
        opacity: 0.3
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  results = [];
  for (n = 0, len3 = workArray.length; n < len3; n++) {
    i = workArray[n];
    results.push(i.animate({
      properties: {
        opacity: 0.3
      },
      time: 0.3,
      curve: Bezier.ease
    }));
  }
  return results;
});

tip4.onMouseOut(function() {
  var l, len1, len2, len3, m, n, results;
  tip2.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip3.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip1.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip5.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key2.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key2name.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key1.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key1name.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3name.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  for (l = 0, len1 = independenceArray.length; l < len1; l++) {
    i = independenceArray[l];
    i.animate({
      properties: {
        opacity: 1
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  for (m = 0, len2 = workArray.length; m < len2; m++) {
    i = workArray[m];
    i.animate({
      properties: {
        opacity: 1
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  results = [];
  for (n = 0, len3 = orderArray.length; n < len3; n++) {
    i = orderArray[n];
    results.push(i.animate({
      properties: {
        opacity: 1
      },
      time: 0.3,
      curve: Bezier.ease
    }));
  }
  return results;
});

tip5.onMouseOver(function() {
  var l, len1, len2, len3, m, n, results;
  tip2.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip3.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip4.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip1.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key2.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key2name.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3name.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key1.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key1name.animate({
    properties: {
      opacity: 0.3
    },
    time: 0.3,
    curve: Bezier.ease
  });
  for (l = 0, len1 = workArray.length; l < len1; l++) {
    i = workArray[l];
    i.animate({
      properties: {
        opacity: 0.3
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  for (m = 0, len2 = taskArray.length; m < len2; m++) {
    i = taskArray[m];
    i.animate({
      properties: {
        opacity: 0.3
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  results = [];
  for (n = 0, len3 = orderArray.length; n < len3; n++) {
    i = orderArray[n];
    results.push(i.animate({
      properties: {
        opacity: 0.3
      },
      time: 0.3,
      curve: Bezier.ease
    }));
  }
  return results;
});

tip5.onMouseOut(function() {
  var l, len1, len2, len3, m, n, results;
  tip2.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip3.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip4.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  tip1.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key2.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key2name.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key3name.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key1.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  key1name.animate({
    properties: {
      opacity: 1
    },
    time: 0.3,
    curve: Bezier.ease
  });
  for (l = 0, len1 = workArray.length; l < len1; l++) {
    i = workArray[l];
    i.animate({
      properties: {
        opacity: 1
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  for (m = 0, len2 = taskArray.length; m < len2; m++) {
    i = taskArray[m];
    i.animate({
      properties: {
        opacity: 1
      },
      time: 0.3,
      curve: Bezier.ease
    });
  }
  results = [];
  for (n = 0, len3 = orderArray.length; n < len3; n++) {
    i = orderArray[n];
    results.push(i.animate({
      properties: {
        opacity: 1
      },
      time: 0.3,
      curve: Bezier.ease
    }));
  }
  return results;
});
