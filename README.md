# Sample LaTeX project

## Create a document

The command is installed at `~/.local/bin/newlatex`, already on this machine's
PATH. From any directory, run:

```bash
newlatex -n name
latexmk -pdf name.tex
```

This creates just two files: `name.tex` and `macros.tex`. The document loads
its macros with `\input{macros.tex}`. Send both files to collaborators.
No custom `.sty` files are required or copied.

An optional `.tex` suffix is accepted. To create a separate folder, run
`newlatex -n papers/my-paper`, then compile from `papers`. Directory names
may contain spaces; quote the full argument. Filenames use letters, digits,
dots, underscores, and hyphens and start with a letter or digit.

Existing documents are never overwritten. An identical `macros.tex` is
reused; a different one causes an error before any files are created. After
customizing a folder's macros, start later documents in a new folder or copy
its existing document manually to share those customized macros.

## Edit the template

- `sample.tex`: the sample note copied by `newlatex`. Edit its title, author,
  and content to change the starting document.
- `macros.tex`: standard package imports followed by clearly grouped notes,
  theorem definitions, and notation. Edit each definition directly.
- `bin/newlatex`: the Bash script. `install.sh` installs a symlink to it in
  `~/.local/bin`. Keep this project in place; if you move it, remove the old
  command symlink and rerun `./install.sh`.

The notation takes inspiration from `~/Work/GiantCluster`, with simple
ordinary definitions in `macros.tex`. Probability uses `\Prob`, expectation
uses `\E`, and standard LaTeX symbols keep their usual meanings.

## Line numbers and named sidenotes

The sample enables line numbering after `\maketitle`:

```latex
\linenumbers               % Enable line numbers.
% \modulolinenumbers[5]    % Optionally label only every fifth line.
% \nolinenumbers          % Stop numbering.

Some text.\sidenote[Son]{Check this argument.}
More text.\sidenote[Alice]{Can we simplify the proof?}
```

Use sidenotes in ordinary text, outside equations and captions. They appear
in the page margin with the supplied name in bold. Without a name,
`\sidenote{...}` uses “Note”. You can define a shortcut in `macros.tex`:

```latex
\newcommand{\sonnote}[1]{\sidenote[Son]{#1}}
```

For a clean version, put `\shownotesfalse` immediately after
`\input{macros.tex}` and remove/comment out `\linenumbers` in the document.
The sidenote definition, color, and margin width are near the top of
`macros.tex` for easy editing.

## Common notation

| Purpose | Examples |
| --- | --- |
| Number systems | `\R`, `\C`, `\N`, `\Z`, `\Q`, `\T` |
| Calligraphic letters | `\cA`, `\cF`, `\cH`, `\cL`, `\cM` |
| Delimiters | `\abs{x}`, `\norm{u}`, `\paren{x}`, `\set{x \st x>0}` |
| Delimiter sizing | `\norm*{...}` (automatic), `\norm[\big]{...}` (explicit) |
| Inner product | `\ip{u}{v}` |
| Calculus | `\dd x`, `\odv{f}{t}`, `\pdv{u}{t}`, `\pdv[2]{u}{x}`, `\grad`, `\dv`, `\curl`, `\lap` |
| Probability | `\E`, `\Prob`, `\var`, `\Cov`, `\one`, `\given` |
| Operators | `\supp`, `\dist`, `\diam`, `\trace`, `\rank`, `\Span`, `\argmin`, `\argmax` |
| Convergence | `\weakto`, `\weakstar` |
| Environments | `theorem`, `lemma`, `proposition`, `corollary`, `conjecture`, `definition`, `remark`, `example`, `proof` |

## Build the sample

```bash
latexmk -pdf sample.tex
```

Requires a standard LaTeX installation with the AMS packages, mathtools,
xcolor, lineno, and hyperref. This machine's `~/.latexmkrc` puts PDFs in
`build/` and auxiliary files in `aux/`.
# SampleLatex
