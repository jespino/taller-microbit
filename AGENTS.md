# Working on this workshop

This repository is a workshop built with `wsbuilder`, which turns the markdown in
`modules/` into a static website. These are the instructions for coding agents.

If `wsbuilder` is not on the PATH, run it with
`go run github.com/jespino/wsbuilder/cmd/wsbuilder@latest <command>`.

## Rules

- Finish every change with `wsbuilder check`, and fix all errors. Warnings are real
  problems too: resolve them or tell the user why they remain.
- Never edit the output directory (`dist/`). It is generated and replaced on every build.
- Never put module data anywhere but the module's own frontmatter. There is no manifest,
  and `workshop.yaml` holds no list of modules.
- Show real exercise code with `<!-- include: -->` rather than pasting a copy of it.
- Keep every language and every track at parity. If you change one, change the others.
- Keep solutions out of the starter files, which participants download.
- Don't publish, push or change `.github/workflows/` unless the user asks.

## Layout

```
workshop.yaml     title, author, languages, tracks, theme, paths
modules/          one markdown file per module, plus index.md
modules/images/   images used by modules
exercises/        one directory per module with an exercise
public/           optional, copied as is to the site root
theme/            optional, overrides of the theme's files
dist/             generated, never edit it
```

These are the defaults. Check `paths` in `workshop.yaml`, which can move any of them.

## Commands

```bash
wsbuilder new "Module title"             # add the next module, in every language
wsbuilder new "Title" --exercise --part "Part name"   # with an exercise directory
wsbuilder check                          # validate everything, writing nothing
wsbuilder check --strict                 # also fail on warnings
wsbuilder build                          # generate dist/, without drafts
wsbuilder build --drafts --only 01,03 --skip 05   # select modules
wsbuilder watch --port 8000              # rebuild on save and serve with live reload
wsbuilder themes                         # list the themes
wsbuilder eject                          # copy the current theme into theme/
wsbuilder clean                          # remove dist/
```

Errors read `file:line: message`. `check` covers drafts as well. A site without `url` in
`workshop.yaml` always has a warning about it, so `--strict` fails until `url` is set.

## Modules

A module is `modules/NN-name.md`. `NN` sets the order and the name becomes the URL
(`NN-name.html`), so use lowercase words and dashes, with no dots. Prefer
`wsbuilder new`, which picks the next number. Gaps in the numbering are fine. Renumbering
changes published URLs, and every link to the module must then be updated.

Frontmatter is optional, and an unknown key is an error.

```markdown
---
title: Shown instead of the heading
description: One sentence, used under the title, on the card and by search engines.
part: Part name
duration: 45 min
draft: true
exercise: other-directory
---

# Module title

Opening paragraph.
```

- `part` groups consecutive modules. Spell it identically in each of them.
- `draft: true` leaves the module out of `build`, while `watch` shows it.
- `exercise` is only for an exercise directory not named like the module.
- The leading `#` heading becomes the page title. Use one, and start sections at `##`.
- `##` and `###` headings form the "on this page" contents, so keep them short.
- `description` appears right above the text, so don't repeat it in the first paragraph.

This structure works well, and the sections can be adapted to the topic:

1. Opening paragraph: what the module is about and why it matters
2. Learning objectives
3. The concept, explained with examples
4. The exercise, as numbered steps with a way to verify the result
5. Key takeaways

### Markdown

GitHub-flavored markdown works: tables, footnotes and task lists (`- [ ] step`), which
readers can tick. Use markdown syntax for links and images. Raw HTML is allowed, but its
paths are neither checked nor rewritten.

Tag code blocks with a language to highlight them, and leave the language off for program
output. A fence can show a file name:

````markdown
```go title="main.go"
func main() {}
```
````

Callouts use one of `NOTE`, `TIP`, `IMPORTANT`, `WARNING` or `CAUTION`. `HINT` and
`SOLUTION` are collapsed until the reader opens them. Text after the marker replaces the
title.

```markdown
> [!TIP]
> Text of the callout.

> [!HINT] Stuck on the loop?
> Text of the hint.
```

### Links

Link to other modules by file name, as on GitHub. They become page links, in the reader's
language.

```markdown
[Next module](02-next.md)
[A section](02-next.md#a-section)
[Landing page](index.md)
```

Every internal link is checked. A link to a module left out of a build (a draft, or
`--skip`) becomes plain text. A link to any other repository file, such as
`../exercises/02-next/main.go`, goes to `repository` in `workshop.yaml`, so that needs to
be set.

### Images and other assets

- Put images in `modules/images/`, subdirectories included, and reference them as
  `![Description of the image](images/name.png)`. Always write the description.
- Put anything else readers should get, such as slides, in `public/` and link to it
  relative to the module: `[Slides](../public/slides.pdf)`.
- `public/` is also the place for `CNAME` and `favicon.ico`. It is copied last, so a file
  there replaces a generated one, such as `robots.txt`.
- Exercise files belong in `exercises/`, not in `public/`.

## Exercises

`exercises/NN-name/`, named exactly like the module, becomes that module's exercise. The
page gets a box with a download of its files, and a separate download of the solution.

```
exercises/02-first-exercise/
  main.go           starter files
  solution/         the solution, left out of the starter download
    main.go
```

- `solutions` in `workshop.yaml` changes what counts as the solution, for example
  `solutions: [solution, solution.go]`.
- `node_modules`, `.git`, `__pycache__` and similar are left out, and `exclude` in
  `workshop.yaml` adds more patterns.

Show exercise code in a module with an include, on a line of its own. The path is relative
to the workshop root. `lines` (`3`, `3-9` or `3-`), `lang` and `title` are optional.
Selected lines lose their common indentation.

```markdown
<!-- include: exercises/02-first-exercise/main.go lines=3-9 -->
```

After changing a file, check that the `lines` of its includes still select the right code,
because `check` can only tell if they are past the end of the file.

## Tracks

Tracks are parallel versions of a module for different languages or stacks, which the
reader switches between. Declare them in `workshop.yaml`, and wrap what is specific to one:

```markdown
Shared text.

<!-- track:go -->

Go text and code.

<!-- /track -->

<!-- track:python -->

Python text and code.

<!-- /track -->
```

- Each marker goes on a line of its own, with a blank line around it.
- Blocks can't nest, and a block must close at the nesting level where it opened. Inside a
  list item, indent the markers and their content to match the item.
- A module using tracks should have a block for every track, or `check` warns.

## Translations

The first entry in `languages` is the default, written in `NN-name.md`. Others use
`NN-name.<code>.md`, and go to `/<code>/` on the site.

- Translate the prose and the frontmatter. Keep the structure, the headings' order, code,
  includes, images and tracks the same.
- Frontmatter left out of a translation is taken from the original.
- A missing translation shows the original with a notice, and `check` warns.
- `wsbuilder new` creates a file for every language holding English placeholder text, and
  `check` can't tell it is untranslated. Translate those files before finishing.
- Interface text comes in English and Spanish. For another language, add it with `ui` on
  that language in `workshop.yaml`. The keys are in `internal/site/ui.go` of `wsbuilder`.

## The landing page

`title`, `description`, `facts` and `author` from `workshop.yaml` fill the top and the
bottom of the page. `modules/index.md` (with `index.<code>.md` translations) is optional
and adds text in between. Put a line with `<!-- modules -->` where the module list goes.

## Configuration

`workshop.yaml` is strict: an unknown key is an error. Only `title` is required.

| Key | Purpose |
|---|---|
| `title`, `short_title`, `description` | Names and summary. `short_title` goes in the navigation bar, so set one under about 30 characters when `title` is longer |
| `url` | Published address, for canonical URLs and the sitemap |
| `repository`, `branch` | Repository links |
| `image` | Social sharing image, inside the images directory |
| `author` | `name`, `role`, `bio`, `avatar` (inside the images directory), `links` of `label` and `url` |
| `facts` | `label` and `value` pairs on the landing page |
| `languages` | `code`, `name`, and translations in `title`, `short_title`, `description`, `author_role`, `author_bio`, `facts`, `ui` |
| `tracks` | `id` (lowercase) and `name` |
| `theme` | `name`, and `primary` and `accent` as hex colors |
| `solutions`, `exclude` | File name patterns for exercises |
| `paths` | `modules`, `exercises`, `images`, `public`, `theme`, `output` |

## Themes

`theme.name` selects the theme, and `wsbuilder themes` lists them. From the smallest
change to the largest:

1. Set `theme.primary` and `theme.accent`, which replace the theme's colors.
2. Add `theme/custom.css`, loaded last, and override what you need.
3. Add a file to `theme/` to replace that file of the theme: `base.html`, `home.html`,
   `module.html`, `404.html`, `styles.css`, `theme.css` or `app.js`. `wsbuilder eject`
   copies them all as a starting point. Files in `theme/` win over `theme.name`, so after
   ejecting, changing the name has no effect on them.

Pages must not load anything from third parties: the site has to work offline. If you
replace `module.html` or `home.html`, keep the `data-*` attributes, which `app.js` needs
for progress tracking.

## Recipes

**Add a module**

1. Run `wsbuilder new "Title" --exercise` (without `--exercise` if it has none).
2. Fill in `description`, and `part` if the workshop uses parts.
3. Write the text in every language, with a block for every track.
4. Add starter files to `exercises/NN-name/` and the solution to `solution/`.
5. Check that the starter files and the solution both run.
6. Run `wsbuilder check`.

**Change an exercise**

1. Edit the starter files and the solution together.
2. Update the text and the `lines` of any includes, in every language.
3. Run `wsbuilder check`.

**Add a language**

1. Add it to `languages` in `workshop.yaml`, with its `title` and `description`.
2. Add `NN-name.<code>.md` for each module, and `index.<code>.md` if `index.md` exists.
3. Add `ui` translations unless the language is English or Spanish.
4. Run `wsbuilder check`, which lists anything still missing.

**Add a track**

1. Add it to `tracks` in `workshop.yaml`.
2. Run `wsbuilder check`, which lists each module that needs a block.
3. Add the blocks in every language.

**Prepare to publish**

1. Set `url` and `repository` in `workshop.yaml`.
2. Run `wsbuilder check --strict`, and `wsbuilder build`.
3. Open the result with `wsbuilder watch` and read through it.

## This workshop

- The audience is children from 8 to 12, and everything is written in Spanish from Spain.
  Keep the vocabulary simple, the tone warm, and the steps short and numbered.
- Spanish (`es`) is the default and English (`en`) the translation, in `NN-name.en.md`.
  Keep both at parity. The English text uses the block names of MakeCode in English
  ("on start", "show leds", "on shake"...).
- English screenshots live in `modules/images/en/`, with the same file names as the
  Spanish ones in `modules/images/`. Images with no Spanish text (the simulator, the
  English home page) are shared. The English versions were made by editing the Spanish
  images with Codex image generation, taking every MakeCode string from MakeCode's own
  locale files; when a Spanish screenshot changes, update its English twin too.
- Images in `index.md` use markdown syntax, not raw HTML, so their paths are rewritten
  for `/en/`. `theme/custom.css` sizes the cover.
- Modules are called "proyectos" ("projects"), never "ejercicios" or "módulos", in the text and in the
  interface (see `ui` in `workshop.yaml`).
- Participants build everything in MakeCode (makecode.microbit.org), so there is no
  `exercises/` directory and no downloads. Programs are shown as screenshots of the blocks
  in `modules/images/`, named `NN-description.png` after the module.
- The pseudo-code blocks that describe block programs have no language, so they are not
  highlighted.
- Troubleshooting goes in "Problemas comunes" as `> [!HINT] 🤔 Question?` callouts, and
  each module ends with a `> [!TIP]`.
