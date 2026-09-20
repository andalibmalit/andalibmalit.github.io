---
title: "Multiple imputation at HPC scale: missing offender demographics in a decade of NIBRS"
linkTitle: "Multiple imputation at HPC scale"
year: 2025
status: in-progress
tier: selected
weight: 2
links:
  - { label: "Blog post", url: "https://arctic.gsu.edu/2026/02/18/filling-the-gaps-in-criminal-justice-data/" }
---

FBI incident data (NIBRS) records roughly 10–12 million incidents a year and often lacks the offender’s race, ethnicity, age, or drug involvement. Dropping incomplete records can bias any analysis built on the rest — including the ones meant to measure disparities in how policing and policy affect specific communities. For Dr. Danye Medhin’s criminal-justice study of exactly that question, I rebuilt a multiple-imputation procedure as a parallel Python pipeline: 50 imputed datasets, over a billion record-level operations, ~100 concurrent Slurm jobs, and under two days end to end instead of six-plus weeks on a workstation. The ~500 GB output ships to collaborators nationwide and underpins two papers in preparation.
