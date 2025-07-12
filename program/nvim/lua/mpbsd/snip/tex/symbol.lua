local utils = require("mpbsd.core.glb").utils

return {
	s({
		trig = [[oo]],
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "infinity",
	}, t([[\infty]]), { condition = utils.in_math }),
	s({
		trig = [[(?<!\\)([cdlv]dots)]],
		regTrig = true,
		trigEngine = "ecma",
		snippetType = "autosnippet",
		desc = "dots",
	}, l([[\]] .. l.CAPTURE1), { condition = utils.in_math }),
}
