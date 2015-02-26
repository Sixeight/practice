package main

import (
	"fmt"
	"math"
)

func Sqrt(x float64) float64 {
	z := 1.0
	delta := 1.0
	var next float64
	for delta > 0.000001 {
		next = z - (math.Pow(z, 2)-x)/(z*2)
		delta = math.Abs(next - z)
		z = next
	}
	return z
}

func main() {
	fmt.Println(Sqrt(2))
	fmt.Println(math.Sqrt(2))
}
