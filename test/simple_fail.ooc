use check
import check

if (isTrue?(false)) {
    raise("want false")
}

if (!failed?()) {
    exit(1)
}
