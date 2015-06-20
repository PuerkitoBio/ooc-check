//! shouldcrash

use check
import check

noBacktrace() run(|| 
    if (isTrue?(false, "isTrue with %s%s%s", "wrong", " ", "value")) {
        "isTrue returned true" println()
        exit(1)
    }

    if (isFalse?(true)) {
        "isFalse returned true" println()
        exit(1)
    }

    if (isTrue?(0 == 1)) {
        "isTrue (Int)returned true" println()
        exit(1)
    }
)
