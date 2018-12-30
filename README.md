# PICO-8 Library of Utility Classes 
## Table of Contents
1. vec
2. timer

## vec
A vector class adapted from [hump.vector](https://github.com/vrld/hump/blob/master/vector.lua). Note that every function except for the constructor should be called from an instance of a vector.
### Members
* (number) x - The x-coordinate of the vector
* (number) y - The y-coordinate of the vector
### Functions
* **Operators**
  
  The `+`,`-`,`*`,`/`, and unary `-` operators are supported and provide standard vector arithmetic.
* **vec.new(x, y)**
  
  The constructor for a vector object.

  **Arguments:** (numbers) x,y

  **Returns:** (vector) A new vector object
* **vec:to_str()**
  
  A debugging function to view the vector. Exists because PICO-8 does not support the tostring() metamethod.

  **Returns:** (string) A string representation of the vector
* **vec:len()**
  
  **Returns:** (number) The length of the vector
* **vec:dist(other)**

  **Arguments:** (vector) other

  **Returns:** (number) The distance between the base vector and the argument vector
* **vec:clone()**
  
  **Returns:** (vector) A copy of the base vector
* **vec:normi()**
  
  Normalizes the vector in-place, mutating the original.

  **Returns:** (vector) Normalizes the base vector, then returns itself
* **vec:norm()**
  
  **Returns:** (vector) Returns a normalized version of the base vector

---

## timer
A stopwatch class that functions like an [egg timer](https://en.wikipedia.org/wiki/Egg_timer)
### Members
* (number) ti - Short for "ticks, initial." The amount of ticks that the timer will run for.
* (number) fi - Short for "frames, initial." The amount of frames that a "tick" will last for.
* (number) t - Short for "tick." The amount of ticks that the timer has remaining before stopping.
* (number) f - Short for "frame." The amount of frames that the timer has remaining before decrementing a tick.
* (boolean) done - Whether the timer is running or not
### Functions
* **timer.new(ti, fi)**
  
  The constructor for a timer object. **Creating a timer does not start its countdown. To start a timer you must call** `timer:reset()`
  **Arguments:** (numbers) ti, fi (defaults to ti=0, fi=1 if no arguments are provided)
  **Returns:** (vector) A new vector object
* **timer:reset()**
  
  Resets the timers tick and frame
  
  **Returns:** (vector) The current tick of the timer (which will be ti)
* **timer:update()**
  
  Tells the timer that a frame has passed so it can adjust its tick accordingly.
  
  **Returns:** (number) The current tick of the timer
* **timer:pause()**
  
  Pauses the timer
* **timer:resume()**
  
  Resumes the timer if paused
