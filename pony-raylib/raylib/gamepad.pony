use @IsGamepadAvailable[Bool](gamepad: I32)                   // Check if a gamepad is available
use @GetGamepadName[Pointer[U8 val] ref](gamepad: I32)        // Get gamepad internal name id
use @IsGamepadButtonPressed[Bool](gamepad: I32, button: I32)  // Check if a gamepad button has been pressed once
use @IsGamepadButtonDown[Bool](gamepad: I32, button: I32)     // Check if a gamepad button is being pressed
use @IsGamepadButtonReleased[Bool](gamepad: I32, button: I32) // Check if a gamepad button has been released once
use @IsGamepadButtonUp[Bool](gamepad: I32, button: I32)       // Check if a gamepad button is NOT being pressed
use @GetGamepadButtonPressed[I32]()                           // Get the last gamepad button pressed
use @GetGamepadAxisCount[I32](gamepad: I32)                   // Get gamepad axis count for a gamepad
use @GetGamepadAxisMovement[F32](gamepad: I32, axis: I32)     // Get axis movement value for a gamepad axis
use @SetGamepadMappings[I32](mappings: Pointer[U8 val] tag)   // Set internal gamepad mappings (SDL_GameControllerDB)

primitive GamePad
    fun isavailable(gamepad: I32): Bool => @IsGamepadAvailable(gamepad)
    fun getName(gamepad: I32): String => recover String.from_cstring(@GetGamepadName(gamepad)) end
    fun isbuttonpressed(gamepad: I32, button: I32): Bool => @IsGamepadButtonPressed(gamepad, button)
    fun isbuttondown(gamepad: I32, button: I32): Bool => @IsGamepadButtonDown(gamepad, button)
    fun isbuttonreleased(gamepad: I32, button: I32): Bool => @IsGamepadButtonReleased(gamepad, button)
    fun isbuttonup(gamepad: I32, button: I32): Bool => @IsGamepadButtonUp(gamepad, button)
    fun getbuttonpressed(): I32 => @GetGamepadButtonPressed()
    fun getaxiscount(gamepad: I32): I32 => @GetGamepadAxisCount(gamepad)
    fun getaxismovement(gamepad: I32, axis: I32): F32 => @GetGamepadAxisMovement(gamepad, axis)
    fun setmappings(mappings: Array[U8] ref): I32 => @SetGamepadMappings(mappings.cpointer())
