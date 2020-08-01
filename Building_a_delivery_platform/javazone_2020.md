
# {data-background-image="static/soria_moria.jpg" style="color:LightGray"}
## BUILDING A DELIVERY PLATFORM {.slide: style="color:Black"}
</br>
by
</br>
Anders Brujordet

---

# {data-background-image="static/soria_moria_faded.jpg"}
## Topics
1. What is a Delivery Platform?
2. Building a Delivery Platform

---

## Assumptions
- You know that delivering small changes often is a good approach

---

# {data-background-image="static/containers_faded.jpg"}
## What is a Delivery Platform?


::: notes
Story time
Let's start by looking at how I stumbled into building one

:::

---

## Getting my toes wet

- Company: Knowit Objectnet
- Developers: 50+
- Title: Java Consultant
- Project: Public Sector Integration Bus

::: notes
- 10 years ago I was a Java consultant at Knowit, one of my first jobs
- Surprisingly not slow with bureaucracy++, hand holding
- CI: Hudson, Monitoring: Nagios, early adopters Github Enterprise
- CD: started slow, then Puppet + some ruby
- A great first experience as a developer
:::

---

## What enabled this?
- Mostly nerds who loved their job
- A few key people drove this specific process
- __They had support from management__

::: notes
- First off; I had no idea that this was weird in 2011, public sector
- I assumed that periodic deployments was a thing of the past
- They wanted to: learn, try new things, use best practices.
- Strong tech culture, lot's of knowledge sharing
- Even the financial chief implemented a coding challenge in excel during
seminar
:::

---

## Scaling up

- Company: Finn.no
- Developers: 150+
- Title: Scala developer
- Project: Public and Private REST APIs

::: notes
- After working 3 years on Java, I wanted to learn more Scala
- Finn had a really solid Scala team, where I learned so much
- CI: Bamboo, CD: Puppet, Monitoring: Grafana + ELK
- Lot's of tools, and homemade deployment web UI. Nice
- I got to create CI for Varnish
:::

---

## What enabled this?
- Strong Product organization that pushed for innovation
- Efforts driven by infra and some eager Developers
- __They had support from management and product__

::: notes
- Lot of the same culture as Knowit
- Little fear of change
- They wanted to: learn, try new things, use best practices.
:::

---

## Entering the big leagues

- Company: Schibsted
- Developers: 1500+
- Title: Infrastructure Engineer
- Project: Schibsteds Global CI/CD platform

::: notes
- We created a global platform for CI/CD
- CI: Travis, CD: Spinnaker, Monitoring: DataDog + Sumologic
- Many other teams were creating so many useful tools
- Managed k8s clusters, custom secret management etc
- Inspired by Netflix, Google, Twitter etc.
- Huge collaborative effort
:::

---

## Why were they doing this?
- Driven by infra organization, and eager teams
- Companies could save money by sharing the cost
- __They had support from top level leadership__

::: notes
- Schibsted = Many similar sites = similar needs
- Exceptionally hungry culture, very senior engineers
- They wanted to: learn, try new things, use best practices.
:::

---

## The common culture

- Eager to learn and share, focus on best practices
- Responsibility is shared, but driven by a few
- Support from management and the organization

::: notes
- Everyone takes responsibility for adopting and using
- A few eagerly improve the solution
- Management sees the benefits and supports usage of time
:::

---

## The common benefits

- Less distractions for developers
- Shorter feedback loops
- Easier to visualize current status

::: notes
- less distractions, faster development, happy developers
- Short feedback loops -> less bugs, faster fixes
- Insight -> Easier to argue for fixing tech debt
:::

---

## Let's try to make a definition

![DevOps_cloud](static/devops_cloud.png){.stretch}

::: notes
- We have a bunch of tools
- But they are not a platform
- We need to chain them, into reusable loops
:::

---

## What does this look like?
  - Development loop
  - Deployment loop
  - Monitoring loop

---

## Development loop
![](static/development_loop.png)


---

- Push code changes
- CI should:
  - Run tests
  - Run code analysis
  - Run security analysis
  - If everything passes, upload the artifact
- If any of the above fail, we fix and repeat

---

## Deployment loop

- CD deploys to test
- CI runs integration tests
- User/Customer verifies
- CD deploys to production

---

## Monitoring loop
- A problem is reported by monitor (examples)
- Development loop
- Deployment loop

---

## Visualize the delivery automation system
graph

---

## This is a Delivery Automation System
- The source code is:
  - Tested
  - Deployed
  - Verified
  - Monitored
- It requires initial setup and configuration
- The pieces are hard coded, and can't be swapped

::: notes
- This is what Knowit and Finn had
- A hard coded, automated pipelines
- It requires on boarding and initial configuration
:::

---

## The Delivery Platform

- Task = job, with input and output
- Pipeline = a DAG of tasks
- Default pipeline = Delivery Automation System

::: notes
- Task is unit tests, or deploy to dev
- One pipeline for test and deploy to Artifact storage
- One pipeline for deploy to x and integration test
- Another for deploy to production
- One Meta pipeline that shows the overall progress
:::

---

| Platform | Automation System |
|-|-|
| Automatic enrollment | Manual setup* |
| Easy to add features | Hard to add features |
| Individual pipelines | Shared pipelines |
| Customizable monitoring | Shared monitoring setup |
| Customizable tasks | Shared tasks|
| Collaboration | Traditional SaaS |
| DevOps | Automated Ops |

::: notes
- * Usually requires use of a company tool during build
- Features could be support for new languages or tools
- Customizing requires knowledge of underlying tool
:::

---

## A Delivery Platform is..

.. a set of __services__ that can be __composed__ as __tasks__ into a __pipeline__ that brings
source code into production in a __safe__, __predictable__ and __repeatable__ manner with
__sane defaults__.

::: notes
- That's probably the longest introduction I've had to any presentation
:::

---


## Main: Building a Delivery Platform
### The profit and pain


# Know where you are {data-background-image="static/you_are_here.png"}

::: notes
- What is the current situation in the company
- What works, what doesn't
- What is currently causing the most pain
- Where can we add the most value first?
- Who can help with this
- Do you have backing to do this?
:::

---

## Interview people
- What are their concerns
- What are their pain points?
- Where do they feel that we are?
- Do they all agree?

::: notes
- Talk to a few people from everywhere
- Developers
- Operations
- Managers
- Maybe even customers?
:::

---

## Interview people

This information is extremely useful for:

- Designing the platform components
- Understanding what makes the platform useful for them
- Visualize areas where they could collaborate with other teams
- Identify and help mitigate team2team issues

---


## So am I a team coach now?

In short; yes.

- If the teams are not cooperating you will be blocked by discussions and
support.
- If teams are collaborating, they will support each other.

::: notes
- Support and on boarding is by far the most expensive work
- The problems are usually very similar, and simple to fix
- The overhead of constantly context switching is huge
:::

---

## Metrics
- Start gathering metrics to visualize what you've learned from the interviews
- Did the metrics confirm or deny ?

---

## Dasboards for fun and profit
- mention smashing
- show how it looks
- How does this help us win the platform battel?
- etc..
::: notes
- Metrics and management is a dangerous subject
- It warrants it's own presentation
- Suffice to say; What they see, they will measure you on.
:::


---

# The Golden Path {data-background-image="static/golden_path.jpg"}

---

## How is this platform used?
  - Will everyone pick and choose tools and versions?
  - Will you provide a set of default tools and versions?

---

## The open approach

Pros:
- Great for experienced DevOps teams
- Teams are not very dependent on the Platform team

Cons:
- Huge cost in on-boarding for inexperienced teams
- No centralized versioning or auditing
- Much harder for teams to migrate to new tools


::: notes
- Freedom to choose all tools
- For small teams, with strong DevOps culture, this might work

- For larger teams, with less DevOps experience much more costly
- No centralized versioning or auditing. Who should be responsible?
- Who will help teams to migrate to new tools?
:::

---

## The Golden Path

Pros:
- Batteries included, no need to re-invent the wheel.
- Teams are free to work on code, rather than config
- Teams are still free to customize their tooling
  - But they must handle these integrations them selves

Cons:
- If something breaks they'll be more dependent on the Platform team


::: notes
- Freedom to work on the interesting problems
- Security of having support
:::

---

## The Golden Path, a shopping list

- A default Pipeline; Build, Test, Audit, Deploy
- Default configuration of secrets, env variables etc.
- Hardened, and up to date base images to build upon.
- Monitoring and logging included by convention.

::: notes
- These are just building blocks that work
- They can be extended and built upon
- Security often comes last, why not get some for free?
- Monitoring by convention, how?
:::

---

## platform.yml

```yaml
  version: 2
  application_name: 'dogfood-api'
```

::: notes
  - We require a PaaS version and a name for the app
  - Everything else is set by default.
  - But how can we extend this?
  - Maybe I want to disable SonarQube?
:::

---

## platform.yml

```yaml
  …
  healthchecks:
    liveness:
      http:
        path: /_/my_unconventional_health_check_path
  ingress:
    - host: dogfood-api.ingress.local
  ports:
    - target_port: 5678
  replicas:
    maximum: 10
    minimum: 20
  SonarQube:
    - enabled: false
```

::: notes
  - This was actually a part of a k8s deloyment
  - So we can drop into k8s. Full power.
  - This is basically Fiaas, that we used at Finn.
  - For a k8s shop, this makes sense.
  - You might need a different way of doing this
:::

---

## Convention over configuration

- What if you had to check a manual before:
  - Driving on an new road?
  - Eating in a new restaurant?
  - Talking to a new person?

::: notes
  - Instead we rely on conventions
  - We know that driving on a road A is similar to road B.
:::

---

## Convention over configuration

It makes a world of difference when:
- Integrating tools
- Figuring out what belongs where
- Configuring custom pipelines


:::notes
- Naming conventions, between Github and NexusIQ
- You can just follow the name
- You know how we name things, so you have guidance
:::

---

# {data-background-image="static/challenge_conventions.jpg"}
## Never be afraid to challenge the conventions

::: notes
- They are a tool, to guide and help
- Not limit or restrict
:::

---

## Defining your success metrics

After the interviews we gathered some metrics, which reflected
our status quo. Now where do we want to go?

---

# {data-background-image="static/lowhanging_fruit.jpg"}
## Low hanging fruits

::: notes
- Start with the low hanging fruits
- Usually this means smaller teams, with less legacy
- Usually they have less automation, maybe never even deployed
- Often happy to get help, stretched for resources
:::

---


# {data-background-image="static/lowhanging_fruit_faded.jpg"}

> Here I am wearing myself out to get a bunch of sour grapes that are not worth gaping for.

\- Aesop's Fables

::: notes
- The story goes, that the fox eyed the biggest grapes hanging the highest vine.
- When he could not reach them he belittled the grapes, as sour / not worth his time
- This is a classic mistake of over reaching, and it's easy to do.
- As on-boarding high profile teams gives the platform publicity.
- But the stakes are high, and they don't have time to spend on buggy platforms
:::

---

## Ask for volunteers

Or prepare for resistance!

::: notes
- In the early phases of creating the first proper platform
- We were instructed to on-board certain teams
- This sometimes worked, but also failed _hard_ at times
- Gave the impression that we could give them orders.
- This also exacerbates cognitive biases
:::

---

## Status quo bias

> The current baseline (or status quo) is taken as a reference point, and any change from that baseline is perceived as a loss


::: notes
- And in our case that often made sense
- If our offering was not much better than what they already had
- Especially considering the work needed to migrate
- Big reason for low hanging fruit
:::

---


## Loss aversion

> We prefer avoiding losses to acquiring equivalent gains.

::: notes
- surprisingly, teams in dire need of migrating from unmaintained/buggy
solutions, were also reluctant
- They agreed that the situation was bad, but were never satisfied with our
offering even though it was much better.
- They had invested a lot of time, in small nifty features.
- These things didn't seem important as they were minor things.
- But our brains don't work like that, we failed to pay attention, and they
did not want to loose their useful features.
:::

---

## IKEA effect

> We tend to place a disproportionately high value on products we've partially created.


::: notes
- keeping the previous team in mind
- they had created this tooling themselves
- the IKEA effect probably also contributed to their unwillingness to on-board
:::

---

# {data-background-image="static/dogfooding.jpg"}
## Dogfooding

::: notes
- Sales people use this argument all the time
- I drive this car my self. Suddenly we trust their review more
- But there is some truth to this
- Using the tools we make, is a great way to test, and improve them.
- Early warning system
:::

---

# {data-background-image="static/dogfooding_faded.jpg"}
## Be aware though

You have insight into the tools in a way a user never will.


---

## Support

> We’ve started to on board teams and everything was going great! But suddenly
> they started asking questions, finding bugs and stealing all our time!


\- Some Platform Engineer probably

::: notes
- How do users report problems?
- How do these reports find the responsible person/team?
- Who follows up on reports that span several teams?
- Is this users responsibility?
:::

---

## First iteration at Schibsted
- One delivery team of 4 people
- Artifactory, Travis, Spinnaker
- All users were participating in discussions on Slack
- We were very available

::: notes
- This worked great, we got lots of valuable feedback
- Fast iterations, detailed bug reports, quick fixes
- The user felt safe, because we were right there with them
:::

---

## But it doesn't scale

A few months later, we all had a slack notification bar that looked like we just
posted about free ice cream in the 'Everyone' channel.

::: notes
- Constant interruptions
- Repeated questions
- Features and support both suffered a lot
- Some users were getting really frustrated, as their tickets weren't handled
- We, were getting frustrated
:::

---

## So what had changed?
- 50 users increased to 500
- General population instead of just the most interested
- We were no longer picking only low hanging fruits
- And this is all perfectly natural

---

## The Unified Support
- _One_ entrypoint for all platform support in Jira
- Changing product support channels to community channels
- _One_ slack channel for urgent bug reports, and status updates
- The one call team member handled support routing

::: notes
- Our manager restructured our entire support setup
- Letting users have one place to report bugs
- Regardless of where the ticket should be routed
- The community channels became a great place for teams, and users started
  taking responsibility helping others
:::

---

# {data-background-image="static/full_speed.jpg"}
## Full speed ahead

::: notes
- The pit stop was an analogy we used a lot
- We were the pit stop crew
- Users knew where to stop
- We know who should do what
- Quick fix, quick win
:::

---

# {data-background-image="static/full_speed_faded.jpg"}
## Questions?

Feel free to share your experiences, ask questions or disagree with me on
Twitter: @brujoand

</br>

Images in this presentation were sourced from pxfuel.com and pexels.com
