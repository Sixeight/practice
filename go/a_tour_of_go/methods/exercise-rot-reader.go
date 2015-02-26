package main

import (
	"io"
	"os"
	"strings"
)

type rot13Reader struct {
	r io.Reader
}

const (
	original = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
	rotate   = "NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm"
)

func (rot *rot13Reader) Read(b []byte) (n int, err error) {
	sb := make([]byte, 8)
	o := 0
	for {
		in, ierr := rot.r.Read(sb)
		if ierr != nil {
			if ierr == io.EOF {
				break
			}
			return 0, ierr
		}
		for i, s := range sb[:in] {
			idx := strings.Index(original, string(s))
			if idx < 0 {
				b[i+o] = s
			} else {
				b[i+o] = rotate[idx]
			}
		}
		o += in
	}
	return o, io.EOF
}

func main() {
	s := strings.NewReader("Lbh penpxrq gur pbqr!")
	r := rot13Reader{s}
	io.Copy(os.Stdout, &r)
}
