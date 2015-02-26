package main

import "code.google.com/p/go-tour/reader"

type MyReader struct{}

func (r MyReader) Read(b []byte) (n int, err error) {
	b[0] = 'A'
	return 1, nil
}

func main() {
	reader.Validate(MyReader{})
}
