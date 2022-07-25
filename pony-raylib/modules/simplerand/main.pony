use "time"

/* from Wikipedia...
uint32_t lcg_parkmiller(uint32_t *state)
{
    // Precomputed parameters for Schrage's method
    const uint32_t M = 0x7fffffff;
    const uint32_t A = 48271;
    const uint32_t Q = M / A;    // 44488
    const uint32_t R = M % A;    //  3399

    uint32_t div = *state / Q;  // max: M / Q = A = 48,271
    uint32_t rem = *state % Q;  // max: Q - 1     = 44,487

    int32_t s = rem * A;    // max: 44,487 * 48,271 = 2,147,431,977 = 0x7fff3629
    int32_t t = div * R;    // max: 48,271 *  3,399 =   164,073,129
    int32_t result = s - t;

    if (result < 0)
        result += M;

    return *state = result;
}
*/

class SimpleRand
    var seed: U32
    let a: U32 = 48271
    let m: U32 = 0x7FFFFFFF
    let q: U32 = m / a // m div a
    let r: U32 = m % a // m mod a

    new create(s: U32 = 0) =>
        if s != 0 then
            seed = s
        else
            seed = 7051833
        end

    new init(s: U32 = 0) =>
        if s != 0 then
            seed = s
        else
            seed = Time.millis().u32_unsafe()
        end

    fun getseed(): U32 =>
        seed

    fun ref setseed(s: U32) =>
        if s != 0 then
            seed = s
        end

    fun ref randomize() =>
        seed = Time.millis().u32_unsafe()

    fun ref rand(upper_limit: U32 = 0x7FFFFFFF): U32 =>
        // Integer Version 2
        var div: U32 = seed / q
        var rem: U32 = seed % q
        var s: I32 = (rem * a).i32_unsafe()
        var t: I32 = (div * r).i32_unsafe()
        var test = s - t
        if test > 0 then
            seed = test.u32_unsafe()
        else
            seed = (test + m.i32_unsafe()).u32_unsafe()
        end
        seed % upper_limit

    fun ref irand(upper_limit: U32 = 0x7FFFFFFF): I32 =>
        // Integer Version 2
        var div: U32 = seed / q
        var rem: U32 = seed % q
        var s: I32 = (rem * a).i32_unsafe()
        var t: I32 = (div * r).i32_unsafe()
        var test = s - t
        if test > 0 then
            seed = test.u32_unsafe()
        else
            seed = (test + m.i32_unsafe()).u32_unsafe()
        end
        (seed % upper_limit).i32_unsafe()

    fun ref frand(): F32 =>
        var div: U32 = seed / q
        var rem: U32 = seed % q
        var s: I32 = (rem * a).i32_unsafe()
        var t: I32 = (div * r).i32_unsafe()
        var test = s - t
        if test > 0 then
            seed = test.u32_unsafe()
        else
            seed = (test + m.i32_unsafe()).u32_unsafe()
        end
        seed.f32_unsafe() / m.f32_unsafe()
