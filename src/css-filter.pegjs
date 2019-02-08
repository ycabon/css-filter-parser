
/**
 *
 *
 */

{

  var colorMap = {
    transparent: [0, 0, 0, 0],
    black: [0, 0, 0],
    silver: [192, 192, 192],
    gray: [128, 128, 128],
    white: [255, 255, 255],
    maroon: [128, 0, 0],
    red: [255, 0, 0],
    purple: [128, 0, 128],
    fuchsia: [255, 0, 255],
    green: [0, 128, 0],
    lime: [0, 255, 0],
    olive: [128, 128, 0],
    yellow: [255, 255, 0],
    navy: [0, 0, 128],
    blue: [0, 0, 255],
    teal: [0, 128, 128],
    aqua: [0, 255, 255],
    aliceblue: [240, 248, 255],
    antiquewhite: [250, 235, 215],
    aquamarine: [127, 255, 212],
    azure: [240, 255, 255],
    beige: [245, 245, 220],
    bisque: [255, 228, 196],
    blanchedalmond: [255, 235, 205],
    blueviolet: [138, 43, 226],
    brown: [165, 42, 42],
    burlywood: [222, 184, 135],
    cadetblue: [95, 158, 160],
    chartreuse: [127, 255, 0],
    chocolate: [210, 105, 30],
    coral: [255, 127, 80],
    cornflowerblue: [100, 149, 237],
    cornsilk: [255, 248, 220],
    crimson: [220, 20, 60],
    cyan: [0, 255, 255],
    darkblue: [0, 0, 139],
    darkcyan: [0, 139, 139],
    darkgoldenrod: [184, 134, 11],
    darkgray: [169, 169, 169],
    darkgreen: [0, 100, 0],
    darkgrey: [169, 169, 169],
    darkkhaki: [189, 183, 107],
    darkmagenta: [139, 0, 139],
    darkolivegreen: [85, 107, 47],
    darkorange: [255, 140, 0],
    darkorchid: [153, 50, 204],
    darkred: [139, 0, 0],
    darksalmon: [233, 150, 122],
    darkseagreen: [143, 188, 143],
    darkslateblue: [72, 61, 139],
    darkslategray: [47, 79, 79],
    darkslategrey: [47, 79, 79],
    darkturquoise: [0, 206, 209],
    darkviolet: [148, 0, 211],
    deeppink: [255, 20, 147],
    deepskyblue: [0, 191, 255],
    dimgray: [105, 105, 105],
    dimgrey: [105, 105, 105],
    dodgerblue: [30, 144, 255],
    firebrick: [178, 34, 34],
    floralwhite: [255, 250, 240],
    forestgreen: [34, 139, 34],
    gainsboro: [220, 220, 220],
    ghostwhite: [248, 248, 255],
    gold: [255, 215, 0],
    goldenrod: [218, 165, 32],
    greenyellow: [173, 255, 47],
    grey: [128, 128, 128],
    honeydew: [240, 255, 240],
    hotpink: [255, 105, 180],
    indianred: [205, 92, 92],
    indigo: [75, 0, 130],
    ivory: [255, 255, 240],
    khaki: [240, 230, 140],
    lavender: [230, 230, 250],
    lavenderblush: [255, 240, 245],
    lawngreen: [124, 252, 0],
    lemonchiffon: [255, 250, 205],
    lightblue: [173, 216, 230],
    lightcoral: [240, 128, 128],
    lightcyan: [224, 255, 255],
    lightgoldenrodyellow: [250, 250, 210],
    lightgray: [211, 211, 211],
    lightgreen: [144, 238, 144],
    lightgrey: [211, 211, 211],
    lightpink: [255, 182, 193],
    lightsalmon: [255, 160, 122],
    lightseagreen: [32, 178, 170],
    lightskyblue: [135, 206, 250],
    lightslategray: [119, 136, 153],
    lightslategrey: [119, 136, 153],
    lightsteelblue: [176, 196, 222],
    lightyellow: [255, 255, 224],
    limegreen: [50, 205, 50],
    linen: [250, 240, 230],
    magenta: [255, 0, 255],
    mediumaquamarine: [102, 205, 170],
    mediumblue: [0, 0, 205],
    mediumorchid: [186, 85, 211],
    mediumpurple: [147, 112, 219],
    mediumseagreen: [60, 179, 113],
    mediumslateblue: [123, 104, 238],
    mediumspringgreen: [0, 250, 154],
    mediumturquoise: [72, 209, 204],
    mediumvioletred: [199, 21, 133],
    midnightblue: [25, 25, 112],
    mintcream: [245, 255, 250],
    mistyrose: [255, 228, 225],
    moccasin: [255, 228, 181],
    navajowhite: [255, 222, 173],
    oldlace: [253, 245, 230],
    olivedrab: [107, 142, 35],
    orange: [255, 165, 0],
    orangered: [255, 69, 0],
    orchid: [218, 112, 214],
    palegoldenrod: [238, 232, 170],
    palegreen: [152, 251, 152],
    paleturquoise: [175, 238, 238],
    palevioletred: [219, 112, 147],
    papayawhip: [255, 239, 213],
    peachpuff: [255, 218, 185],
    peru: [205, 133, 63],
    pink: [255, 192, 203],
    plum: [221, 160, 221],
    powderblue: [176, 224, 230],
    rebeccapurple: [102, 51, 153],
    rosybrown: [188, 143, 143],
    royalblue: [65, 105, 225],
    saddlebrown: [139, 69, 19],
    salmon: [250, 128, 114],
    sandybrown: [244, 164, 96],
    seagreen: [46, 139, 87],
    seashell: [255, 245, 238],
    sienna: [160, 82, 45],
    skyblue: [135, 206, 235],
    slateblue: [106, 90, 205],
    slategray: [112, 128, 144],
    slategrey: [112, 128, 144],
    snow: [255, 250, 250],
    springgreen: [0, 255, 127],
    steelblue: [70, 130, 180],
    tan: [210, 180, 140],
    thistle: [216, 191, 216],
    tomato: [255, 99, 71],
    turquoise: [64, 224, 208],
    violet: [238, 130, 238],
    wheat: [245, 222, 179],
    whitesmoke: [245, 245, 245],
    yellowgreen: [154, 205, 50]
  };

  var namedColorSet = new Set(Object.keys(colorMap));
}

start
  = none
  / filterFunctionList

none "none"
  = _ "none" _ { return null; }

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

// https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/blur
blur "blur()"
  = _ "blur(" _ radius:length _ ")" _ {
    return {
      type: "blur",
      radius: radius
    };
  }

// https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/brightness
brightness "brightness()"
  = _ "brightness(" _ amount:numberPercentage _ ")" _ {
    return {
      type: "brightness",
      amount: amount
    };
  }

// https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/contrast
contrast "contrast()"
  = _ "contrast(" _ amount:numberPercentage _ ")" _ {
    return {
      type: "contrast",
      amount: amount
    };
  }

// https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/drop-shadow
dropShadow "drop-shadow()"
  = _ "drop-shadow(" _ offsetX:length _ offsetY:length _ blurRadius:length? _ color:color? _ ")" _ {
    return {
      type: "drop-shadow",
      offsetX: offsetX,
      offsetY: offsetY,
      blurRadius: blurRadius,
      color: color
    };
  }

// https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/grayscale
grayscale "grayscale()"
  = _ "grayscale(" _ amount:numberPercentage _ ")" _ {
    return {
      type: "grayscale",
      amount: amount
    };
  }

// https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/hue-rotate
hueRotate "hue-rotate()"
  = _ "hue-rotate(" _ angle:angle _ ")" _ {
    return {
      type: "hue-rotate",
      angle
    };
  }

// https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/invert
invert "invert()"
  = _ "invert(" _ amount:numberPercentage _ ")" _ {
    return {
      type: "invert",
      amount: amount
    };
  }

// https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/opacity
opacity "opacity()"
  = _ "opacity(" _ amount:numberPercentage _ ")" _ {
    return {
      type: "opacity",
      amount: amount
    };
  }

// https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/saturate
saturate "saturate()"
  = _ "saturate(" _ amount:numberPercentage _ ")" _ {
    return {
      type: "saturate",
      amount: amount
    };
  }

// https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/sepia
sepia "sepia()"
  = _ "sepia(" _ amount:numberPercentage _ ")" _ {
    return {
      type: "sepia",
      amount: amount
    };
  }

numberPercentage "<number-percentage>"
  = percentage
  / number

integer "<integer>"
  = [0-9]+ { return parseInt(text(), 10); }

// https://developer.mozilla.org/en-US/docs/Web/CSS/number
number "<number>"
  = [0-9]+ "." [0-9]+ { return parseFloat(text()); }
  / integer

signedNumber "<signedNumber>"
  = [+-]? number { return parseFloat(text()); }

// https://developer.mozilla.org/en-US/docs/Web/CSS/percentage
percentage
  = value:number "%" { return value / 100; }

// https://developer.mozilla.org/en-US/docs/Web/CSS/angle
angle "<angle>"
  = value:signedNumber unit:angleUnit { return value * unit; }
  / "0" angleUnit? { return 0; }

angleUnit "<unit>"
  = "deg" { return 1; }
  / "grad" { return 360 / 400; }
  / "rad" { return 180 / Math.PI; }
  / "turn" { return 1 / 360; }

// https://developer.mozilla.org/en-US/docs/Web/CSS/length
length "<length>"
  = value:number unit:lengthUnit { return value * unit; }
  / "0" lengthUnit? { return 0; }

lengthUnit
  = "px" { return 1; }
  / "cm" { return 96 / 2.54; }
  / "mm" { return 96 / 2.54 / 10; }
  / "Q"  { return 96 / 2.54 / 40; }
  / "in" { return 96; }
  / "pc" { return 96 / 6; }
  / "pt" { return 96 / 73; }

// https://developer.mozilla.org/en-US/docs/Web/CSS/color
color
  = "#" r:(hexdigit hexdigit) g:(hexdigit hexdigit) b:(hexdigit hexdigit) {
    return [
      parseInt(r.join(""), 16),
      parseInt(g.join(""), 16),
      parseInt(b.join(""), 16)
    ];
  }
  / "#" r:hexdigit g:hexdigit b:hexdigit {
    return [
      parseInt([r, r].join(""), 16),
      parseInt([g, g].join(""), 16),
      parseInt([b, b].join(""), 16)
    ];
  }
  / "rgba(" _ r:percentage _ "," _ g:percentage _ "," _ b:percentage _ ("," _ a:numberPercentage _)? ")" {
    return [r * 255, g * 255, b * 255, a];
  }
  / "rgba(" _ r:number _ "," _ g:number _ "," _ b:number _ ("," _ a:numberPercentage _)? ")" {
    return [r, g, b, a];
  }
  / "rgb(" _ r:percentage _ "," _ g:percentage _ "," _ b:percentage _ ")" {
    return [r * 255, g * 255, b * 255, 1];
  }
  / "rgb(" _ r:number _ "," _ g:number _ "," _ b:number _ ")" {
    return [r, g, b, 1];
  }
  / namedColor

hexdigit
  = [0-9a-fA-F]

_ "whitespace"
  = [ \t\n\r]*

namedColor "<named-color>"
  = [a-z]+ {
    var color = text();

    if (!namedColorSet.has(color)) {
      error(`unknown color "${color}"`);
    }

    // return the color with the alpha
    return [...colorMap[color], 1];
  }

