use "collections"
use "lib:raylib/raylibdll"
use "lib:raylib/raylibshim"
use "lib:win32/gdi32" if windows
use "lib:win32/user32" if windows
use "lib:win32/shell32" if windows

// general
use @fprintf[I32](stream: Pointer[U8] tag, fmt: Pointer[U8] tag, ...)
use @pony_os_stdout[Pointer[U8]]()
use @pony_os_stderr[Pointer[U8]]()
use @memcpy[Pointer[None]](dest: Pointer[None], src: Pointer[None] box, n: USize)
use @memset[Pointer[None]](dst: Pointer[None], set: U32, len: USize)
use @memmove[Pointer[None]](dst: Pointer[None], src: Pointer[None], len: USize) 

// raylib imports
use @FreeShimPointer[None](ptr: Pointer[None])
//
use @SetConfigFlags[None](flags: U32)
use @InitWindow[None](width: I32, height: I32, title: Pointer[U8] tag)
use @GetWindowPositionA[None](v: Vector2Ptr tag)
use @CloseWindow[None]()
use @GetScreenWidth[I32]()
use @GetScreenHeight[I32]()
use @GetMonitorWidth[I32]()
use @GetMonitorHeight[I32]()
use @SetTargetFPS[None](fps: I32)
use @GenImageColorA[None](width: I32, height: I32, color: U32, im_ptr: ImagePtr)
use @ImageFormat[None](im_ptr: ImagePtr, newFormat: I32) // PixelFormat.UNCOMPRESSED_R8G8B8A8
use @LoadTextureA[None](fileName: Pointer[U8] tag, tx_ptr: TexturePtr)
use @LoadTextureFromImageA[None](im_ptr: ImagePtr, tx_ptr: TexturePtr)
use @LoadImageColors[Pointer[U32]](im_ptr: ImagePtr)
use @ImageClearBackground[None](im_ptr: ImagePtr, color: U32)
use @UnloadImageColors[None](_pixptr: Pointer[U32])
use @SetTextureFilterA[None](tx_ptr: TexturePtr, filter: I32)
use @UpdateTextureA[None](tx_ptr: TexturePtr, ptr: Pointer[U32] tag)
use @DrawTextureProA[None](tx_ptr: TexturePtr, srcRect: RectPtr, dstRect: RectPtr, origin: Vector2Ptr, rotation: F32, tint: U32)
//
use @LoadRenderTextureA[None](width: I32, height: I32, rt_ptr: RenderTexturePtr)
use @UnloadRenderTextureA[None](rt_ptr: RenderTexturePtr)
use @BeginTextureModeA[None](rt_ptr: RenderTexturePtr)
use @EndTextureMode[None]()
//
use @DrawRingA[None](center: Vector2Ptr, innerRadius: F32, outerRadius: F32, startAngle: F32, endAngle: F32, segments: I32, color: U32)
use @DrawTriangleA[None](v1: Vector2Ptr, v2: Vector2Ptr, v3: Vector2Ptr, color: U32)
use @DrawLine[None](startPosX: I32, startPosY: I32, endPosX: I32, endPosY: I32, color: U32)
use @DrawCircle[None](centerX: I32, centerY: I32, radius: F32, color: U32)
use @DrawEllipse[None](centerX: I32, centerY: I32, radiusH: F32, radiusV: F32, color: U32)
use @DrawRectangle[None](posX: I32, posY: I32, width: I32, height: I32, color: U32)
use @DrawTriangleFan[None](points: Pointer[F32] tag, pointsCount: I32, color: U32)
//
use @WindowShouldClose[Bool]()    // Detect window close button or ESC key
use @BeginDrawing[None]()
use @EndDrawing[None]()
use @ClearBackground[None](color: U32)
use @UnloadTextureA[None](tx_ptr: TexturePtr)
use @UnloadImageA[None](im_ptr: ImagePtr)
//
use @UnloadShaderA[None](sh_ptr: ShaderPtr)
use @LoadShaderA[None](vsFileName: Pointer[None val] ref, fsFileName: Pointer[U8 val] tag, sh_ptr: ShaderPtr)
use @BeginShaderModeA[None](sh_ptr: ShaderPtr)
use @EndShaderMode[None]()
use @GetShaderLocationA[I32](sh_ptr: ShaderPtr, uniformName: Pointer[U8 val] tag)
use @GetShaderLocationAttribA[I32](sh_ptr: ShaderPtr, attribName: Pointer[U8 val] tag)
use @SetShaderValueA[None](sh_ptr: ShaderPtr, locIndex: I32, value: Pointer[None], uniformType: I32)
//
use @LoadFontA[None](fileName: Pointer[U8 val] tag, font: FontPtr)
use @LoadFontExA[None](fileName: Pointer[U8 val] tag, fontSize: I32, fontChars: Pointer[I32], glyphCount: I32, font: FontPtr)
use @UnloadFontA[None](font: FontPtr)
use @DrawTextExA[None](font: FontPtr, text: Pointer[U8 val] tag, position: Vector2Ptr, fontSize: F32, spacing: F32, tint: U32)
//
use @InitAudioDevice[None]()
use @CloseAudioDevice[None]()
use @SetMasterVolume[None](volume: F32)
use @LoadSoundA[None](fileName: Pointer[U8] tag, snd_ptr: SoundPtr)
use @PlaySoundA[None](snd_ptr: SoundPtr)
use @PlaySoundMultiA[None](snd_ptr: SoundPtr)
use @StopSoundA[None](snd_ptr: SoundPtr)
use @StopSoundMulti[None]()
use @UnloadSoundA[None](snd_ptr: SoundPtr)
use @IsSoundPlayingA[Bool](snd_ptr: SoundPtr)
use @GetSoundsPlaying[I32]()
use @SetSoundVolumeA[None](snd_ptr: SoundPtr, volume: F32)
use @SetSoundPitchA[None](snd_ptr: SoundPtr, pitch: F32)
//
use @LoadMusicStreamA[None](fileName: Pointer[U8] tag, music: MusicPtr)
use @PlayMusicStreamA[None](mus_ptr: MusicPtr)
use @UpdateMusicStreamA[None](mus_ptr: MusicPtr)
use @PauseMusicStreamA[None](mus_ptr: MusicPtr)
use @ResumeMusicStreamA[None](mus_ptr: MusicPtr)
use @StopMusicStreamA[None](mus_ptr: MusicPtr)
use @UnloadMusicStreamA[None](mus_ptr: MusicPtr)
use @IsMusicStreamPlayingA[Bool](mus_ptr: MusicPtr)
use @SeekMusicStreamA[None](mus_ptr: MusicPtr, position: F32)
use @SetMusicVolumeA[None](mus_ptr: MusicPtr, volume: F32)
use @SetMusicPitchA[None](mus_ptr: MusicPtr, pitch: F32)
//
use @GetTime[F64]()
use @GetFrameTime[F32]()
use @DrawFPS[None](posX: I32, posY: I32)
use @rlDrawRenderBatchActive[None]()
use @rlPushMatrix[None]()
use @rlPopMatrix[None]()
use @rlLoadIdentity[None]()

// raylib types
type ShaderPtr is NullablePointer[Shader]
type ImagePtr is NullablePointer[Image]
type TexturePtr is NullablePointer[Texture]
type FontPtr is NullablePointer[Font]
type SoundPtr is NullablePointer[Sound]
type MusicPtr is NullablePointer[Music]
type RenderTexturePtr is NullablePointer[RenderTexture]
//type ColorPtr is NullablePointer[Color]

primitive Color24 // HTML Color format
    fun red(col: U32): U8 => ((col >> 16) and 0xFF).u8()
    fun green(col: U32): U8 => ((col >> 8) and 0xFF).u8()
    fun blue(col: U32): U8 => (col and 0xFF).u8()
    fun from_rgb(r: U8, g: U8, b: U8): U32 => (r.u32() * 0x10000) + (g.u32() * 0x100) + b.u32()
    fun from_rgb_tuple(rgb: (U8, U8, U8)): U32 => (rgb._1.u32() * 0x10000) + (rgb._2.u32() * 0x100) + rgb._3.u32()
    fun to_rgb_tuple(col: U32): (U8, U8, U8) => (((col >> 16) and 0xFF).u8(), ((col >> 8) and 0xFF).u8(), (col and 0xFF).u8())

primitive Color // RAYLIB FORMAT - U32 is ABGR since it is passed directly into the struct (considering small endianness)
    fun red(col: U32): U8 => (col and 0xFF).u8()
    fun green(col: U32): U8 => ((col >> 8) and 0xFF).u8()
    fun blue(col: U32): U8 => ((col >> 16) and 0xFF).u8()
    fun alpha(col: U32): U8 => ((col >> 24) and 0xFF).u8()
    fun from_rgb(r: U8, g: U8, b: U8, a: U8 = 0xFF): U32 => r.u32() + (g.u32() * 0x100) + (b.u32() * 0x10000) + (a.u32() * 0x1000000)
    fun from_rgba(r: U8, g: U8, b: U8, a: U8): U32 => r.u32() + (g.u32() * 0x100) + (b.u32() * 0x10000) + (a.u32() * 0x1000000)
    fun from_rgb_tuple(rgb: (U8, U8, U8), a: U8 = 0xFF): U32 => rgb._1.u32() + (rgb._2.u32() * 0x100) + (rgb._3.u32() * 0x10000) + (a.u32() * 0x1000000)
    fun from_rgba_tuple(rgba: (U8, U8, U8, U8)): U32 => rgba._1.u32() + (rgba._2.u32() * 0x100) + (rgba._3.u32() * 0x10000) + (rgba._4.u32() * 0x1000000)
    fun to_rgb_tuple(col: U32): (U8, U8, U8) =>
        ((col and 0xFF).u8(), ((col >> 8) and 0xFF).u8(), ((col >> 16) and 0xFF).u8())
    fun to_rgba_tuple(col: U32): (U8, U8, U8, U8) =>
        ((col and 0xFF).u8(), ((col >> 8) and 0xFF).u8(), ((col >> 16) and 0xFF).u8(), ((col >> 24) and 0xFF).u8())
    fun from_u24(col: U32, a: U8 = 0xFF): U32 =>
        // here the format is 0xRRGGBB
        (col >> 16) + (((col >> 8) and 0xFF) * 0x100) + ((col and 0xFF) * 0x10000) + (a.u32() * 0x1000000)
    fun from_Color24(col: U32, a: U8 = 0xFF): U32 =>
        from_u24(col)

primitive ShaderMaxLocations
    fun apply(): USize => 32 // #define RL_MAX_SHADER_LOCATIONS              32 

primitive ShaderUniformDataType
    fun shader_uniform_float(): I32 => 0     // Shader uniform type: float
    fun shader_uniform_vec2(): I32 => 1      // Shader uniform type: vec2 (2 float)
    fun shader_uniform_vec3(): I32 => 2      // Shader uniform type: vec3 (3 float)
    fun shader_uniform_vec4(): I32 => 3      // Shader uniform type: vec4 (4 float)
    fun shader_uniform_int(): I32 => 4       // Shader uniform type: int
    fun shader_uniform_ivec2(): I32 => 5     // Shader uniform type: ivec2 (2 int)
    fun shader_uniform_ivec3(): I32 => 6     // Shader uniform type: ivec3 (3 int)
    fun shader_uniform_ivec4(): I32 => 7     // Shader uniform type: ivec4 (4 int)
    fun shader_uniform_sampler2D(): I32 => 8 // Shader uniform type: sampler2d

primitive ShaderLocationIndex
    fun shader_loc_vertex_position(): USize => 0     // Shader location: vertex attribute: position
    fun shader_loc_vertex_texcoord01(): USize => 1   // Shader location: vertex attribute: texcoord01
    fun shader_loc_vertex_texcoord02(): USize => 2   // Shader location: vertex attribute: texcoord02
    fun shader_loc_vertex_normal(): USize => 3       // Shader location: vertex attribute: normal
    fun shader_loc_vertex_tangent(): USize => 4      // Shader location: vertex attribute: tangent
    fun shader_loc_vertex_color(): USize => 5        // Shader location: vertex attribute: color
    fun shader_loc_matrix_mvp(): USize => 6          // Shader location: matrix uniform: model-view-projection
    fun shader_loc_matrix_view(): USize => 7         // Shader location: matrix uniform: view (camera transform)
    fun shader_loc_matrix_projection(): USize => 8   // Shader location: matrix uniform: projection
    fun shader_loc_matrix_model(): USize => 9        // Shader location: matrix uniform: model (transform)
    fun shader_loc_matrix_normal(): USize => 10       // Shader location: matrix uniform: normal
    fun shader_loc_vector_view(): USize => 11         // Shader location: vector uniform: view
    fun shader_loc_color_diffuse(): USize => 12       // Shader location: vector uniform: diffuse color
    fun shader_loc_color_specular(): USize => 13      // Shader location: vector uniform: specular color
    fun shader_loc_color_ambient(): USize => 14       // Shader location: vector uniform: ambient color
    fun shader_loc_map_albedo(): USize => 15          // Shader location: sampler2d texture: albedo (same as: fun SHADER_LOC_MAP_DIFFUSE)
    fun shader_loc_map_metalness(): USize => 16       // Shader location: sampler2d texture: metalness (same as: fun SHADER_LOC_MAP_SPECULAR)
    fun shader_loc_map_normal(): USize => 17          // Shader location: sampler2d texture: normal
    fun shader_loc_map_roughness(): USize => 18       // Shader location: sampler2d texture: roughness
    fun shader_loc_map_occlusion(): USize => 19        // Shader location: sampler2d texture: occlusion
    fun shader_loc_map_emission(): USize => 20        // Shader location: sampler2d texture: emission
    fun shader_loc_map_height(): USize => 21          // Shader location: sampler2d texture: height
    fun shader_loc_map_cubemap(): USize => 22         // Shader location: samplerCube texture: cubemap
    fun shader_loc_map_irradiance(): USize => 23      // Shader location: samplerCube texture: irradiance
    fun shader_loc_map_prefilter(): USize => 24       // Shader location: samplerCube texture: prefilter
    fun shader_loc_map_brdf(): USize => 25             // Shader location: sampler2d texture: brdf

primitive ShaderAttributeNames
    fun default_shader_attrib_name_position(): String => "vertexPosition"  // Binded by default to shader location: 0
    fun default_shader_attrib_name_texcoord(): String => "vertexTexCoord"  // Binded by default to shader location: 1
    fun default_shader_attrib_name_normal(): String => "vertexNormal"  // Binded by default to shader location: 2
    fun default_shader_attrib_name_color(): String => "vertexColor"  // Binded by default to shader location: 3
    fun default_shader_attrib_name_tangent(): String => "vertexTangent"  // Binded by default to shader location: 4
    fun default_shader_attrib_name_texcoord2(): String => "vertexTexCoord2"  // Binded by default to shader location: 5
    fun default_shader_uniform_name_mvp(): String => "mvp"   // model-view-projection matrix
    fun default_shader_uniform_name_view(): String => "matView"  // view matrix
    fun default_shader_uniform_name_projection(): String => "matProjection"  // projection matrix
    fun default_shader_uniform_name_model(): String => "matModel"  // model matrix
    fun default_shader_uniform_name_normal(): String => "matNormal"  // normal matrix (transpose(inverse(matModelView))
    fun default_shader_uniform_name_color(): String => "colDiffuse"  // color diffuse (base tint color, multiplied by texture color)
    fun default_shader_sampler2d_name_texture0(): String => "texture0"  // texture0 (texture slot active 0)
    fun default_shader_sampler2d_name_texture1(): String => "texture1"  // texture1 (texture slot active 1)
    fun default_shader_sampler2d_name_texture2(): String => "texture2"  // texture2 (texture slot active 2) 

struct Shader // sizeof(Shader) = 16
    var id: U32 = 0 // Shader program id
    var padding: U32 = 0 // MANUAL PADDING FOR THE WAY MSVC PADS THE STRUCT TO BE 16 BYTE SIZE
    var locptr: Pointer[I32] = Pointer[I32].create() // Shader locations array (MAX_SHADER_LOCATIONS)
    var _ptr: ShaderPtr = ShaderPtr.none()
    var locArray: Array[I32] = Array[I32].init(-1, ShaderMaxLocations()) // Raylib stores 32 locations

    new noInit() => // BAD
        None

    new from_File(vsFileName: String val, fsFileName: String val) =>
        _ptr = ShaderPtr(this)
        @LoadShaderA(vsFileName.cstring(), fsFileName.cstring(), _ptr)
        @memcpy(locArray.cpointer(), locptr, locArray.size() * I32(0).bytewidth()) 

    fun debugLocArray() =>
        try
            let locarrsize = locArray.size() - 1
            for i in Range(0, locarrsize) do @fprintf(@pony_os_stdout(), "loc[%lu] = %i\n".cstring(), i, locArray(i)?) end
            @fprintf(@pony_os_stdout(), "loc[%lu] = %i\n".cstring(), locarrsize, locArray(locarrsize)?)
        end

    fun ref getShaderLocation(uniformName: String): I32 =>
        @GetShaderLocationA(_ptr, uniformName.cstring())

    fun ref getShaderLocationAttrib(attribName: String): I32 =>
        @GetShaderLocationAttribA(_ptr, attribName.cstring())

    fun ref setShaderFloatValue(locIndex: I32, value: F32) =>
        var floatval = value
        @SetShaderValueA(_ptr, locIndex, addressof floatval, 0)
        
    fun ref setShaderVec2Value(locIndex: I32, v: Vector2) =>
        @SetShaderValueA(_ptr, locIndex, v.ptr(), 1)

    fun ref ptr(): ShaderPtr =>
        _ptr

    fun ref destroy() =>
        if not _ptr.is_none() then
            @UnloadShaderA(_ptr)
            _ptr = ShaderPtr.none()
        end        

struct Image // sizeof(Image) = 24
    let dataptr: USize = 0
    let width: I32 = 0
    let height: I32 = 0
    let mipmaps: I32 = 0
    let format: I32 = 0
    var _ptr: ImagePtr = ImagePtr.none()
    var _pixptr: Pointer[U32] = Pointer[U32]

    new from_Color(width': I32, height': I32, color: U32) =>
        _ptr = ImagePtr(this)
        @GenImageColorA(width', height', color, _ptr)

    fun ref to_Texture(): Texture =>
        Texture.from_Image(this)

    fun ref setFormat(format': I32) =>
        @ImageFormat(_ptr, format') // e.g. 7 = PixelFormat.UNCOMPRESSED_R8G8B8A8

    fun ref pixeldata(): Array[U32] =>
        unloadpixeldata()
        _pixptr = @LoadImageColors(_ptr)
        Array[U32].from_cpointer(_pixptr, (height * width).usize()) // Get pixel data from image (RGBA 32bit)

    //fun ref clearBackground(color: U32) => // not working!
        //if not _ptr.is_none() then
            //@ImageClearBackground(_ptr, color)
        //end

    fun ref unloadpixeldata() =>
        if not _pixptr.is_null() then
            @UnloadImageColors(_pixptr)
        end

    fun ref ptr(): ImagePtr =>
        _ptr

    fun ref destroy() =>
        if not _ptr.is_none() then
            @UnloadImageA(_ptr)
            _ptr = ImagePtr.none()
        end        

struct Texture // sizeof(Texture) = 20
    var id: U32 = 0
    var width: I32 = 0 
    var height: I32 = 0
    var mipmaps: I32 = 0
    var format: I32 = 0
    var _ptr: TexturePtr = TexturePtr.none()

    new create(id': U32, width': I32, height': I32, mipmaps': I32, format': I32) =>
        id = id'; width = width'; height = height'; mipmaps = mipmaps'; format = format'
        _ptr = TexturePtr(this)

    new from_File(fname: String) =>
        _ptr = TexturePtr(this)
        @LoadTextureA(fname.cstring(), _ptr)

    new from_Image(img: Image) =>
        _ptr = TexturePtr(this)
        @LoadTextureFromImageA(img.ptr(), _ptr)

    fun ref update(data: Array[U32]) =>
        @UpdateTextureA(_ptr, data.cpointer())

    fun ref draw(src: Rectangle, dst: Rectangle, origin: Vector2, rotation: F32, tint: U32) =>
        @DrawTextureProA(_ptr, src.ptr(), dst.ptr(), origin.ptr(), rotation, tint)

    fun ref setTextureFilter(filter: I32) =>
        @SetTextureFilterA(_ptr, filter)

    fun ref ptr(): TexturePtr =>
        _ptr

    fun ref destroy() =>
        if not _ptr.is_none() then
            @UnloadTextureA(_ptr)
            _ptr = TexturePtr.none()
        end

struct RenderTexture // sizeof(RenderTexture2D) = 44
    let id: U32 = 0 // OpenGL framebuffer object id
    let txid: U32 = 0 // the following are 2 Texture structs that we simply list as their fields in correct order 
    let txwidth: I32 = 0 
    let txheight: I32 = 0
    let txmipmaps: I32 = 0
    let txformat: I32 = 0
    let dpid: U32 = 0
    let dpwidth: I32 = 0 
    let dpheight: I32 = 0
    let dpmipmaps: I32 = 0
    let dpformat: I32 = 0
    var _ptr: RenderTexturePtr = RenderTexturePtr.none()

    new noInit() => // BAD
        None

    new loadRenderTexture(width: I32, height: I32) =>
        _ptr = RenderTexturePtr(this)
        var tmp = @LoadRenderTextureA(width, height, _ptr)

    fun ref ptr(): RenderTexturePtr =>
        _ptr

    fun texture(): Texture =>
        let tx = Texture(txid, txwidth, txheight, txmipmaps, txformat)
        //@fprintf(@pony_os_stdout(), "tx id: %s\n".cstring(), tx.id.string().cstring())
        tx
        
    fun depth(): Texture =>
        let dp = Texture(dpid, dpwidth, dpheight, dpmipmaps, dpformat)
        //@fprintf(@pony_os_stdout(), "dp id: %s\n".cstring(), dp.id.string().cstring())
        dp

    fun ref destroy() =>
        if not _ptr.is_none() then
            @UnloadRenderTextureA(_ptr)
            _ptr = RenderTexturePtr.none()
        end

struct Sound // sizeof(Sound) = 40; sizeof(AudioStream) = 32 (everything up to framecount)
    let rAudioBuffer_ptr: USize = 0 
    let rAudioProcessor: USize = 0
    let sampleRate: U32 = 0
    let sampleSize: U32 = 0
    let channels: U32 = 0
    let padding: U32 = 0 // MANUAL PADDING FOR THE WAY MSVC PADS THE SUB-STRUCT TO BE 32 BYTE SIZE
    let frameCount: U32 = 0
    let padding2: U32 = 0 // MANUAL PADDING FOR THE WAY MSVC PADS THE STRUCT TO BE 40 BYTE SIZE
    var _ptr: SoundPtr = SoundPtr.none()

    new create(fname: String) =>
        _ptr = SoundPtr(this)
        @LoadSoundA(fname.cstring(), _ptr)

    fun ref ptr(): SoundPtr =>
        _ptr

    fun ref playsound() =>
        if frameCount != 0 then
            @PlaySoundA(_ptr)
        end

    fun ref playsoundmulti() =>
        if frameCount != 0 then
            @PlaySoundMultiA(_ptr)
        end

    fun ref stopsound() =>
        if frameCount != 0 then
            @StopSoundA(_ptr)
        end

    fun ref issoundplaying(): Bool =>
        @IsSoundPlayingA(_ptr)

    fun ref setsoundvolume(volume: F32) =>
        @SetSoundVolumeA(_ptr, volume)

    fun ref setsoundpitch(pitch: F32) =>
        @SetSoundPitchA(_ptr, pitch)
        
    fun ref destroy() =>
        if not _ptr.is_none() then
            @UnloadSoundA(_ptr)
            _ptr = SoundPtr.none()
        end

struct Music // sizeof(Music) = 56; sizeof(AudioStream) = 32 (everything up to framecount)
    // AudioStream struct
    let rAudioBuffer_ptr: USize = 0 
    let rAudioProcessor: USize = 0
    let sampleRate: U32 = 0
    let sampleSize: U32 = 0
    let channels: U32 = 0
    let padding: U32 = 0 // MSVC PADS THE SUB-STRUCT TO BE 32 BYTE SIZE
    // Music struct cnt'ed
    let frameCount: U32 = 0
    var looping: I32 = 0
    let ctxType: I32 = 0
    let ctxData: USize = 0
    let padding2: U32 = 0 // MANUAL PADDING TO THE TOTAL 56 BYTES
    var _ptr: MusicPtr = MusicPtr.none()

    new create(fname: String) =>
        _ptr = MusicPtr(this)
        @LoadMusicStreamA(fname.cstring(), _ptr)
        //@fprintf(@pony_os_stdout(), "%p, %p, %p\n".cstring(), rAudioBuffer_ptr, rAudioProcessor, ctxData)

    fun ref ptr(): MusicPtr =>
        _ptr

    fun ref playmusic() =>
        if frameCount != 0 then
            @PlayMusicStreamA(_ptr)
        end

    fun ref updatemusicstream() =>
        if frameCount != 0 then
            @UpdateMusicStreamA(_ptr)
        end

    fun ref stopmusic() =>
        if frameCount != 0 then
            @StopMusicStreamA(_ptr)
        end

    fun ref pausemusic() =>
        if frameCount != 0 then
            @PauseMusicStreamA(_ptr)
        end

    fun ref resumemusic() =>
        if frameCount != 0 then
            @ResumeMusicStreamA(_ptr)
        end

    fun ref seekmusic(position: F32) =>
        if frameCount != 0 then
            @SeekMusicStreamA(_ptr, position)
        end

    fun ref ismusicplaying(): Bool =>
        @IsMusicStreamPlayingA(_ptr)

    fun ref setmusicvolume(volume: F32) =>
        @SetMusicVolumeA(_ptr, volume)

    fun ref setmusicpitch(pitch: F32) =>
        @SetMusicPitchA(_ptr, pitch)

    fun ref destroy() =>
        if not _ptr.is_none() then
            @UnloadMusicStreamA(_ptr)
            _ptr = MusicPtr.none()
        end

struct Font //sizeof(Font) = 48
    var baseSize: I32 = 0     // Base size (default chars height)
    var glyphCount: I32 = 0   // Number of glyph characters
    var glyphPadding: I32 = 0 // Padding around the glyph characters
    var id: U32 = 0           // -- BEGIN Texture2D portion
    var width: I32 = 0
    var height: I32 = 0
    var mipmaps: I32 = 0
    var format: I32 = 0       // -- END Texture2D portion
    let recsptr: USize = 0    // Rectangles in texture for the glyphs
    let glyphsptr: USize = 0  // Glyphs info data
    var _ptr: FontPtr = FontPtr.none()

    new noInit() => // BAD
        None

    new from_FileEx(fname: String, fontSize: I32, charPtr: Pointer[I32] = Pointer[I32], fontMaxchar: I32 = 0) =>
        _ptr = FontPtr(this)
        @LoadFontExA(fname.cstring(), fontSize, charPtr, fontMaxchar, _ptr)
        //@fprintf(@pony_os_stdout(), "%i, %i, %i, %u, %i, %i, %i, %i\n".cstring(), baseSize, glyphCount, glyphPadding, id, width, height, mipmaps, format)

    new from_File(fname: String) =>
        _ptr = FontPtr(this)
        @LoadFontA(fname.cstring(), _ptr)

    fun texture(): Texture =>
        let tx = Texture(id, width, height, mipmaps, format)
        //@fprintf(@pony_os_stdout(), "tx id: %s\n".cstring(), tx.id.string().cstring())
        tx

    fun ref drawTextEx(text: String, position: Vector2, fontSize: F32, spacing: F32, tint: U32) =>
        @DrawTextExA(_ptr, text.cstring(), position.ptr(), fontSize, spacing, tint)

    fun ref drawTextExArray(text: Pointer[U8] tag, position: Vector2, fontSize: F32, spacing: F32, tint: U32) =>
        @DrawTextExA(_ptr, text, position.ptr(), fontSize, spacing, tint)

    fun ref ptr(): FontPtr =>
        _ptr

    fun ref destroy() =>
        if not _ptr.is_none() then
            @UnloadFontA(_ptr)
            //@fprintf(@pony_os_stdout(), "UnloadFontA() called\n".cstring())
            _ptr = FontPtr.none()
        end

class RenderWindow
    var _open: Bool = false
    var width: I32 = 0
    var height: I32 = 0

    new noInit() => // BAD
        None

    new create(width': I32, height': I32, title: String, flags: U32) =>
        @SetConfigFlags(flags) //  4 = ConfigFlags.WINDOW_RESIZABLE
        width = width'; height = height'
        @InitWindow(width, height, title.cstring())
        _open = true

    fun getScreenWidth(): I32 =>
        @GetScreenWidth()

    fun getScreenHeight(): I32 =>
        @GetScreenHeight()

    fun windowShouldClose(): Bool =>
        @WindowShouldClose()

    fun setTargetFPS(fps: I32) =>
        if _open then
            @SetTargetFPS(fps)
        end

    fun ref close() =>
        if _open then
            @CloseWindow() // Close window and OpenGL context
            _open = false
        end

    fun ref draw(body: {ref ()}) =>
        if _open then
            @BeginDrawing()
                body()
            @EndDrawing()
        end

    fun _final() =>
        if _open then
            @CloseWindow() // Close window and OpenGL context
        end

primitive CoreFuncs
    fun beginDrawing() => @BeginDrawing()
    fun endDrawing() => @EndDrawing()
    fun beginShaderMode(sh: Shader) => @BeginShaderModeA(sh.ptr())
    fun endShaderMode() => @EndShaderMode()
    fun beginTextureMode(rt: RenderTexture) => @BeginTextureModeA(rt.ptr())
    fun endTextureMode() => @EndTextureMode()
    fun clearBackground(color: U32) => @ClearBackground(color)
    fun initAudioDevice() => @InitAudioDevice()
    fun getSoundsPlaying(): I32 => @GetSoundsPlaying()
    fun stopsoundmulti() => @StopSoundMulti()
    fun setMasterVolume(volume: F32) => @SetMasterVolume(volume)
    fun closeAudioDevice() => @CloseAudioDevice()
    fun getTime(): F64 => @GetTime()
    fun getFrameTime(): F32 => @GetFrameTime()
    fun drawFPS(posX: I32, posY: I32) => @DrawFPS(posX, posY)
    fun getScreenWidth(): I32 => @GetScreenWidth()
    fun getScreenHeight(): I32 => @GetScreenHeight()
    fun getMonitorWidth(): I32 => @GetMonitorWidth()        
    fun getMonitorHeight(): I32 => @GetMonitorHeight()
    fun rlDrawRenderBatchActive() => @rlDrawRenderBatchActive()
    fun rlPushMatrix() => @rlPushMatrix()
    fun rlPopMatrix() => @rlPopMatrix()
    fun rlLoadIdentity() => @rlLoadIdentity()

primitive ShapeFuncs
    fun drawRing(center: Vector2Ptr, innerRadius: F32, outerRadius: F32, startAngle: F32, endAngle: F32, segments: I32, color: U32) =>
        @DrawRingA(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
    fun drawTriangle(v1: Vector2Ptr, v2: Vector2Ptr, v3: Vector2Ptr, color: U32) =>
        @DrawTriangleA(v1, v2, v3, color)
    fun drawLine(startPosX: I32, startPosY: I32, endPosX: I32, endPosY: I32, color: U32) =>
        @DrawLine(startPosX, startPosY, endPosX, endPosY, color)
    fun drawCircle(centerX: I32, centerY: I32, radius: F32, color: U32) =>
        @DrawCircle(centerX, centerY, radius, color)
    fun drawEllipse(centerX: I32, centerY: I32, radiusH: F32, radiusV: F32, color: U32) =>
        @DrawEllipse(centerX, centerY, radiusH, radiusV, color)
    fun drawRectangle(posX: I32, posY: I32, width: I32, height: I32, color: U32) =>
        @DrawRectangle(posX, posY, width, height, color)
    fun drawTriangleFan(points: Pointer[F32] tag, pointsCount: I32, color: U32) =>
        @DrawTriangleFan(points, pointsCount, color)
