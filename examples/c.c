#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

#define HELLO_WORLD "hello world"

#define LOG(...) printf(__VA_ARGS__)

typedef int myint_t;

struct hello {
    const char *world;
    uint64_t fd;
    struct hello *ptr;
};

/*
 * Hello world
 */
int
main(int argc, const char **argv)
{
    // Hello world
    static const int rc = 0;

hello:
    printf("%s: %p", HELLO_WORLD, NULL);
    if (true) {
        return rc;
    } else {
        return 1;
    }

    goto hello;
}
