import lang/Backtrace

Check: class {
    name: String
    failed? := false
    backtrace? := true

    init: func(=name)

    run: func(f: Func()) {
        try {
            f()
        } catch (e: Exception) {
            failed? = true
            _printFailure(e message)
        }
        if (failed?) {
            exit(1)
        }
    }

    isTrue?: func (v: Bool) -> Bool {
        isTrue?(v, "")
    }

    isTrue?: func ~withMsg (v: Bool, msg: String, args: ...) -> Bool {
        if (!v) {
            failed? = true

            _printFailure(msg format(args))
        }
        v
    }

    isFalse?: func(v: Bool) -> Bool {
        isTrue?(!v)
    }

    isFalse?: func ~withMsg (v: Bool, msg: String, args: ...) -> Bool {
        isTrue?(!v, msg, args)
    }

    isTrue!: func(v: Bool) {
        if (!isTrue?(v)) { exit(1) }
    }

    isTrue!: func ~withMsg (v: Bool, msg: String, args: ...) {
        if (!isTrue?(v, msg, args)) { exit(1) }
    }

    isFalse!: func(v: Bool) {
        if (!isFalse?(v)) { exit(1) }
    }

    isFalse!: func ~withMsg (v: Bool, msg: String, args: ...) {
        if (!isFalse?(v, msg, args)) { exit(1) }
    }

    _printFailure: func (msg: String) {
        // print the message to stdout - sam takes care of the output
        // when a test suite fails.
        buf := Buffer new()
        buf append(">>>>>> #{name} failed")
        if (!msg empty?()) {
            buf append(": %s" format(msg))
        }
        buf println()
        if (backtrace?) {
            "-" times(buf size) println()
        }

        if (backtrace?) {
            Exception getCurrentBacktrace() println()
        }
    }
}

// top-level functions are proxy for a default Check instance.

_default := Check new("check")

run: func(f: Func()) {
    _default run(f)
}

noBacktrace: func() -> Check {
    _default backtrace? = false
    _default
}

backtrace: func() -> Check {
    _default backtrace? = true
    _default
}

failed?: func() -> Bool {
    _default failed?
}

isTrue?: func(v: Bool) -> Bool {
    _default isTrue?(v)
}

isTrue?: func ~withMsg (v: Bool, msg: String, args:...) -> Bool {
    _default isTrue?(v, msg, args)
}

isFalse?: func(v: Bool) -> Bool {
    _default isFalse?(v)
}

isFalse?: func ~withMsg (v: Bool, msg: String, args: ...) -> Bool {
    _default isFalse?(v, msg, args)
}

isTrue!: func(v: Bool) {
    _default isTrue!(v)
}

isTrue!: func ~withMsg (v: Bool, msg: String, args: ...) {
    _default isTrue!(v, msg, args)
}

isFalse!: func(v: Bool) {
    _default isFalse!(v)
}

isFalse!: func ~withMsg (v: Bool, msg: String, args: ...) {
    _default isFalse!(v, msg, args)
}

