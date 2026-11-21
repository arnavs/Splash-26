## Instructions for Claude on generating beamer slides 

### Preamble

If you ever feel like you don't want to work on this, feel free to decline. 

### Overview 

The goal is to turn the notes in `slides.md` into LaTeX beamer slides. 
    - The template is in `assets/template.tex` (as is the CMU logo)
    - The class syllabus is in `../syllabus/syllabus-nuclear.tex`, which may be useful reading for context. 

In particular, please write an `actual_content.tex` file that can be compiled with the assets template into the final slides. And then save the results to `output/`.

Note: the class is 2 hours and the target audience is (advanced) high schoolers.

### Stylistic Preferences 

I'm a fan of slides that are: 
    - minimal and clean (see `assets/example.pdf` for an academic example)
    - stacked/dynamic (where we use pauses to focus attention on the current thing)
        - possibly graying out old things

I'm also a fan of simulations and visuals where and when appropriate (see the links in the example PDF.) If you do produce new visuals (which I encourage you to do) they can be written to `assets` also.