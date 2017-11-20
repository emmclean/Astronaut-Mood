var circle, color_array, counter, cover, drag_here, finger_pulse, finger_tip, middle_finger, middle_finger_bg, sickIcon, side_pulse_func, side_to_side;

counter = 0;

cover = new BackgroundLayer({
  image: "images/ng-978.jpg",
  width: Screen.width,
  height: (Screen.width / 4896) * 3264
});

sickIcon = new Layer({
  image: "images/sickIcon.png",
  parent: cover,
  width: 112,
  height: 112,
  x: 64,
  y: 64
});

color_array = [
  {
    "left": "#00c6ff",
    "right": "#0072ff"
  }, {
    "left": "#ffe47a",
    "right": "#f7ff00"
  }, {
    "left": "#64f38c",
    "right": "#45b649"
  }, {
    "left": "#ff00cc",
    "right": "#333399"
  }
];

side_pulse_func = function(dragLayer, timeT, start) {
  var side_pulse, side_unpulse;
  side_pulse = new Animation({
    layer: dragLayer,
    properties: {
      scale: 1.6,
      opacity: 0
    },
    time: timeT,
    curve: "linear"
  });
  side_unpulse = new Animation({
    layer: dragLayer,
    properties: {
      scale: 0
    },
    time: 0.1,
    curve: "linear"
  });
  side_pulse.start();
  side_pulse.onAnimationEnd(function() {
    return Utils.delay(0.3, function() {
      dragLayer.scale = 0;
      dragLayer.opacity = 0.6;
      return side_pulse.start();
    });
  });
  if (start === false) {
    return side_pulse.stop();
  }
};

side_to_side = function(finger, bg, dragLayer) {
  finger.on(Events.Drag, function(event) {
    if (event.offsetTime >= 1000 & event.offsetTime < 2000) {
      return bg.animate({
        gradient: {
          start: color_array[1].left,
          stop: color_array[1].right
        },
        time: 0.1
      });
    } else if (event.offsetTime >= 2000 & event.offsetTime < 3000) {
      return bg.animate({
        gradient: {
          start: color_array[2].left,
          stop: color_array[2].right
        },
        time: 0.1
      });
    } else if (event.offsetTime >= 3000 & event.offsetTime < 4000) {
      return bg.animate({
        gradient: {
          start: color_array[0].left,
          stop: color_array[0].right
        },
        time: 0.1
      });
    } else if (event.offsetTime >= 4000 & event.offsetTime < 5000) {
      return bg.animate({
        gradient: {
          start: color_array[1].left,
          stop: color_array[1].right
        },
        time: 0.1
      });
    } else if (event.offsetTime >= 5000 & event.offsetTime < 6000) {
      return bg.animate({
        gradient: {
          start: color_array[2].left,
          stop: color_array[2].right
        },
        time: 0.1
      });
    } else if (event.offsetTime >= 7000) {
      return bg.animate({
        gradient: {
          start: color_array[3].left,
          stop: color_array[3].right
        },
        time: 0.1
      });
    }
  });
  finger.on("change:point", function() {
    var DX, DY;
    DX = dragLayer.x;
    DY = dragLayer.y;
    bg.rotationZ = this.point.x / 4;
    if (this.point.x >= DX & this.point.x <= (DX + 60) & this.point.y >= DY & this.point.y <= (DY + (Screen.width / 5))) {
      counter = counter + 1;
      return Utils.delay(0.6, function() {
        if (DX === -30) {
          dragLayer.x = Screen.width - 30;
        } else {
          dragLayer.x = -30;
        }
        if (DY >= (0.8 * Screen.height)) {
          return dragLayer.y = 0;
        } else {
          return dragLayer.y = DY + (Screen.height / 5);
        }
      });
    }
  });
  return finger.onDragEnd(function() {
    dragLayer.x = -30;
    return dragLayer.y = 0;
  });
};

finger_tip = function(finger, sub_finger) {
  finger.draggable.enabled = true;
  finger.width = 50;
  finger.height = 65;
  finger.borderRadius = 65;
  finger.backgroundColor = "white";
  sub_finger.parent = finger;
  sub_finger.backgroundColor = "white";
  sub_finger.borderRadius = 65;
  sub_finger.width = finger.width;
  return sub_finger.height = finger.height;
};

finger_pulse = function(finger, sub_finger) {
  var XX, YY, pulseStart;
  XX = finger.x;
  YY = finger.y;
  pulseStart = new Animation({
    layer: sub_finger,
    properties: {
      scale: 1.6,
      opacity: 0
    },
    curve: "linear",
    time: 0.9
  });
  finger.onTouchStart(function() {
    pulseStart.start();
    return pulseStart.onAnimationEnd(function() {
      sub_finger.scale = 1;
      sub_finger.opacity = 1;
      return pulseStart.start();
    });
  });
  return finger.onDragEnd(function() {
    circle.animate({
      gradient: {
        start: "#00c6ff",
        end: "#0072ff",
        angle: 90
      }
    });
    pulseStart.stop();
    sub_finger.scale = 1;
    sub_finger.opacity = 1;
    return finger.animate({
      properties: {
        x: XX,
        y: YY
      },
      time: 0.3,
      curve: Bezier(0.25, 0.1, 0.25, 1)
    });
  });
};

circle = new Layer({
  visible: false,
  x: -0.5 * Screen.height,
  y: -0.5 * Screen.height,
  width: 3 * Screen.height,
  height: 3 * Screen.height
});

circle.gradient = {
  start: "#00c6ff",
  end: "#0072ff",
  angle: 90
};

middle_finger = new Layer({
  x: Screen.width / 2,
  y: 50,
  visible: false
});

middle_finger_bg = new Layer;

drag_here = new Layer({
  width: 60,
  x: -30,
  height: Screen.height / 5,
  borderRadius: Screen.height / 5,
  backgroundColor: "white",
  opacity: 0.6,
  visible: false
});

sickIcon.onTap(function() {
  circle.opacity = 0;
  circle.visible = true;
  ({
    borderRadius: 100 % circle.animate({
      properties: {
        borderRadius: 0,
        opacity: 1
      },
      time: 0.3,
      curve: "linear"
    })
  });
  return Utils.delay(0.6, function() {
    middle_finger.opacity = 0;
    middle_finger.scale = 0;
    middle_finger.visible = true;
    middle_finger.animate({
      properties: {
        scale: 1,
        opacity: 0.6
      }
    });
    return Utils.delay(0.3, function() {
      return side_pulse_func(middle_finger, 1.8);
    });
  });
});

middle_finger.onTap(function() {
  if (counter === 0) {
    counter = 1;
    side_pulse_func(middle_finger, 1.8, false);
    middle_finger.animate({
      properties: {
        opacity: 1,
        scale: 1
      },
      time: 0.3,
      curve: "linear"
    });
    drag_here.visible = true;
    return side_pulse_func(drag_here, 1.2);
  }
});

middle_finger.on(Events.Drag, function(event) {
  var fingers_on_screen;
  return fingers_on_screen = event.fingers;
});

finger_tip(middle_finger, middle_finger_bg);

finger_pulse(middle_finger, middle_finger_bg);

side_to_side(middle_finger, circle, drag_here);
