function newTask(text, priority) {
  'use strict';

  if (typeof priority === 'undefined') { priority = 0; }

  var task = {
    text: text, // the left 'text' is the name of the key but the right 'text'
                // is the parameter.

    priority: priority,
    done: false,
    order: null,

    markDone: function () {
      this.done = true;
    },

    markUndone: function () {
      this.done = false;
    },

    isDone: function () {
      return this.done;
    }
  };
  return task;
}

todoList = [];
todoList.nextId = 1;

// First notice we are not using a colon between the keys and function literals.
// This is because we can only use a colon during object definition. Here the
// definition is done and we are extending a object so we must use assignations.

todoList.addTask = function (text, priority) {
  var task = newTask(text, priority);
  task.order = this.nextId++;
  this.push(task);
};


todoList.show = function () {
  // forEach() is a function to pass through collections. It takes a function as
  // parameter. The function will be called for each member of the collection
  // passsing the member as first parameter and the its index inside the
  // collection as the second.
  this.forEach(function (task, index) {
    var toString =
      '[' + task.priority + '] - ' +    // priority as [<number>]
      (index + 1) + ': ' + task.text +  // now the number of the task and text
                                        // (user indices will start by 1)
      (task.isDone() ? '✓' : '')       // the done mark if proceeds
    ;
    console.log(toString);
  });
};

todoList.markDone = function (index) {
  var listIndex = index - 1; // user indices start by 1, list indices start by 0
  this[listIndex].markDone();
};

todoList.markUndone = function (index) {
  var listIndex = index - 1;
  this[listIndex].markUndone();
};

todoList.remove = function (index) {
  var listIndex = index - 1;

  // splice() modifies the Array in place. It takes three or more parameters.
  // The first is the index at which the modification start. The second is the
  // number of elements to be removed and the remaining elements (which are
  // optional) are elements to insert in the array.
  this.splice(listIndex, 1);
};

// sort() is a method that sort the items of an array in place. It can take
// a so-called comparison function which will receive two Array items A & B and
// say how to sort them. The comparison function must return a negative number
// if A precedes B; a positive number if B precedes A or 0 if both are equal.

todoList.sortByPriority = function () {
  this.sort(function (taskA, taskB) {
    return taskB.priority - taskA.priority;
  });
  this.show();
};

todoList.clearDone = function () {
  var index = 0;
  while (index < this.length) {
    var task = this[index];
    if (this.isDone()) {
      this.splice(index, 1);
    } else {
      index++;
    }
  }
};

todoList.addTask('Learn JavaScript', 1);
todoList.addTask('Do some practice');
todoList.addTask('Learn JSON');
todoList.addTask('Mayor Goldie Wilson! I like the sound of that!', 8);
