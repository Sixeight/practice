package main

import (
	"image"
	"image/color"

	"code.google.com/p/go-tour/pic"
)

type Image struct{}

func (i Image) ColorModel() color.Model {
	return color.RGBAModel
}

func (i Image) Bounds() image.Rectangle {
	return image.Rect(0, 0, 255, 255)
}

func (i Image) At(x, y int) color.Color {
	v := byte(x * y)
	return color.RGBA{v, v, 255, 255}
}

func main() {
	m := Image{}
	pic.ShowImage(m)
}
