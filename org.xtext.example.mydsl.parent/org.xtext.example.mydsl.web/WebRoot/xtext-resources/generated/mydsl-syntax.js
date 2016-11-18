define([], function() {
	var keywords = "Hello";
	return {
		id: "xtext.mydsl",
		contentTypes: ["xtext/mydsl"],
		patterns: [
			{include: "orion.c-like#comment_singleLine"},
			{include: "orion.c-like#comment_block"},
			{include: "orion.lib#string_doubleQuote"},
			{include: "orion.lib#string_singleQuote"},
			{include: "orion.lib#number_decimal"},
			{name: "keyword.mydsl", match: "\\b(?:" + keywords + ")\\b"}
		]
	};
});
