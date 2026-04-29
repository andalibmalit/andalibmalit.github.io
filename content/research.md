<section class="research-projects">

<!-- Project 1: HumaneBench -->
  <div class="project">
    <div class="project-description">
      <h2>HumaneBench: adversarial evaluation of prosocial behavior in frontier LLMs</h2>
      <p>
        HumaneBench evaluates robustness of prosocial behavior in large language models. We tested models from six labs (OpenAI, Anthropic, Google DeepMind, Meta, DeepSeek, xAI) across 788 validated scenarios spanning mental-health, addiction, self-harm, and age-targeted contexts; and used persona prompt injection to test manipulability. We measured 67% manipulability into harmful advice with bootstrap confidence intervals, and established 96% human–LLM judge agreement to enable reliable automated evaluation at scale.
      </p>
      <p>
        The methodology is the contribution: rather than assume LLMs will behave as observed under sanitized test conditions, our "good persona/bad persona" approach predicts behavior in real-world contexts that increase the likelihood of either helpful or harmful outputs — and the design (LLM-judge validation against human raters, statistical robustness measurement) generalizes beyond the humane-tech setting. The rubric is grounded in <a href="https://humanebench.ai/principles" target="_blank">care ethics applied to LLM behavior</a> — what makes a model trustworthy under stress.
      </p>
      <p>
        The framework has been adopted by <a href="https://storytell.ai/" target="_blank">Storytell.ai</a> and other startups for production safety evaluation. Coverage in <a href="https://techcrunch.com/2025/11/24/a-new-ai-benchmark-tests-whether-chatbots-protect-human-wellbeing/" target="_blank">TechCrunch</a> and <a href="https://builtin.com/articles/humane-ai-benchmark" target="_blank">Built In</a>. An AIES 2026 submission formalizing v1 methodology is in preparation.
      </p>
      <a href="https://humanebench.ai" target="_blank">View Benchmark</a>
    </div>
    <div class="project-media">
      <img src="/images/research/humanebench.png" alt="HumaneBench Steerability Analysis" width="560" height="357">
    </div>
  </div>

  <!-- Project 2: MSR DDPG / RL under uncertainty -->
  <div class="project">
    <div class="project-description">
      <h2>Reinforcement learning for autonomous decision-making under uncertainty</h2>
      <p>
        In collaboration with the West Atlanta Watershed Alliance during a research internship at Microsoft Research, I developed a Deep Deterministic Policy Gradient (DDPG) agent for autonomous solar-microgrid management. The agent forecasted day-ahead power demand and energy prices, then traded autonomously in regional energy markets while satisfying local microgrid load constraints, reducing predicted power costs by 50%. The work demonstrated that an RL agent could simultaneously optimize for grid stability and market participation in a setting where forecasts had to be made under genuine demand-side and price-side uncertainty.
      </p>
      <a href="https://www.microsoft.com/en-us/research/blog/ai-powered-microgrids-facilitate-energy-resilience-and-equity-in-regional-communities/" target="_blank">View Blog Post</a><br>
      <a href="https://drive.google.com/file/d/1gsuASH-uvSGmMIhlUZl4iiQPdnVaG4a2/view?usp=sharing" target="_blank">View Slide Presentation</a>
    </div>
    <div class="project-media">
      <iframe style="width: 560px; height: 350px;" src="https://www.youtube.com/embed/cUR8pQZTYjw"
      frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
    </div>
  </div>

  <!-- Project 3: HPC-scale econometric pipelines -->
  <div class="project">
    <div class="project-description">
      <h2>Econometric pipelines at HPC scale: 323M-record labor-market analysis</h2>
      <p>
        In support of GSU labor-economics research, I parallelized a difference-in-differences / event-study / triple-difference econometric pipeline over ~323M Linkup job postings — replacing a 12+ hour Stata workflow with a 1–2 hour Python micro-task pipeline distributed across a 251-way SLURM array. The work involved refactoring messy panel-data preparation into reproducible stages, designing the parallel decomposition for memory and I/O bottlenecks, and validating numerical equivalence with the original Stata implementation. The pipeline is now in active use by the research team for treatment-effect estimation across regional labor markets, and <a href="https://doi.org/10.2139/ssrn.6537038" target="_blank">resulted in a publication</a>.
      </p>
    </div>
  </div>

  <!-- Project 4: PCMCI causal inference on social-media data -->
  <div class="project">
    <div class="project-description">
      <h2>Causal inference on multimodal social-media data</h2>
      <p>
        I conducted a pilot study collecting and analyzing TikToks related to firearm-policy discourse. Using zero-shot transformer classification, I separated videos into time series representing pro- and anti-regulation content. Applying the PCMCI causal-discovery framework, I analyzed conditional independencies between TikTok discourse intensity and background-check data for firearm purchases, quantifying contemporaneous and lagged relationships across post-mass-shooting periods. The pipeline was carried forward by subsequent lab members. Presented at AMS, MAA, and the GA-AL LSAMP regional symposium.
      </p>
      <a href="https://drive.google.com/file/d/1sranoR9i2uNMhbYFWNHp4gEQ4H-Sw7RK/view?usp=sharing" target="_blank">View Poster Presentation</a>
    </div>
    <div class="project-media">
      <img src="/images/research/tiktok.png" alt="TikTok discourse time series" style="width: 560px; height: 530px;">
    </div>
  </div>

  <!-- Project 5: Agent-based modeling -->
  <div class="project">
    <div class="project-description">
      <h2>Agent-based modeling of firearm acquisition trends</h2>
      <p>
        I built an agent-based model of New York City census tracts as a network, calibrated against U.S. Census data, historical redlining maps, and CDC firearm-mortality data as proxy ground truth. Firearm acquisition was modeled as a contagion process spreading along social-network edges when local crime-rate or demographic-similarity rules triggered. The simulation tested hypotheses about the relative weights of crime exposure, social influence, and demographic clustering in driving acquisition trends, providing a counterfactual scaffold for policy-effect estimation in a setting where randomized intervention is impossible.
      </p>
      <a href="https://drive.google.com/file/d/1jIeMOBEdA76G6PcgJdTYP_Fj8Nzmg3Nl/view?usp=sharing" target="_blank">View Poster Presentation</a>
    </div>
    <div class="project-media">
      <img src="/images/research/abm.png" alt="NYC agent-based model" width="500" height="375">
    </div>
  </div>

  <!-- Project 6: Predator–prey + parasite (REU) -->
  <div class="project">
    <div class="project-description">
      <h2>Predator–prey dynamics with a multi-species parasite</h2>
      <p>
        An undergraduate REU project at Georgia Tech: I built an agent-based simulation of predator–prey interactions based on the Lotka–Volterra equations, investigating the population-level effects of a multi-species parasite (<em>Riberoia ondatrae</em>) that infects both populations but degrades only prey fitness. The simulation showed how parasite prevalence shifts the equilibrium between predator and prey populations across generations.
      </p>
      <a href="https://drive.google.com/file/d/1VjGWaKdTxFQ3tNWp9ezh5Dl-tBjigA8M/view?usp=sharing" target="_blank">View Slide Presentation</a>
    </div>
    <div class="project-media">
      <img src="/images/research/pred-prey.png" alt="Predator-prey simulation" width="400" height="400">
    </div>
  </div>

</section>
