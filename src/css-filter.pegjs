
/**
 *
 *
 */

start
  = none / filterFunctionList

filterFunctionList
  = filterFunction+
 
filterFunction
  = blur
  / brightness
  / contrast
  / dropShadow
  / grayscale
  / hueRotate
  / invert
  / opacity
  / saturate
  / sepia

blur "blur()"
  = _ "blur(" _ length:length _ ")" _ { return { type: "blur", length } }

brightness "brightness()"
  = _ "brightness(" _ value:numberPercentage _ ")" _ { return { type: "brightness", value } }

contrast "contrast()"
  = _ "contrast(" _ value:numberPercentage _ ")" _ { return { type: "contrast", value } }

dropShadow "drop-shadow()"
  = _ "drop-shadow(" _ length _ length _ length? _ color? _ ")" _ { return { type: "drop-shadow" } }

grayscale "grayscale()"
  = _ "grayscale(" _ value:numberPercentage _ ")" _ { return { type: "grayscale", value } }

hueRotate "hue-rotate()"
  = _ "hue-rotate(" _ angle:angle _ ")" _ { return { type: "hue-rotate", angle } }

invert "invert()"
  = _ "invert(" _ value:numberPercentage _ ")" _ { return { type: "invert", value } }

opacity "opacity()"
  = _ "opacity(" _ value:numberPercentage _ ")" _ { return { type: "opacity", value } }

saturate "saturate()"
  = _ "saturate(" _ value:numberPercentage _ ")" _ { return { type: "saturate", value } }

sepia "sepia()"
  = _ "sepia(" _ value:numberPercentage _ ")" _ { return { type: "sepia", value } }
 
numberPercentage "<number-percentage>"
  = number
  / percentage
 
// https://developer.mozilla.org/en-US/docs/Web/CSS/number
number "<number>"
  = [0-9]+ { return parseInt(text(), 10) }
  / [0-9]+ "." [0-9]+ { return parseFloat(text()) }

signedNumber "<signedNumber>"
  = "+" ? value:number { return value }
  / "-" value:number { return -value }

// https://developer.mozilla.org/en-US/docs/Web/CSS/percentage
percentage "<percentage>"
  = value:number "%" { return value / 100 }

// https://developer.mozilla.org/en-US/docs/Web/CSS/angle
angle "<angle>"
  = value:signedNumber unit:angleUnit { return value * unit }
  / "0" angleUnit? { return 0; }

angleUnit "<unit>"
  = "deg" { return 1 }
  / "grad" { return 1 }
  / "rad" { return 1 }
  / "turn" { return 1 }

// https://developer.mozilla.org/en-US/docs/Web/CSS/length
length "<length>"
  = value:number unit:lengthUnit { return value * unit }
  / "0" lengthUnit? { return 0; }

lengthUnit
  = "px" { return 1; }
  / "cm" { return 96 / 2.54; }
  / "mm" { return 96 / 2.54 / 10; }
  / "Q"  { return 96 / 2.54 / 40; }
  / "in" { return 96; }
  / "pc" { return 96 / 6; }
  / "pt" { return 96 / 73; }

color
  = expr:number
 
_ "whitespace"
  = [ \t\n\r]*

none "none"
  = "none" { return null; }
 
