// Import necessary modules from the standard library
use std::io;
use std::cmp::Ordering;
use std::fmt;

// Define a custom struct
struct Point {
    x: i32,
    y: i32,
}

// Implement the Display trait for the Point struct
impl fmt::Display for Point {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "({}, {})", self.x, self.y)
    }
}

fn main() {
    println!("Enter a number:");

    // Read user input
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    // Convert user input to a number
    let input: i32 = match input.trim().parse() {
        Ok(num) => num,
        Err(_) => {
            println!("Not a valid number.");
            return;
        }
    };

    // Call custom function and match its result
    match compare_to_ten(input) {
        Ordering::Less => println!("{} is less than 10", input),
        Ordering::Greater => println!("{} is greater than 10", input),
        Ordering::Equal => println!("{} is equal to 10", input),
    }

    // Create a custom struct instance
    let point = Point { x: 3, y: 5 };

    // Print the custom struct using the implemented Display trait
    println!("The point is at: {}", point);
}

// Custom function to compare a number to 10
fn compare_to_ten(num: i32) -> Ordering {
    if num < 10 {
        Ordering::Less
    } else if num > 10 {
        Ordering::Greater
    } else {
        Ordering::Equal
    }
}
