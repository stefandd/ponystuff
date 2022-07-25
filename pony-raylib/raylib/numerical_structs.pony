use @DebugMatrix[None](m: MatrixPtr)
use @DebugMatrixArr[None](m: Pointer[F32] tag)
use @rlGetMatrixModelviewA[None](m: MatrixPtr)
use @rlGetMatrixProjectionA[None](m: MatrixPtr)

type RectPtr is NullablePointer[Rectangle]
type Vector2Ptr is NullablePointer[Vector2]
type Vector3Ptr is NullablePointer[Vector3]
type Vector4Ptr is NullablePointer[Vector4]
type MatrixPtr is NullablePointer[Matrix]

struct Rectangle //sizeof(Rectangle) = 16
    let left: F32
    let top: F32
    let width: F32
    let height: F32
    var _ptr: RectPtr = RectPtr.none()

    new create(left': F32, top': F32, width': F32, height': F32) =>
        left = left'; top = top'; width = width'; height = height'
        _ptr = RectPtr(this)

    new from_u128(chunk: U128) =>
        left = 0; top = 0; width = 0; height = 0
        _ptr = RectPtr(this)
        var tmp: U128 = chunk
        @memcpy(_ptr, addressof tmp, USize(16))

    // Pony structs are passed by reference so for functions that need the struct itself we have to map to a value
    fun ref u128(): U128 =>
        var tmp: U128 = 0
        @memcpy(addressof tmp, _ptr, USize(16))
        tmp

    fun ref ptr(): RectPtr =>
        _ptr

struct Vector2 is Stringable // sizeof(Vector2) = 8
    var x: F32
    var y: F32
    var _ptr: Vector2Ptr = Vector2Ptr.none()

    new create(x': F32, y': F32) =>
        x = x'; y = y'
        _ptr = Vector2Ptr(this)

    new from_u64(chunk: U64) =>
        x = 0; y = 0
        _ptr = Vector2Ptr(this)
        var tmp: U64 = chunk
        @memcpy(_ptr, addressof tmp, USize(8))

    // Pony structs are passed by reference so for functions that need the struct itself we have to map to a value
    fun ref u64(): U64 =>
        var tmp: U64 = 0
        @memcpy(addressof tmp, _ptr, USize(8))
        tmp

    fun ref ptr(): Vector2Ptr =>
        _ptr

    fun box string(): String iso^ =>
        "(" + x.string() + ", " + y.string() + ")"

struct Vector3 is Stringable // sizeof(Vector3) = 12
    var x: F32
    var y: F32
    var z: F32
    var _ptr: Vector3Ptr = Vector3Ptr.none()

    new create(x': F32, y': F32, z': F32) =>
        x = x'; y = y'; z = z'
        _ptr = Vector3Ptr(this)

    fun ref ptr(): Vector3Ptr =>
        _ptr

    fun print() =>
        @fprintf(@pony_os_stdout(), "x: %f, y: %f, z: %f\n".cstring(), this.x, this.y, this.z)

    fun box string(): String iso^ =>
        "(" + x.string() + ", " + y.string() + ", " + z.string() + ")"

struct Vector4 is Stringable // sizeof(Vector4) = 16
    var x: F32
    var y: F32
    var z: F32
    var w: F32
    var _ptr: Vector4Ptr = Vector4Ptr.none()

    new create(x': F32, y': F32, z': F32, w': F32) =>
        x = x'; y = y'; z = z'; w = w'
        _ptr = Vector4Ptr(this)

    new from_u128(chunk: U128) =>
        x = 0; y = 0; z = 0; w = 0
        _ptr = Vector4Ptr(this)
        var tmp: U128 = chunk
        @memcpy(_ptr, addressof tmp, USize(16))

    // Pony structs are passed by reference so for functions that need the struct itself we have to map to a value
    fun ref u128(): U128 =>
        var tmp: U128 = 0
        @memcpy(addressof tmp, _ptr, USize(16))
        tmp

    fun ref ptr(): Vector4Ptr =>
        _ptr

    fun print() =>
        @fprintf(@pony_os_stdout(), "x: %f, y: %f, z: %f, w: %f\n".cstring(), this.x, this.y, this.z, this.w)

    fun box string(): String iso^ =>
        "(" + x.string() + ", " + y.string() + ", " + z.string() + ", " + w.string() + ")"

struct Matrix is Stringable // sizeof(Matrix) = 64
// Matrix, 4x4 components, column major, OpenGL style, right handed
    var m0: F32
    var m4: F32
    var m8: F32
    var m12: F32
    var m1: F32
    var m5: F32
    var m9: F32
    var m13: F32
    var m2: F32
    var m6: F32
    var m10: F32
    var m14: F32
    var m3: F32
    var m7: F32
    var m11: F32
    var m15: F32
    var _ptr: MatrixPtr = MatrixPtr.none()

    new create() =>
        m0 = 0;  m4 = 0;  m8 =  0;  m12 = 0
        m1 = 0;  m5 = 0;  m9 =  0;  m13 = 0
        m2 = 0;  m6 = 0;  m10 = 0;  m14 = 0
        m3 = 0;  m7 = 0;  m11 = 0;  m15 = 0
        _ptr = MatrixPtr(this)

    new eye() =>
        m0 = 1;  m4 = 0;  m8 =  0;  m12 = 0
        m1 = 0;  m5 = 1;  m9 =  0;  m13 = 0
        m2 = 0;  m6 = 0;  m10 = 1;  m14 = 0
        m3 = 0;  m7 = 0;  m11 = 0;  m15 = 1
        _ptr = MatrixPtr(this)

    new ones() =>
        m0 = 1;  m4 = 1;  m8 =  1;  m12 = 1
        m1 = 1;  m5 = 1;  m9 =  1;  m13 = 1
        m2 = 1;  m6 = 1;  m10 = 1;  m14 = 1
        m3 = 1;  m7 = 1;  m11 = 1;  m15 = 1
        _ptr = MatrixPtr(this)

    new debugmat() =>
         m0 = 1;  m4 = 2;  m8 = 2;  m12 = 1
         m1 = 2;  m5 = 1;  m9 = 5;  m13 = 2
         m2 = 2;  m6 = 5;  m10 = 1;  m14 = 1
         m3 = 1;  m7 = 2;  m11 = 1;  m15 = 3
        _ptr = MatrixPtr(this)

    new onethroughsixteen() =>
         m0 = 1;  m4 = 2;  m8 = 3;  m12 = 4
         m1 = 5;  m5 = 6;  m9 = 7;  m13 = 8
         m2 = 9;  m6 = 10;  m10 = 11;  m14 = 12
         m3 = 13;  m7 = 14;  m11 = 15;  m15 = 16
        _ptr = MatrixPtr(this)

    new multiply(left: Matrix, right: Matrix) =>
        m0 = (left.m0*right.m0) + (left.m1*right.m4) + (left.m2*right.m8) + (left.m3*right.m12)
        m1 = (left.m0*right.m1) + (left.m1*right.m5) + (left.m2*right.m9) + (left.m3*right.m13)
        m2 = (left.m0*right.m2) + (left.m1*right.m6) + (left.m2*right.m10) + (left.m3*right.m14)
        m3 = (left.m0*right.m3) + (left.m1*right.m7) + (left.m2*right.m11) + (left.m3*right.m15)
        m4 = (left.m4*right.m0) + (left.m5*right.m4) + (left.m6*right.m8) + (left.m7*right.m12)
        m5 = (left.m4*right.m1) + (left.m5*right.m5) + (left.m6*right.m9) + (left.m7*right.m13)
        m6 = (left.m4*right.m2) + (left.m5*right.m6) + (left.m6*right.m10) + (left.m7*right.m14)
        m7 = (left.m4*right.m3) + (left.m5*right.m7) + (left.m6*right.m11) + (left.m7*right.m15)
        m8 = (left.m8*right.m0) + (left.m9*right.m4) + (left.m10*right.m8) + (left.m11*right.m12)
        m9 = (left.m8*right.m1) + (left.m9*right.m5) + (left.m10*right.m9) + (left.m11*right.m13)
        m10 = (left.m8*right.m2) + (left.m9*right.m6) + (left.m10*right.m10) + (left.m11*right.m14)
        m11 = (left.m8*right.m3) + (left.m9*right.m7) + (left.m10*right.m11) + (left.m11*right.m15)
        m12 = (left.m12*right.m0) + (left.m13*right.m4) + (left.m14*right.m8) + (left.m15*right.m12)
        m13 = (left.m12*right.m1) + (left.m13*right.m5) + (left.m14*right.m9) + (left.m15*right.m13)
        m14 = (left.m12*right.m2) + (left.m13*right.m6) + (left.m14*right.m10) + (left.m15*right.m14)
        m15 = (left.m12*right.m3) + (left.m13*right.m7) + (left.m14*right.m11) + (left.m15*right.m15)
        _ptr = MatrixPtr(this)

    fun ref dot(mat: Matrix): Matrix =>
        let result: Matrix = Matrix.create()
        result.m0 = (this.m0*mat.m0) + (this.m1*mat.m4) + (this.m2*mat.m8) + (this.m3*mat.m12)
        result.m1 = (this.m0*mat.m1) + (this.m1*mat.m5) + (this.m2*mat.m9) + (this.m3*mat.m13)
        result.m2 = (this.m0*mat.m2) + (this.m1*mat.m6) + (this.m2*mat.m10) + (this.m3*mat.m14)
        result.m3 = (this.m0*mat.m3) + (this.m1*mat.m7) + (this.m2*mat.m11) + (this.m3*mat.m15)
        result.m4 = (this.m4*mat.m0) + (this.m5*mat.m4) + (this.m6*mat.m8) + (this.m7*mat.m12)
        result.m5 = (this.m4*mat.m1) + (this.m5*mat.m5) + (this.m6*mat.m9) + (this.m7*mat.m13)
        result.m6 = (this.m4*mat.m2) + (this.m5*mat.m6) + (this.m6*mat.m10) + (this.m7*mat.m14)
        result.m7 = (this.m4*mat.m3) + (this.m5*mat.m7) + (this.m6*mat.m11) + (this.m7*mat.m15)
        result.m8 = (this.m8*mat.m0) + (this.m9*mat.m4) + (this.m10*mat.m8) + (this.m11*mat.m12)
        result.m9 = (this.m8*mat.m1) + (this.m9*mat.m5) + (this.m10*mat.m9) + (this.m11*mat.m13)
        result.m10 = (this.m8*mat.m2) + (this.m9*mat.m6) + (this.m10*mat.m10) + (this.m11*mat.m14)
        result.m11 = (this.m8*mat.m3) + (this.m9*mat.m7) + (this.m10*mat.m11) + (this.m11*mat.m15)
        result.m12 = (this.m12*mat.m0) + (this.m13*mat.m4) + (this.m14*mat.m8) + (this.m15*mat.m12)
        result.m13 = (this.m12*mat.m1) + (this.m13*mat.m5) + (this.m14*mat.m9) + (this.m15*mat.m13)
        result.m14 = (this.m12*mat.m2) + (this.m13*mat.m6) + (this.m14*mat.m10) + (this.m15*mat.m14)
        result.m15 = (this.m12*mat.m3) + (this.m13*mat.m7) + (this.m14*mat.m11) + (this.m15*mat.m15)
        result

    fun inverse(): Matrix =>
        let result: Matrix = Matrix.create()
        // caching
        let b00 = (m0*m5  ) - (m1*m4  )
        let b01 = (m0*m6  ) - (m2*m4  )
        let b02 = (m0*m7  ) - (m3*m4  )
        let b03 = (m1*m6  ) - (m2*m5  )
        let b04 = (m1*m7  ) - (m3*m5  )
        let b05 = (m2*m7  ) - (m3*m6  )
        let b06 = (m8*m13 ) - (m9*m12 )
        let b07 = (m8*m14 ) - (m10*m12)
        let b08 = (m8*m15 ) - (m11*m12)
        let b09 = (m9*m14 ) - (m10*m13)
        let b10 = (m9*m15 ) - (m11*m13)
        let b11 = (m10*m15) - (m11*m14)
        // calculate the invert determinant (inlined to avoid double-caching)
        let invDet: F32 = 1.0/(((b00*b11) - (b01*b10)) + (b02*b09) + ((b03*b08) - (b04*b07)) + (b05*b06))
        //@fprintf(@pony_os_stdout(), "det = %f\n".cstring(), invDet.f64())
        result.m0 = (((m5*b11) - (m6*b10)) + (m7*b09)) * invDet
        result.m1 = ((-m1*b11) + ((m2*b10) - (m3*b09))) * invDet
        result.m2 = (((m13*b05) - (m14*b04)) + (m15*b03)) * invDet
        result.m3 = ((-m9*b05) + ((m10*b04) - (m11*b03))) * invDet
        result.m4 = ((-m4*b11) + ((m6*b08) - (m7*b07))) * invDet
        result.m5 = (((m0*b11) - (m2*b08)) + (m3*b07)) * invDet
        result.m6 = ((-m12*b05) + ((m14*b02) - (m15*b01))) * invDet
        result.m7 = (((m8*b05) - (m10*b02)) + (m11*b01)) * invDet
        result.m8 = (((m4*b10) - (m5*b08)) + (m7*b06)) * invDet
        result.m9 = ((-m0*b10) + ((m1*b08) - (m3*b06))) * invDet
        result.m10 = (((m12*b04) - (m13*b02)) + (m15*b00)) * invDet
        result.m11 = ((-m8*b04) + ((m9*b02) - (m11*b00))) * invDet
        result.m12 = ((-m4*b09) + ((m5*b07) - (m6*b06))) * invDet
        result.m13 = (((m0*b09) - (m1*b07)) + (m2*b06)) * invDet
        result.m14 = ((-m12*b03) + ((m13*b01) - (m14*b00))) * invDet
        result.m15 = (((m8*b03) - (m9*b01)) + (m10*b00)) * invDet
        result

    new modelview() =>
        m0 = 0;  m4 = 0;  m8 =  0;  m12 = 0
        m1 = 0;  m5 = 0;  m9 =  0;  m13 = 0
        m2 = 0;  m6 = 0;  m10 = 0;  m14 = 0
        m3 = 0;  m7 = 0;  m11 = 0;  m15 = 0
        _ptr = MatrixPtr(this)
        @rlGetMatrixModelviewA(_ptr)

    new projection() =>
        m0 = 0;  m4 = 0;  m8 =  0;  m12 = 0
        m1 = 0;  m5 = 0;  m9 =  0;  m13 = 0
        m2 = 0;  m6 = 0;  m10 = 0;  m14 = 0
        m3 = 0;  m7 = 0;  m11 = 0;  m15 = 0
        _ptr = MatrixPtr(this)
        @rlGetMatrixProjectionA(_ptr)

    fun ref zero() =>
        m0 = 0;  m4 = 0;  m8 =  0;  m12 = 0
        m1 = 0;  m5 = 0;  m9 =  0;  m13 = 0
        m2 = 0;  m6 = 0;  m10 = 0;  m14 = 0
        m3 = 0;  m7 = 0;  m11 = 0;  m15 = 0

    fun ref toF32Array(): Array[F32] =>
        let arr = Array[F32]
        arr.push(m0)
        arr.push(m1)
        arr.push(m2)
        arr.push(m3)
        arr.push(m4)
        arr.push(m5)
        arr.push(m6)
        arr.push(m7)
        arr.push(m8)
        arr.push(m9)
        arr.push(m10)
        arr.push(m11)
        arr.push(m12)
        arr.push(m13)
        arr.push(m14)
        arr.push(m15)
        arr

    fun ref ptr(): MatrixPtr =>
        _ptr

    fun box string(): String iso^ =>
        "(" + m0.string() + ", " + m4.string() + ", " + m8.string() + ", " + m12.string() + ")\n" +
        "(" + m1.string() + ", " + m5.string() + ", " + m9.string() + ", " + m13.string() + ")\n" + 
        "(" + m2.string() + ", " + m6.string() + ", " + m10.string() + ", " + m14.string() + ")\n" +
        "(" + m3.string() + ", " + m7.string() + ", " + m11.string() + ", " + m15.string() + ")"        

    fun ref cdebug() =>
        @DebugMatrix(_ptr)

/*
actor Main

    new create(env: Env) =>
        let m = Matrix.eye()
        let m2 = Matrix.multiply(m, Matrix.eye())
        //env.out.print(m2.string())
        m2.cdebug()
        @fprintf(@pony_os_stdout(), "\n".cstring())
        let m3 = Matrix.onethroughsixteen()
        m3.cdebug()
        @fprintf(@pony_os_stdout(), "\n".cstring())
        let m3arr = m3.toF32Array()
        @DebugMatrixArr(m3arr.cpointer())
        @fprintf(@pony_os_stdout(), "\n".cstring())
        let m4 = Matrix.debugmat()
        @fprintf(@pony_os_stdout(), "%s\n".cstring(), m4.string().cstring())
        @fprintf(@pony_os_stdout(), "%s\n".cstring(), m4.inverse().string().cstring())
*/