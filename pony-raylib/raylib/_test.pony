use "collections"
use "time"
use "random"
use "modules/simplerand"

primitive Options
    fun vscreen_width() : I32 => 256
    fun vscreen_height() : I32 => 192
    fun screen_width() : I32 => vscreen_width() * 4
    fun screen_height() : I32 => vscreen_height() * 4
    fun window_width() : I32 => screen_width()
    fun window_height() : I32 => screen_height()

actor Main
    let _env : Env
    let renderer : RenderWindow
    let image : Image
    let texture: Texture
    var pixeldata : Array[U32]
    var frames : U32 = 0
    var t_lastframe : U64    
    let sr : SimpleRand = SimpleRand()

    fun @runtime_override_defaults(rto: RuntimeOptions) =>
        rto.ponymaxthreads = 1

    new create(env : Env) =>
        _env = env
        renderer = RenderWindow(Options.window_width(), Options.window_height(), "Raylib pixel fill test", 4) //  4 = ConfigFlags.WINDOW_RESIZABLE
        image = Image.from_Color(Options.screen_width(), Options.screen_height(), Color.from_u24(0xFFFFFF))
        image.setFormat(7) // 7 = PixelFormat.UNCOMPRESSED_R8G8B8A8
        texture = Texture.from_Image(image)
        pixeldata = image.pixeldata()
        t_lastframe = Time.millis()
        mainloop()

    fun ref setpixel(x: USize, y: USize, color: U32) => // create "shaded" quad pixels
        var row_offset: USize = 0
        let row_width = Options.screen_width().usize()
        (let r, let g, let b) = Color.to_rgb_tuple(color)
        let dimcolor = Color.from_rgb(2*(r/3), 2*(g/3), 2*(b/3))
        let dimmercolor = Color.from_rgb(r/2, g/2, b/2)        
        let base =  4 * ((y * row_width) + x)
        try
            // row 1
            pixeldata(base)? = dimmercolor // color
            pixeldata(base + 1)? = dimcolor
            pixeldata(base + 2)? = dimcolor
            pixeldata(base + 3)? = dimmercolor // color
            // row 2
            row_offset = row_width
            pixeldata(base + row_offset)? = dimcolor
            pixeldata(base + row_offset + 1)? = color
            pixeldata(base + row_offset + 2)? = color
            pixeldata(base + row_offset + 3)? = dimcolor
            // row 3
            row_offset = row_offset + row_width
            pixeldata(base + row_offset)? = dimcolor
            pixeldata(base + row_offset + 1)? = color
            pixeldata(base + row_offset + 2)? = color
            pixeldata(base + row_offset + 3)? = dimcolor
            // row 4
            row_offset = row_offset + row_width
            pixeldata(base + row_offset)? = dimmercolor // color
            pixeldata(base + row_offset + 1)? = dimcolor
            pixeldata(base + row_offset + 2)? = dimcolor
            pixeldata(base + row_offset + 3)? = dimmercolor // color
        end

    fun ref randpixel() =>
        var row_offset: USize = 0
        let row_width = Options.screen_width().usize()
        let vheight = Options.vscreen_height().usize()
        let vwidth = Options.vscreen_width().usize()
        for j in Range(0, vheight) do // rows
            for i in Range(0, vwidth) do // columns
                let color: U32 = 0xFF000000 + sr.rand(0xFFFFFF)
                setpixel(i, j, color)
            end
        end

    fun ref clear(color: U32) =>
        let row_width = Options.screen_width().usize()
        try
            for i in Range(0, Options.screen_width().usize() * Options.screen_height().usize()) do // columns
                pixeldata(i)? = color // color
            end
        end

    be mainloop() =>
        let src = Rectangle(0.0, 0.0, Options.screen_width().f32(), Options.screen_height().f32())
        let dst = Rectangle(0.0, 0.0, renderer.getScreenWidth().f32(), renderer.getScreenHeight().f32())
        let tint = Color.from_rgb(255, 255, 255)
        if not renderer.windowShouldClose() then
            let t_now = Time.millis()
            frames = frames + 1
            randpixel()
            renderer.draw(
                {() => 
                    texture.update(pixeldata)
                    CoreFuncs.clearBackground(Color.from_u24(0xAF4F6F))
                    texture.draw(src, dst, Vector2(0, 0), 0.0, Color.from_u24(0xFFFFFF))
                })
            // FPS info
            if (t_now- t_lastframe) > 1000 then
                @fprintf(@pony_os_stdout(), "FPS: %s\n".cstring(), frames.string().cstring())
                frames = 0
                t_lastframe = t_now
            end            
            mainloop()
        else
            texture.destroy()
            image.destroy()
            renderer.close()
        end
