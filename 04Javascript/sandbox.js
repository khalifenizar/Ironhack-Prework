function newRover(x, y, dir) {
  'use strict';
  GRID_SIZE = 100;

  function validateCoordinate(c) {
    if(typeof c !== 'number' || c < 0 || c >= GRID_SIZE ) {
      c = 0;
    } else {
      c = Math.floor(c)
    }  
  }

  validateCoordinate(x);
  validateCoordinate(y);

  if( dir !== 'N' || dir !== 'S' || dir !== 'E' || dir !== 'W'){
    dir = 'N';
  }

  var rover = {
    x: x,
    y: y,
    dir: dir,

    move: function (commandArray) {
      for (var i = 0; i < commandArray.length; i++) {
        processOrder(commandArray.charAt(i));
      }
    },

    processOrder: function (moveChar) {
      if(moveChar === 'f' || moveChar === 'b') {
        if(moveChar === 'f') {
          moveForward();  
        } else {
          moveBackward();
        }
        wrapAround(x);
        wrapAround(y);
      }
      if(moveChar === 'r' || moveChar === 'l') {
        if(moveChar === 'r') {
          turnRight();
        } else {
          turnLeft();
        }
      }
    },

    moveForward: function () {
      switch (dir) {
        case 'N':
          y++;
        break;
        case 'S':
          y--;
        break;
        case 'E':
          x++;
        break;
        case 'W':
          x--;
        break;
        default:
          console.log("I don't want to be on this planet anymore!");
      }
    },

    moveBackward: function () {
      switch (dir) {
        case 'N':
          y--;
        break;
        case 'S':
          y++;
        break;
        case 'E':
          x--;
        break;
        case 'W':
          x++;
        break;
        default:
          console.log("I don't want to be on this planet anymore!");
      }
    },

    turnRight: function () {
      switch (dir) {
        case 'N':
          dir = 'E';
        break;
        case 'S':
          dir = 'W';
        break;
        case 'E':
          dir = 'S';
        break;
        case 'W':
          dir = 'N';
        break;
        default:
          console.log("We're blasting off agaaaaiiiin!");
      }
    },

    turnLeft: function () {
      switch (dir) {
        case 'N':
          dir = 'W';
        break;
        case 'S':
          dir = 'E';
        break;
        case 'E':
          dir = 'N';
        break;
        case 'W':
          dir = 'S';
        break;
        default:
          console.log("We're blasting off agaaaaiiiin!");
      }
    },

    wrapAround: function (c) {
      if (c >= GRID_SIZE) {
        c %= GRID_SIZE;
      }
      if(c < 0) {
        c += GRID_SIZE;
      }
    },

    detectCollision: function() {
    }
  };
  return rover;
};