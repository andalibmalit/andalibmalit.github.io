---
title: "Reinforcement learning for autonomous energy-market trading (Microsoft Research)"
year: 2023
status: published
tier: list
weight: 1
summary: "DDPG agent for solar-microgrid management; cut predicted power costs by 50%."
links:
  - { label: "Blog post", url: "https://www.microsoft.com/en-us/research/blog/ai-powered-microgrids-facilitate-energy-resilience-and-equity-in-regional-communities/" }
  - { label: "Slides", url: "https://github.com/andalibmalit/microgrid-msft/blob/main/microgrid-control.pdf" }
  - { label: "Video", url: "https://www.youtube.com/watch?v=cUR8pQZTYjw" }
---

In collaboration with the West Atlanta Watershed Alliance during a research internship at Microsoft Research, I developed a Deep Deterministic Policy Gradient (DDPG) agent for autonomous solar-microgrid management. The agent forecasted day-ahead power demand and energy prices, then traded autonomously in regional energy markets while satisfying local microgrid load constraints, reducing predicted power costs by 50%. The work demonstrated that an RL agent could simultaneously optimize for grid stability and market participation in a setting where forecasts had to be made under genuine demand-side and price-side uncertainty.
