use check
import check

chk := Check new("ok")

chk run(|| 
    if (!chk isTrue?(true)) {
        "isTrue returned false" println()
        exit(1)
    }

    if (!chk isFalse?(false)) {
        "isFalse returned false" println()
        exit(1)
    }

    if (!chk isTrue?("abc" == "abc")) {
        "isTrue (String) returned false" println()
    }
)
