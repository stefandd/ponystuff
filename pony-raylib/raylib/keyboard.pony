use @IsKeyPressed[Bool](key: I32) // Check if a key has been pressed once
use @IsKeyDown[Bool](key: I32) // Check if a key is being pressed
use @IsKeyReleased[Bool](key: I32) // Check if a key has been released once
use @IsKeyUp[Bool](key: I32) // Check if a key is NOT being pressed
use @SetExitKey[None](key: I32) // Set a custom key to exit program (default is ESC)
use @GetKeyPressed[I32]() // Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
use @GetCharPressed[I32]() // Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty

primitive KeyBoard
    fun key_NULL(): I32 => 0
    // Alphanumeric keys
    fun key_BACK(): I32 => 4
    fun key_VOLUME_UP(): I32 => 24
    fun key_VOLUME_DOWN(): I32 => 25
    fun key_SPACE(): I32 => 32
    fun key_APOSTROPHE(): I32 => 39
    fun key_COMMA(): I32 => 44
    fun key_MINUS(): I32 => 45
    fun key_PERIOD(): I32 => 46
    fun key_SLASH(): I32 => 47
    fun key_ZERO(): I32 => 48
    fun key_ONE(): I32 => 49
    fun key_TWO(): I32 => 50
    fun key_THREE(): I32 => 51
    fun key_FOUR(): I32 => 52
    fun key_FIVE(): I32 => 53
    fun key_SIX(): I32 => 54
    fun key_SEVEN(): I32 => 55
    fun key_EIGHT(): I32 => 56
    fun key_NINE(): I32 => 57
    fun key_SEMICOLON(): I32 => 59
    fun key_EQUAL(): I32 => 61
    fun key_A(): I32 => 65
    fun key_B(): I32 => 66
    fun key_C(): I32 => 67
    fun key_D(): I32 => 68
    fun key_E(): I32 => 69
    fun key_F(): I32 => 70
    fun key_G(): I32 => 71
    fun key_H(): I32 => 72
    fun key_I(): I32 => 73
    fun key_J(): I32 => 74
    fun key_K(): I32 => 75
    fun key_L(): I32 => 76
    fun key_M(): I32 => 77
    fun key_N(): I32 => 78
    fun key_O(): I32 => 79
    fun key_P(): I32 => 80
    fun key_Q(): I32 => 81
    fun key_R(): I32 => 82
    fun key_S(): I32 => 83
    fun key_T(): I32 => 84
    fun key_U(): I32 => 85
    fun key_V(): I32 => 86
    fun key_W(): I32 => 87
    fun key_X(): I32 => 88
    fun key_Y(): I32 => 89
    fun key_Z(): I32 => 90
    // Function keys
    fun key_LEFT_BRACKET(): I32 => 91
    fun key_BACKSLASH(): I32 => 92
    fun key_RIGHT_BRACKET(): I32 => 93
    fun key_GRAVE(): I32 => 96
    // Keypad keys
    fun key_ESCAPE(): I32 => 256
    fun key_ENTER(): I32 => 257
    fun key_TAB(): I32 => 258
    fun key_BACKSPACE(): I32 => 259
    fun key_INSERT(): I32 => 260
    fun key_DELETE(): I32 => 261
    fun key_RIGHT(): I32 => 262
    fun key_LEFT(): I32 => 263
    fun key_DOWN(): I32 => 264
    fun key_UP(): I32 => 265
    fun key_PAGE_UP(): I32 => 266
    fun key_PAGE_DOWN(): I32 => 267
    fun key_HOME(): I32 => 268
    fun key_END(): I32 => 269
    fun key_CAPS_LOCK(): I32 => 280
    fun key_SCROLL_LOCK(): I32 => 281
    fun key_NUM_LOCK(): I32 => 282
    fun key_PRINT_SCREEN(): I32 => 283
    fun key_PAUSE(): I32 => 284
    fun key_F1(): I32 => 290
    fun key_F2(): I32 => 291
    fun key_F3(): I32 => 292
    fun key_F4(): I32 => 293
    fun key_F5(): I32 => 294
    fun key_F6(): I32 => 295
    fun key_F7(): I32 => 296
    fun key_F8(): I32 => 297
    fun key_F9(): I32 => 298
    fun key_F10(): I32 => 299
    fun key_F11(): I32 => 300
    fun key_F12(): I32 => 301
    fun key_KP_0(): I32 => 320
    fun key_KP_1(): I32 => 321
    fun key_KP_2(): I32 => 322
    fun key_KP_3(): I32 => 323
    fun key_KP_4(): I32 => 324
    fun key_KP_5(): I32 => 325
    fun key_KP_6(): I32 => 326
    fun key_KP_7(): I32 => 327
    fun key_KP_8(): I32 => 328
    fun key_KP_9(): I32 => 329
    fun key_KP_DECIMAL(): I32 => 330
    fun key_KP_DIVIDE(): I32 => 331
    fun key_KP_MULTIPLY(): I32 => 332
    fun key_KP_SUBTRACT(): I32 => 333
    fun key_KP_ADD(): I32 => 334
    fun key_KP_ENTER(): I32 => 335
    fun key_KP_EQUAL(): I32 => 336
    // Android key buttons
    fun key_LEFT_SHIFT(): I32 => 340
    fun key_LEFT_CONTROL(): I32 => 341
    fun key_LEFT_ALT(): I32 => 342
    fun key_LEFT_SUPER(): I32 => 343
    fun key_RIGHT_SHIFT(): I32 => 344
    fun key_RIGHT_CONTROL(): I32 => 345
    fun key_RIGHT_ALT(): I32 => 346
    fun key_RIGHT_SUPER(): I32 => 347
    fun key_KB_MENU(): I32 => 348
    // functions
    fun isKeyPressed(key: I32): Bool => @IsKeyPressed(key)
    fun isKeyReleased(key: I32): Bool => @IsKeyReleased(key)
    fun isKeyUp(key: I32): Bool => @IsKeyUp(key)
    fun isKeyDown(key: I32): Bool => @IsKeyDown(key)
    fun setExitKey(key: I32) => @SetExitKey(key)
    fun getKeyPressed(): I32 => @GetKeyPressed()
    fun getCharPressed(): I32 => @GetCharPressed()
