
/**
 *
 *
 */
start
  = none
  / functionList

none "none"
  = _ "none" _ { return null; }

functionList
  = function+

function
  = _ name:FUNCTION _ parameters:parameters* _ ")" _ {
    return {
      name: name,
      parameters: parameters
    };
  }

parameters
  = head:term tail:(_ ","? _ value:term)* {
    return !tail.length
      ? head
      : [head].concat(tail.map(function(el) {
        return el[el.length - 1]
      }));
  }

term
  = quantity:(PERCENTAGE / LENGTH / ANGLE / NUMBER) {
    return {
      type: "quantity",
      value: quantity.value,
      unit: quantity.unit
    };
  }
  / color:COLOR {
    return {
      type: "color",
      value: color
    }
  }

_ "whitespace"
  = [ \t\n\r]*

FUNCTION "function"
  = name:IDENTIFIER "(" { return name; }

/**
 * Simple identifier token to match for the different CSS filter functions
 */
IDENTIFIER "identifier"
  = [a-z\-]+ {
    return text();
  }

PERCENTAGE "percentage"
  = _ value:NUM "%" { return { value: value, unit: "%" }; }

LENGTH "length"
  = _ value:NUM "px" { return { value: value, unit: "px" }; }
  / _ value:NUM "cm" { return { value: value, unit: "cm" }; }
  / _ value:NUM "mm" { return { value: value, unit: "mm" }; }
  / _ value:NUM "in" { return { value: value, unit: "in" }; }
  / _ value:NUM "pt" { return { value: value, unit: "pt" }; }
  / _ value:NUM "pc" { return { value: value, unit: "pc" }; }

ANGLE "angle"
  = value:NUM "deg" { return { value: value, unit: "deg"  }; }
  / value:NUM "rad" { return { value: value, unit: "rad"  }; }
  / value:NUM "grad" { return { value: value, unit: "grad" }; }

NUMBER "number"
  = _ value:NUM { return { value: value, unit: null }; }
  
COLOR "color"
  = "#" [0-9a-fA-F]+ {
    return {
        type: "hexcolor",
        value: text()
      };
  }
  / colorFunction:function {
    return {
      type: "function",
      value: colorFunction
    };
  }
  / IDENTIFIER {
      return {
        type: "named",
        value: text()
      };
    }

NUM
  = [+-]? ([0-9]* "." [0-9]+ / [0-9]+) ("e" [+-]? [0-9]+)? {
    return parseFloat(text());
  }