---
title: New and improved PEG parser
excerpt: We are happy to announce that we have completed migration to a rewrite of our blueprint parser. The parser is now open-source and will serve as a base for further improvements of our format.
layout: post
date: 2013-02-05 18:00:00 +1000
author: lukas
---

I'm excited to to announce that I have finally completed migration
to our new parser. It is more robust, more formal, totally open-source
and will serve as a base for further improvements of our syntax.

With that, Apiary Blueprint Format is now defined as a proper grammar.
Both grammar and javascript parser (works both in browser and in
[node.js](http://nodejs.org/)) are open-source and
[available on github](https://github.com/apiaryio/blueprint-parser).
It is based on [PEG.js](https://pegjs.org/)
and I'd like to thank its author, [David Majda](http://majda.cz/),
for writing it and also contributing enormously to Apiary blueprint grammar.

# Backward compatibility

We have worked hard to maintain backward compatibility. However, there
are some areas where the behavior of the old parser
was undefined and while it is valid with new parser, it may lead to
unexpected results. Therefore, we encourage you to take a look at your
documentation, verify everything is OK and [let us know](http://support.apiary.io/)
if you need help.

The main change comes with header and payload definition. In some places,
the old parser incorrectly accepted empty newlines inside headers or
payload. This is not allowed as empty line indicates "end of the
resource". If you need to have empty lines inside your payload, you
may take advantage of our new "heredoc" syntax:

	POST /resource
	> Content-Type: text/css
	<<<EOT

	 body {color: purple}

	 .content {text: pink}

	EOT
	< 200
	< Content-Type: application/xml
	<<<EOT
	<result>

	    <ok/>

	</result>
	EOT

EOT may any alphanumeric sequence of your choice.

# Brave new world

The new parser will allow us to be more agile in the [evolution of our format](https://blog.apiary.io/New-API-Blueprint-Format).
[The grammar](https://github.com/apiaryio/blueprint-parser/blob/master/src/apiary-blueprint-parser.pegjs)
now also serves as a formal definition of our language.

Many people from the open-source community asked us how they can integrate with our format, whether that is automatic generation of [frisby.js](http://frisbyjs.com/) tests or scaffolding of Ruby apps. We love open-source, so we embrace this collaboration wholeheartly.
Hopefully, the new parser should make this easier for us all.

To be future-proof, you should use a [generator for your language](http://en.wikipedia.org/wiki/Comparison_of_parser_generators#Parsing_expression_grammars.2C_deterministic_boolean_grammars)
and use our grammar directly. Also, don't forget to subscribe to our
[mailing list](https://groups.google.com/forum/?fromgroups#!forum/apiary-blueprint-parser),
where you can find information about new releases and important changes.

# Let us know

Created something cool with apiary? Let us know! Mention [us on twitter](http://twitter.com/apiaryio) or write me to [lukas@apiary.io](mailto:lukas@apiary.io).

We'll be glad to hear from you!
