<section class="research-projects">

<!-- Project 1: HumaneBench -->
  <div class="project">
    <div class="project-description">
      <h2>HumaneBench: adversarial evaluation of prosocial behavior in frontier LLMs</h2>
      <p>
        HumaneBench evaluates robustness of prosocial behavior in large language models. We tested models from six labs (OpenAI, Anthropic, Google DeepMind, Meta, DeepSeek, xAI) across 788 validated scenarios spanning mental-health, addiction, self-harm, and age-targeted contexts; and used adversarial system prompts to test robustness. We found 10 of 15 models flip from prosocial to net-harmful behavior under a single adversarial system prompt (cluster-bootstrap confidence intervals), and established 96% human–LLM judge agreement to enable reliable automated evaluation at scale.
      </p>
      <p>
        The methodology is the contribution: rather than assume LLMs will behave as observed under sanitized test conditions, our "good persona/bad persona" system-prompt approach predicts behavior in real-world contexts that increase the likelihood of either helpful or harmful outputs — and the design (LLM-judge validation against human raters, statistical robustness measurement) generalizes beyond the humane-tech setting. The rubric is grounded in <a href="https://humanebench.ai/principles" target="_blank">care ethics applied to LLM behavior</a> — what makes a model trustworthy under stress.
      </p>
      <p>
        The framework has been adopted by <a href="https://chief.bot/" target="_blank">Chief.bot</a> and other startups for production safety evaluation. I also applied this methodology in a confidential production-safety engagement for a consumer AI company, auditing their own LLM-judge evaluation of real production conversations and adapting the evaluation for messy production data.
      </p>
      <p>
        Coverage in <a href="https://techcrunch.com/2025/11/24/a-new-ai-benchmark-tests-whether-chatbots-protect-human-wellbeing/" target="_blank">TechCrunch</a> and <a href="https://builtin.com/articles/humane-ai-benchmark" target="_blank">Built In</a>. A paper formalizing the v1 methodology is under peer review.
      </p>
      <a href="https://humanebench.ai" target="_blank">View Benchmark</a>
    </div>
    <div class="project-media">
      <img src="/images/research/humanebench.png" alt="HumaneBench adversarial evaluation results" width="560" height="357">
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

  <!-- Project 4: NIBRS multiple imputation -->
  <div class="project">
    <div class="project-description">
      <h2>Multiple imputation at HPC scale: missing-demographics inference on a decade of NIBRS</h2>
      <p>
        In support of GSU criminal-justice research, I parallelized a multiple-imputation-with-bootstrapping pipeline over ~10 years of FBI NIBRS data (~10–12M incidents per year, 2015–2023) — translating a Stata workflow that would have taken 6+ weeks on a workstation into a Python pipeline that runs end-to-end in under 2 days across ~100 concurrent SLURM jobs, with over a billion record-level operations and ~50× speedup on imputation generation alone. The work involved refactoring the imputation procedure into parallel-safe stages, building a robust merge step over the 50 imputed datasets and the original incident files, and distributing the resulting ~500 GB to collaborators nationwide via S3. The pipeline enables principled inference about missing offender demographics — race, ethnicity, age, drug involvement — that would otherwise be dropped via listwise deletion, and is the methodological backbone for two upcoming publications.
      </p>
    </div>
  </div>

  <!-- Project 5: PCMCI causal inference on social-media data -->
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

  <!-- Project 6: Agent-based modeling -->
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

  <!-- Project 7: Predator–prey + parasite (REU) -->
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

  <!-- Talks & Presentations -->
  <div class="project">
    <div class="project-description">
      <h2>Talks &amp; Presentations</h2>
      <p>Selected talks bringing ARCTIC's AI-serving work to technical and leadership audiences.</p>
      <ul>
        <li>Co-presented "Infrastructure for Research, AI, and Workforce Development" at an NSF/OPM CyberCorps site visit (April 16, 2026), with Chris Childress and Scott Burns.</li>
        <li>Co-presented "Serving AI Research Without Running Out of GPUs" at the Cyberinfrastructure Planning Community of Practice — a virtual community convened for cyberinfrastructure planning at HBCUs, TCUs, and other minority-serving institutions (part of the Minority Serving–Cyberinfrastructure Consortium, MS-CC) (August 18, 2026), with Chris Childress and Suranga Edirisinghe.</li>
        <li>Co-presented "AI Research &amp; Infrastructure at Georgia State" at GSU's Instructional Innovation &amp; Technology "Digital Chat," the department's monthly gathering (July 28, 2026), with Chris Childress and Suranga Edirisinghe.</li>
      </ul>
    </div>
  </div>

</section>
