+++
title = "{{ replace .Name "-" " " | title }}"
# linkTitle = "Short title"   # selected tier only; shown in the Home "Selected" list
year = {{ now.Year }}
status = "in-progress"          # proposal | in-progress | published
tier = "list"                  # selected | list
weight = 10                    # ties within a year sort by weight ascending
summary = ""                   # one line; shown in the "Earlier work" (list) tier only
# draft = true
[[links]]
label = "Paper"
url = ""
+++

Selected-tier entries: one paragraph of body text goes here (rendered on the Research page).
List-tier entries: leave the body empty and set `summary` above.
