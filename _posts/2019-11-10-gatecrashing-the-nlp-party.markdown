---
title: "Gatecrashing the NLP party"
date: "2019-11-10 22:19:25 +0100"
tags: [nlp, machine learning, sociology, personal, uni, rstats, python]
---

OK, so I didn't really crash any gates.
I did, however, have the chance to attend a [workshop on natural language processing][nlp_imc], hosted by the [Interacting Minds Centre][imc] at Århus University.
While a lot of the presentations went a bit over my head, it was all very interesting, and whet my appetite for applying NLP and machine learning in my sociological research.

## Primary takeaways

### Data is messy
No, really.
**Data is messy.**
Take, for a practical example, scraped Twitter data.
Do you strip all punctuation?
This means you lose `#hashtags` and `@mentions` too.
Do you normalize common misspellings?
Then social signifiers such as group affiliations and slang might also be lost.
In the end, as with most research, the approach will depend on your research question.
But it will almost always be useful to retain the raw text as part of your data frame, with appropriately treated text as new fields.

# The computer models are only as good as the data used to train them
Thus, when trained on corpora such as newswire feeds or Wikipedia articles, any bias in the corpus will be reflected in the model.
The typical example: If `king` minus `man` yields `queen`; then `doctor` minus `man` yields... `nurse`.
Yeah.
Not great.

### Machine learning models want data
No, more data.
Go on, don't hold back...
This will be an issue when working with small languages such as Danish.
A lack of available training data means less robust models.

### Computer simulations can give useful insights into human cognition and interaction
Two presentations in particular underscored this point:
Felix Günther, who argued that semantic analysis could give an insight into how humans understand and generate meaning;
And Kristian Tylén, who modeled increased problem solving efficiency in groups when the individual agents were dissimilar.

### I feel somewhat cheated of academic impact
A couple of the presentations were from bachelor's students presenting novel approaches and new research.
For example, [SENTIDA][sentida-paper], an [R package][sentida-github] providing sentiment analysis of danish prose.
I am already contemplating the implications for educational sociology.
An analysis of assessments, guidelines and policy documents regarding education and/or social issues?
Or analyzing the debates in the Danish Parliament over such issues?
Something made possible, incidentally, by another student project presented at the seminar, which aims to catalog all parliamentary debates in Europe
(the data is not publicly available yet; but at least the Danish and Czech data had been scraped).

In contrast, my school projects, both from my bachelor's in social education and my current master course in educational sociology seem rather rote and inconsequential.
Which reminds me of a somewhat disparaging note by a lecturer last semester, comparing the Department of Educational Studies at Århus University rather disparagingly to the kind of school I got my BA at.
Make of that what you will.

(There is, incidentally, a fair bit of literature on the attempted academization of the welfare professions in Denmark, and the relevance and success of this project.) 

## Moving on

Lest we dwell on that last observation; how do I wish to proceed?
Firstly, I'd like to wedge an NLP approach into my coursework and assignments.
I'm reaching out to the thesis supervisor administrator with my ideas, and I am hoping to utilize a computational approach to a qualitative analysis of text.
The computer is capable of sifting through orders of magnitude more data in a given span of time than myself - such as, for instance, meeting notes or parliamentary debates.

I'd also like to spend some of my limited free time on learner projects, to build familiarity and a little bit of a portfolio.
My first idea is to revisit an assignment from last year; where I attempted a positional analysis of masculinity following the `#thebestamancanbe` [Gillette ad][gillettead] from January 2019.
A machine learning/NLP approach to this data might be interesting.

Oh, and also brush a lot of dust off my knowledge of applied statistics.

Wish me luck! And also, 48 hour days.

I just might need both.

[gillettead]: https://www.youtube.com/watch?v=koPmuEyP3a0
[sentida-paper]: https://tidsskrift.dk/lwo/article/view/115711 
[sentida-github]: https://github.com/Guscode/Sentida
[nlp_imc]: http://interactingminds.au.dk/events/single-events/artikel/nlp-workshop-imc-fall-2019/
[imc]: http://interactingminds.au.dk/
