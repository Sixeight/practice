package main

import "fmt"

func fibonacci() func() int {
	a, b := 0, 0
	return func() int {
		ret := a + b
		if ret == 0 {
			ret = 1
		}
		a, b = b, ret
		return ret
	}
}

func main() {
	f := fibonacci()
	for i := 0; i < 10; i++ {
		fmt.Println(f())
	}
}
