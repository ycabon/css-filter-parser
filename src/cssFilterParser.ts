import { createToken, Lexer, EmbeddedActionsParser, tokenMatcher } from "chevrotain";

type CSSFilterParsingResults = CSSFilterParsingResult[];

export type CSSFilterParsingResult =
  | BlurResult
  | BrightnessResult
  | ContrastResult
  | DropShadowResult
  | GrayscaleResult
  | HueRotateResult
  | InvertResult
  | OpacityResult
  | SaturateResult
  | SepiaResult;

type BlurResult = {
  type: "blur";
  radius: number;
};
type BrightnessResult = {
  type: "brightness";
  amount: number;
};
type ContrastResult = {
  type: "contrast";
  amount: number;
};
type DropShadowResult = {
  type: "dropShadow";
  offsetX: number;
  offsetY: number;
  blurRadius?: number;
  color?: [number, number, number, number];
};
type GrayscaleResult = {
  type: "grayscale";
  amount: number;
};
type HueRotateResult = {
  type: "hue-rotate";
  angle: number;
};
type InvertResult = {
  type: "invert";
  amount: number;
};
type OpacityResult = {
  type: "opacity";
  amount: number;
};
type SaturateResult = {
  type: "saturate";
  amount: number;
};
type SepiaResult = {
  type: "sepia";
  amount: number;
};


const WhiteSpace = createToken({ name: "WhiteSpace", pattern: /\s+/, group: Lexer.SKIPPED });
const Comma = createToken({ name: "Comma", pattern: /,/, group: Lexer.SKIPPED });

const Sign = createToken({name: "Sign", pattern: Lexer.NA});
const Plus = createToken({name: "Plus", pattern: /\+/, categories: Sign});
const Minus = createToken({name: "Minus", pattern: /-/, categories: Sign});

const None = createToken({ name: "None", pattern: /none/ });
const Blur = createToken({ name: "Blur", pattern: /blur/ });
const Brightness = createToken({ name: "Brightness", pattern: /brightness/ });
const Contrast = createToken({ name: "Contrast", pattern: /contrast/ });
const DropShadow = createToken({ name: "DropShadow", pattern: /drop-shadow/ });
const Grayscale = createToken({ name: "Grayscale", pattern: /grayscale/ });
const HueRotate = createToken({ name: "HueRotate", pattern: /hue-rotate/ });
const Invert = createToken({ name: "Invert", pattern: /invert/ });
const Opacity = createToken({ name: "Opacity", pattern: /opacity/ });
const Saturate = createToken({ name: "Saturate", pattern: /saturate/ });
const Sepia = createToken({ name: "Sepia", pattern: /sepia/ });

const NumberLiteral = createToken({ name: "NumberLiteral", pattern: /[0-9]+(?:\.[0-9]+)?/ })
const Percent = createToken({ name: "Percent", pattern: /%/ })

const AngleUnit = createToken({ name: "AngleUnit", pattern: /deg|grad|rad|turn/i });
const AngleUnits: Record<string, number> = {
  deg: 1,
  grad: 360 / 400,
  rad: 180 / Math.PI,
  turn: 1 / 360
};

const LengthUnit = createToken({ name: "LengthUnit", pattern: /px|cm|mm|Q|in|pc|pt/i });
const LengthUnits: Record<string, number> = {
  px: 1,
  cm: 96 / 2.54,
  mm: 96 / 2.54 / 10,
  Q: 96 / 2.54 / 40,
  in: 96,
  pc: 96 / 6,
  pt: 96 / 73
};

// const percentageRegex = /([0-9]+(?:\.[0-9]+)?)(%?)/;
// const NumberOrPercentage = createToken({
//   name: "NumberOrPercentage",
//   pattern: (text, startOffset) => {
//       percentageRegex.lastIndex = startOffset;
//       const execResult = percentageRegex.exec(text);
//       if (execResult !== null) {
//           const value = parseFloat(execResult[1]);
//           const sign = execResult[2];
//           execResult.payload = sign ? value / 100 : value;
//       }
//       return execResult;
//   },
//   line_breaks: false
// });

// const lengthRegex = /(?:([0-9]+(?:\.[0-9]+)?)(px|cm|mm|Q|in|pc|pt))|0/;
// const Length = createToken({
//   name: "Length",
//   pattern: (text, startOffset) => {
//       lengthRegex.lastIndex = startOffset;
//       const execResult = lengthRegex.exec(text);
//       if (execResult !== null) {
//           // captured 0
//           if (execResult[1] == null) {
//               execResult.payload = 0;
//           }
//           else {
//               const value = parseFloat(execResult[1]);
//               const conversion = LengthUnits[execResult[2]];
//               execResult.payload = value * conversion;
//           }
//       }
//       return execResult;
//   },
//   line_breaks: false
// });

const LeftParenthesis = createToken({ name: "LeftParenthesis", pattern: /\(/ });
const RightParenthesis = createToken({ name: "RightParenthesis", pattern: /\)/,  });

let allTokens = [
  WhiteSpace,
  Comma,

  Sign,
  Plus,
  Minus,

  None,
  Blur,
  Brightness,
  Contrast,
  DropShadow,
  Grayscale,
  HueRotate,
  Invert,
  Opacity,
  Saturate,
  Sepia,

  NumberLiteral,
  Percent,

  AngleUnit,
  LengthUnit,

  LeftParenthesis,
  RightParenthesis
]

let CSSFilterLexer = new Lexer(allTokens, {
  positionTracking: "onlyStart"
});

class CSSFilterParser extends EmbeddedActionsParser {
  constructor() {
    super(allTokens, {
      recoveryEnabled: false
    })

    const $ = this;

    this.parse = $.RULE<CSSFilterParsingResults>("cssFilter", () => {
      const filters: CSSFilterParsingResults = [];

      $.OR([
        { ALT: () => $.CONSUME(None) },
        {
          ALT: () => $.MANY(() => {
            filters.push($.SUBRULE(filterFunction));
          })
        }
      ]);

      return filters;
    });

    const filterFunction = $.RULE<CSSFilterParsingResult>("filterFunction", () => $.OR<CSSFilterParsingResult>([
      { ALT: () => $.SUBRULE(blurRule) },
      { ALT: () => $.SUBRULE(brightnessRule) },
      { ALT: () => $.SUBRULE(contrastRule) },
      { ALT: () => $.SUBRULE(dropShadow) },
      { ALT: () => $.SUBRULE(grayscaleRule) },
      { ALT: () => $.SUBRULE(hueRotateRule) },
      { ALT: () => $.SUBRULE(invertRule) },
      { ALT: () => $.SUBRULE(opacityRule) },
      { ALT: () => $.SUBRULE(saturateRule) },
      { ALT: () => $.SUBRULE(sepiaRule) }
    ]))

    // ---------------------------------------------------------------------

    // https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/blur
    const blurRule = $.RULE<BlurResult>("blur", () => {
      $.CONSUME(Blur);
      $.CONSUME(LeftParenthesis);
      const radius = $.SUBRULE(length);
      $.CONSUME(RightParenthesis);

      return {
        type: "blur",
        radius
      };
    });

    // https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/brightness
    const brightnessRule = $.RULE<BrightnessResult>("brightness", () => {
      $.CONSUME(Brightness);
      $.CONSUME(LeftParenthesis);
      const amount = $.SUBRULE(numberOrPercent);
      $.CONSUME(RightParenthesis);

      return {
        type: "brightness",
        amount
      };
    });

    // https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/contrast
    const contrastRule = $.RULE<ContrastResult>("contrast", () => {
      $.CONSUME(Contrast);
      $.CONSUME(LeftParenthesis);
      const amount = $.SUBRULE(numberOrPercent);
      $.CONSUME(RightParenthesis);

      return {
        type: "contrast",
        amount
      };
    });

    // https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/drop-shadow
    const dropShadow = $.RULE<DropShadowResult>("dropShadow", () => {
      $.CONSUME(DropShadow);
      $.CONSUME(LeftParenthesis);

      const offsetX = $.SUBRULE(length);
      const offsetY = $.SUBRULE1(length);
      const blurRadius = $.SUBRULE2(length);
      const color: undefined | [number, number, number, number] = $.SUBRULE(colorRule);
      $.CONSUME(RightParenthesis);

      return {
        type: "dropShadow",
        offsetX,
        offsetY,
        blurRadius,
        color
      };
    });

    // https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/grayscale
    const grayscaleRule = $.RULE<GrayscaleResult>("grayscale", () => {
      $.CONSUME(Grayscale);
      $.CONSUME(LeftParenthesis);
      const amount = $.SUBRULE(numberOrPercent);
      $.CONSUME(RightParenthesis);

      return {
        type: "grayscale",
        amount
      };
    });

    // https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/hue-rotate
    const hueRotateRule = $.RULE<HueRotateResult>("hueRotate", () => {
      $.CONSUME(HueRotate);
      $.CONSUME(LeftParenthesis);
      const angleValue = $.SUBRULE(angle);
      $.CONSUME(RightParenthesis);

      return {
        type: "hue-rotate",
        angle: angleValue
      };
    });

    // https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/invert
    const invertRule = $.RULE<InvertResult>("invert", () => {
      $.CONSUME(Invert);
      $.CONSUME(LeftParenthesis);
      const amount = $.SUBRULE(numberOrPercent);
      $.CONSUME(RightParenthesis);

      return {
        type: "invert",
        amount
      };
    });

    // https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/opacity
    const opacityRule = $.RULE<OpacityResult>("opacity", () => {
      $.CONSUME(Opacity);
      $.CONSUME(LeftParenthesis);
      const amount = $.SUBRULE(numberOrPercent);
      $.CONSUME(RightParenthesis);

      return {
        type: "opacity",
        amount
      };
    });

    // https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/saturate
    const saturateRule = $.RULE<SaturateResult>("saturate", () => {
      $.CONSUME(Saturate);
      $.CONSUME(LeftParenthesis);
      const amount = $.SUBRULE(numberOrPercent);
      $.CONSUME(RightParenthesis);

      return {
        type: "saturate",
        amount
      };
    });

    // https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function/sepia
    const sepiaRule = $.RULE<SepiaResult>("sepia", () => {
      $.CONSUME(Sepia);
      $.CONSUME(LeftParenthesis);
      const amount = $.SUBRULE(numberOrPercent);
      $.CONSUME(RightParenthesis);

      return {
        type: "sepia",
        amount
      };
    });

    // ---------------------------------------------------------------------

    // describe a length in CSS:
    const length = $.RULE<number>("length", () => {
      const value = parseFloat($.CONSUME(NumberLiteral).image);

      if (!value) {
        return 0;
      }

      const unit = LengthUnits[
        $.CONSUME(LengthUnit, {
          ERR_MSG: "Missing unit"
        }).image
      ];

      return value * unit;
    });

    // describe a length in CSS:
    const angle = $.RULE<number>("angle", () => {
      const sign = $.OPTION(() => $.CONSUME(Sign));
      const value = parseFloat($.CONSUME(NumberLiteral).image);

      if (!value) {
        return 0;
      }

      const unit = AngleUnits[
        $.CONSUME(AngleUnit, {
          ERR_MSG: "Missing unit"
        }).image
      ];

      return (tokenMatcher(sign, Minus) ? -1 : 1) * value * unit;
    });

    const numberOrPercent = $.RULE<number>("numberOrPercent", () => {
      const value = parseFloat($.CONSUME(NumberLiteral).image);
      const isPercent = $.OPTION(() => $.CONSUME(Percent));

      if (isPercent) {
        return value / 100;
      }
      else {
        return value;
      }
    });

    const colorRule = $.RULE<undefined | [number, number, number, number]>("color", () => {
      return undefined
    });

    // very important to call this after all the rules have been setup.
    // otherwise the parser may not work correctly as it will lack information
    // derived from the self analysis.
    this.performSelfAnalysis();
  }

  parse:  (idxInCallingRule?: number, ...args: any[]) => CSSFilterParsingResults;

}

const parser = new CSSFilterParser();

export default function parse(text: string): CSSFilterParsingResults {
  const lexResult = CSSFilterLexer.tokenize(text)

  // setting a new input will RESET the parser instance's state.
  parser.input = lexResult.tokens

  const result = parser.parse();

  if (parser.errors) {
    throw new Error("parsing failed.")
  }

  return result
}
