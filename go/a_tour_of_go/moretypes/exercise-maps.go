package main

import (
	"strings"

	"code.google.com/p/go-tour/wc"
)

func WordCount(s string) map[string]int {
	countMap := make(map[string]int)
	words := strings.Fields(s)
	for _, word := range words {
		countMap[word] += 1
	}
	return countMap
}

func main() {
	wc.Test(WordCount)
}
