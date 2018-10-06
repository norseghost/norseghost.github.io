---
title: A Nerd's Guide to writing Papers for Aarhus University
tags: latex pandoc biblatex bibliography writing academia uni guide
toc: true
toc-sticky: true
sidebar:
  nav: "guides"
---
*The following is just as much a cheat sheet for myself, if I should need to recreate my setup sometime.*

## The goal

To write papers in a plain text editor, with pretty output at the end of the production pipeline. Output in PDF and .docx formats, for now. Support for an external reference manager required.

## The result, so far

- Authoring in a plain text editor - I currently use [Visual Studio Code][vscode]
- Pretty output is handled by [LaTeX][latex]
- LateX handles PDF output natively. [Pandoc][pandoc] takes care of translating to .docx.
- [Zotero][zotero] and the [Better Bibtex][bbibtex] extension manages references, and translates to [BibLaTex][biblatex] for me.

### TODO

- Cite-as-you-write does not work. Hasn't been an issue yet, but very well might be as papers get more comprehensive.
- .docx output needs a bit massageing to look even halfway decent
- my in-editor build scripts choke on non-hard paths - no tilde expansion, no variable expansion.
- in-editor build script does not set reference section title when outputting .docx.

# How to get there
In the following, I'll explain the steps I've taken to get nice, clean PDF output in APA format, as well as serviceable, if less pretty .docx files. Citations will be inline in APA format, as well as the bibliography. Step 0 - finding an editor - will be left as an exercise for the reader, but I'll add my VSCode setup at the end, for those interested.

## LaTeX
I won't go on about what LaTeX is and why you'd want to use it, nor give a LaTeX tutorial. The focus here will be on how to set it up for proper formatting and output.

To install LaTeX on fedora 28, run:

~~~ bash
sudo dnf install -y texlive-scheme-full
~~~

This will get you all packages, and will take a while.

### Frontmatter - settings and packages
I have split my LaTeX source files out, with one main file for my default settings. This currently looks like:

~~~ latex
\usepackage[margin=1.0in]{geometry}
\usepackage[danish]{babel}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{csquotes}
\usepackage[backend=biber,citestyle=verbose-ibid,urldate=short,style=apa]{biblatex}
\DeclareLanguageMapping{danish}{danish-apa}
\author{Martin Andreas Andersen}
\bibliography{~/Documents/DPU/dpu}
~~~

The individual papers `\input` this file after their respective `\documentclass` declarations. In order:

- I set 1 inch margins with the geometry package, as a personal preference.
- I set the language to danish using babel, to ensure proper quoting and hyphenation.
- Font encoding to T1 to better handle special characters such as æ-ø-å.
- UTF-8 input encoding
- the csquotes package supplies typographically correct quotations instead of backticks and apostrophes.
- The BibLaTeX package takes care of citations.
    - the biber backend is more powerful than standard biblatex
    - the verbose-ibid citestyle cuts down on chatter when repeatedly citing the same document
    - the short urldate format ##FIXME DOES WHAT EXACTLY
    - finally, we're using the APA style
- To get danish output in the reference section, we need to declare a language mapping.
- I'm the author.
- the bibliography file is included, sans extension. Only referenced documents will be included in the bibliography.

## Zotero
Download and install [Zotero][zotero] from their website, as pertains to your OS. Then, install the Better Bib(La)Tex extension for Zotero.

If you'd like, feel free to install the browser addon and sign up for a cloud account. I have had poor luck getting the extension to auto-import RIS files, though.

### Better BibTeX
Install Better Bib(La)Tex [following their instructions][bbinst]. Then, when you have a collection ready in Zotero, export it using the now-available Better Bibtex option, check the 'Keep updated' box, and save it someplace sensible. This gives you an updated BibLaTex database.

Better Bibtex allows for a lot of tweaking, including possible cite-as-you-write capabilities, but I haven't dug into that yet. For now, I manually copy-and-paste citation keys, and let my the autocomplete suggestions in my editor pick them up later.

# Output

Congratulations! You have written (maybe following another guide, or, in my case, lots of beard-scratching and browsing the [TeX StackExchange]) something of hopeful academic value.

## PDF

To output to pdf, the following sets of commands need to be run (where `yourpaper` is the name of your .tex file):

~~~ bash
latex [yourpaper] # to prepare the document
biber [yourpaper] # to add references
latex [yourpaper] # to collect references
pdflatex [yourpaper] # puts it all together, outputs a pdf
~~~

## Microsoft Opendocument XML (.docx)

Outputting to .docx is a bit more involved. [Pandoc][pandoc] can help, though, with a few helper utilities.

Pandoc itself handles the format translation, and pandoc-citeproc adds citation support. The pandoc format does not natively support pagebreaks, however, which we add with a haskell filter. The haskell filter requires a **lot** of libraries - haskell itself, along with the pandoc development libraries. This is something like 1.5 gigabytes of dependencies all told on Fedora 28, so be warned.


### Installation

On Fedora 28, this should handle it:

~~~ bash
sudo dnf install -y \
pandoc \
pandoc-citeproc \
ghc-pandoc-devel
~~~

### Citations

`pandoc-citeproc` needs a `.csl` file to know how to format citations. Zotero [has a database][csldb], and a search for `apa` reveals a [danish `.csl`][apadan] courtesy of University College Lillebælt. Download the `.csl`, and save it somewhere sensible.

### Pagebreaks

The pandoc document model apparently doesn't support pagebreaks natively, which means LaTeX `\newpage` declarations are ignored. To avoid having to manually add pagebreaks where relevant, use the following filter:

~~~ haskell
#!/usr/bin/env runhaskell # find haskell

import Text.Pandoc.JSON

# store the .docx pagebreak info in a variable
pgBrkXml :: String
pgBrkXml = "<w:p><w:r><w:br w:type=\"page\"/></w:r></w:p>"

# format it as openxml
pgBrkBlock :: Block
pgBrkBlock = RawBlock (Format "openxml") pgBrkXml

# find \newpage declarations, and replace with openxml page breaks
insertPgBrks :: Block -> Block
insertPgBrks (RawBlock (Format "latex") "\\newpage") = pgBrkBlock
insertPgBrks blk = blk

# output to pandoc JSON stream
main = toJSONFilter insertPgBrks
~~~

Copy the above into a text file, and save the filter somewhere sensible. Remember to set the script executable!

### Putting it all together

The following pandoc command processes a .tex file, and outputs a .docx for you:

~~~ shell
pandoc --csl=apa-dan.csl \                  # path to APA .csl
 --bibliography=yourbibliography.bib \      # path to your bibliography
 -M lang:da \                               # set danish language
 -M reference-section-title=Referencer \    # title of reference section
 --filter=docx-pagebreak.hs \               # path to page break filter
 -o yourpaper.docx yourpaper.tex            # output .docx, process yourpaper.tex
~~~

# Visual Studio Code integration

Install the LaTeX Workshop extension from the marketplace. Add the following build scripts to the vscode user settings to automate the above steps:

~~~ json
    "latex-workshop.latex.tools": [
      { // run pdflatex
        "name": "pdflatex",
        "command": "pdflatex",
        "args": [
          "-synctex=1",
          "-interaction=nonstopmode",
          "-file-line-error",
          "%DOC%"
        ]
      },
      { // run latex
        "name": "latex",
        "command": "latex",
        "args": [
          "-synctex=1",
          "-interaction=nonstopmode",
          "-file-line-error",
          "%DOC%"
        ]
      },
      { // convert latex project to .docx
        "name": "pandocx",
        "command": "pandoc",
        "args": [
          "%DOCFILE%.tex",
          "--csl=/home/martin/.pandoc/apa-dan.csl",
          "--bibliography=/home/martin/Documents/DPU/dpu.bib",
          "--filter=/home/martin/.pandoc/docx-pagebreak.hs",
          "-M lang:da",
          "-M reference-section-title=Referencer",
          "-o%DOCFILE%.docx"
        ]
      },
      { // run biber
        "name": "biber",
        "command": "biber",
        "args": [
          "%DOCFILE%"
        ]
      }
    ],
    "latex-workshop.latex.recipes": [
      {
        "name": "Generate PDF",
        "tools": [
          "latex",
          "biber",
          "latex",
          "pdflatex"
        ]
      },
      {
        "name": "Generate DOCX",
        "tools": [
          "latex",
          "biber",
          "latex",
          "latex",
          "pandocx"
        ]
      }
    ],
~~~

For more information on LaTeX Workshop toolchain setup, see [the documentation][lwdocs].

[lwdocs]: https://github.com/James-Yu/LaTeX-Workshop#recipe
[apadan]: https://www.zotero.org/styles/university-college-lillebaelt-apa
[csldb]: https://www.zotero.org/styles
[vscode]: https://code.visualstudio.com/
[latex]: https://www.latex-project.org/
[pandoc]: http://pandoc.org/
[zotero]: https://www.zotero.org/
[bbibtex]: https://retorque.re/zotero-better-bibtex/
[biblatex]: https://ctan.org/pkg/biblatex?lang=en
[bbinst]: https://retorque.re/zotero-better-bibtex/installation/