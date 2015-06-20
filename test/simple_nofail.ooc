use check
import check

if (!isTrue?(true)) {
    raise("want true")
}

if (failed?()) {
    exit(1)
}
