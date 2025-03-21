fn runtimeSafetyDefault() callconv(.naked) void {
    unreachable;
}

fn runtimeSafetyOn() callconv(.naked) void {
    @setRuntimeSafety(true);
    unreachable;
}

fn runtimeSafetyOff() callconv(.naked) void {
    @setRuntimeSafety(false);
    unreachable;
}

comptime {
    _ = &runtimeSafetyDefault;
    _ = &runtimeSafetyOn;
    _ = &runtimeSafetyOff;
}

// error
// backend=stage2
// target=native
//
// :2:5: error: runtime safety check not allowed in naked function
// :2:5: note: use @setRuntimeSafety to disable runtime safety
// :2:5: note: the end of a naked function is implicitly unreachable
// :7:5: error: runtime safety check not allowed in naked function
// :7:5: note: use @setRuntimeSafety to disable runtime safety
// :7:5: note: the end of a naked function is implicitly unreachable
