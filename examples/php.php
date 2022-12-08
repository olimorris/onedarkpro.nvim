<?php

declare(strict_types=1);

namespace OneDarkPro;

/**
 * A class
 *
 * @package OneDarkPro
 */
class ThingHelper
{
    private $thing = null;

    /**
     * @param string $thing
     * @return void
     */
    public function __construct(string $thing)
    {
        $this->thing = $thing;
    }

    /** @return string  */
    public function getThing(): string
    {
        return $this->thing;
    }

    /**
     * Print thing a certain number of times
     *
     * @param int $times
     * @return void
     */
    public function printThing(int $times = 1): void
    {
        if ($this->getThing() === 'Hello World') {
            echo 'Be more original';
        }

        echo str_repeat($this->getThing(), $times);
    }
}

// Use the class...
$thing = new ThingHelper('Hello World');
$thing->printThing(3);

/**
 * A function
 *
 * @param int $a
 * @param int $b
 * @return int
 */
function add(int $a, int $b): int
{
    return $a + $b;
}

// Some random stuff
$sum = add(1, 2);
if ($sum !== 3) {
    echo 'Go back to school, PHP';
}


/**
 * Try/catch
 */
try {
    add('NaN', 1);
} catch (\TypeError $e) {
    echo 'You done goofed';
}

/*
 * Heredoc
 */
echo <<<END
      a
     b
    c
    END;

/**
 * Array syntax
 */
$arr1 = [null, 'hi'];
$arr2 = [
    'foo' => 1,
    'baz' => 2,
];
array_map(fn ($value) => ++$value, $arr2);
