_ = require "./underscore.js"

plus = (a, b) -> a + b
mul = (a, b) -> a * b
max = (a, b) -> if a > b then a else b

exports.sum = (a) -> _.reduce a, plus
exports.product = (a) -> _.reduce a, mul
exports.max = (a) -> _.reduce a, max
