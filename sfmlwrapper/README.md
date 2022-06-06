## What is this?

A small wrapper for CSFML in `Pony`. I just wrapped enough of the vast functionality to be able to write small games with sound.

There is a small test app, `test.pony`, that shows random pixel noise. While SFML can be multithreaded, its own threading system and that of Pony are likely not compatible. Be sure to suppress the Main actor being in any more than 1 scheduler thread by adding
```pony
actor Main
	..

    fun @runtime_override_defaults(rto: RuntimeOptions) =>
        rto.ponymaxthreads = 1
```
with your main actor. Without this, expect crashes (when multiple threads attempt to access the OpenGL context etc.).

## Installation

Simply copy the `sfml` folder into the directory of your app. The test app uses `use "sfml"` so it expects the sfml folder in its own folder. Alternatively, put the `sfml` folder whereever you keep your addon modules and use an appropriate `use` statement.
You will need the link and runtime libraries for CSFML. For Windows, those are included in the `windows libs` folder. If you are on a different system, use the dynamic link library version of CSFML and modify the 
```pony
use "lib:csfml/csfml-system"
use "lib:csfml/csfml-window"
use "lib:csfml/csfml-graphics"
use "lib:csfml/csfml-audio"
```
section of `sfml\core.pony` to point Pony to the appropriate paths. Running the test app, you should see something like:
<img src="https://github.com/stefandd/ponystuff/blob/main/sfmlwrapper/screenshot.png" width="653" height="340">