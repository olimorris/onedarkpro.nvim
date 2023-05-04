package main

import (
	"fmt"
	"math"
)

const (
	PI       = 3.14159265359
	Greeting = "Hello, world!"
)

type Shape interface {
	Area() float64
}

type Circle struct {
	Radius float64
}

func (c Circle) Area() float64 {
	return PI * math.Pow(c.Radius, 2)
}

type Rectangle struct {
	Length float64
	Width  float64
}

func (r Rectangle) Area() float64 {
	return r.Length * r.Width
}

func printArea(s Shape) {
	fmt.Printf("The area of the shape is %.2f.\n", s.Area())
}

func main() {
	fmt.Println(Greeting)

	circle := Circle{Radius: 5}
	rectangle := Rectangle{Length: 4, Width: 4}

	printArea(circle)
	printArea(rectangle)
}
