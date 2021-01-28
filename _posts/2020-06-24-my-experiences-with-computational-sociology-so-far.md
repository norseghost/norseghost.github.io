---
title: "My experiences with computational sociology (so far)"
date: "2020-06-24 04:37:59 +0200"
tags: sociolgy education
---

I have been spending my spring ploddingly pursuing my master's thesis.
Inspired by my visit to the NLP crowd, I've undertaken a text-mining project, where I'm trawling speeches in the Danish parliament for education generally, and secondary education specifically.
If possible, I'm looking to tease out relationships between academic and vocational tracks in upper secondary education.

# The road thus far

Apart from the apocalypse bingo card being full ten times over in 2020, this has (and still is, to some extent) been slow going.
The [dataset I'm using](https://gitlab.com/maltelau/folketinget/) contains over 700 000 speeches; and this poses certain computational challenges, shall we say[^server].
But, I have prevailed somewhat nonetheless.
So far I have:

- Cleaned and preprocessed the text
- Run an LDA model fitter to determine an appropriate amount of topics
- Run the LDA model on the corpus, twice. [Got this nifty visualization out of it](https://ldavis.andersens.xyz).
- Discovered that my parameters were off, resulting in a lot of noise in e.g. many procedural boilerplate topics generated. So I get to iterate! Yay science!
- But also! Seen trends over time, consistent with the rise of neoliberalism in the 90s, and a focus on individual attainment in the 00s, for example. There is a *there* there.
- Become a lot! more comfortable programming. Tidyverse functionals? `data.table` and parallel processing black magic? Yup.

But one of the biggest takeaways is: All (social, at least) research is subjective, and thus susceptible to researcher bias.
Even ones that involve a lot of numbers and maths.
Those off-seeming parameters above?
There is no Goldilocks answer — all I can do is fiddle with the settings until it seems fine.

[^server]: For more on how I overcame these challenges somewhat, feel free to check [the other blog](https://norseghost.com/posts/dl380e-g8/). Spoiler: it gets nerdy.
