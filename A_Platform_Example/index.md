
## Let's make code go brrrrrr

---

## Main Goals

| Increase       | Reduce               |
| -              | -                    |
| Productivity   | Blockers             |
| Reliability    | Frustration          |
| Visibility     | Chaos                |
| Security       |                      |


::: notes
  none
:::

---

## Core concepts

- Golden Path
- Convention over configuration
- Walk before you run
- Trust but verify

::: notes
  none
:::


---

## The Golden Path

One fully supported chain of services from code to production.

::: notes
It should be simple to step away from the services, and simple to step back.
But anyone who walks out are on their own. The key is to have clear and well
documented integration points.
:::

---

## Convention over configuration

Configuration should only be needed, when something breaks with convention.

::: notes
This minimizes cognitive load, and makes it easier to get onboarded.
It also promotes self service rather than hand holding
:::

---

## Walk before you run

A parachute is invaluable to a sky diver, but useless when climbing trees.
</br>
  \- Me

::: notes
There is a tendency to just throw bleeding edge services on the problem. But if
the teams aren't ready, they won't benefit from fancy tools. 90% of platform
work is training and collaboration.
:::


---

## Trust but verify

Give enough freedom to boost productivity, but monitor and alert when rules are
broken.

::: notes
The alternative is to lock everything down, and have an overworked platform
team and frustrated engineers
:::

## Assumptions

  - All deployments are targeting k8s
  - Helm is the only supported integration into k8s
  - The engineers are mature enough to be targeting an engaged DevOps workflow
  - Engineering teams have been interviewed and choices are based on current needs
  - Cost estimation has been done and the tooling fits within budget

::: notes
 - no direct kubectl apply
 - We require all containers to come from Selfhosted registry
 - We will chose gitops over say spinnaker based on maturity and deployment
 targets
:::

---

## Tooling

  - Github: for CI/CD and authentication source of truth
  - Authentik: SSO
  - 1Password operator: Secrets
  - Kubernetes: Flux2 + Kubenav
  - Observability: Prometheus + Loki + Grafana + PagerDuty
  - Custom: In house tooling for Platform events

::: notes
this custom tool will receive events from actions like builds, deployments,
incidents, rollbacks etc. And should visualize deployments, and allow searches.
For instance, what changes was deployed to application X October 1st?
Generates Prometheus metrics for vital productivity data and servers as a
Service directory.
:::

---

## Birds eye design

- Local development
- Continuous integration
- Continuous deployment
- Monitoring
- Kubernetes runtime
- Documentation & Support

::: notes
none
:::

---

## Local development

- Pre-commit hooks that tie into CI ruleset
- Helpers to run Github builds locally
- Helpers for spinning up k8s with minikube

---

## Continuous integration

- Based on Github Actions with on-prem runners
- Shared actions provided by the platform
  - Formatting
  - StyleCheck
  - OWASP Dependency scanning
  - Gitleaks secret detection
- Secrets provided by 1password operator

---

## Continuous integration - Artifacts
- Docker:
  - Hardened base images
  - Uploaded to selfhosted container registry
  - Scanned for vulnerabilities by Trivy
- Helm:
  - Common helm chart library
  - Uploaded to Github sites repository

---

## Continuous deployment

- Gitops implemented by Flux2 (RBAC)
- Kubernetes insights by Kubenav (RBAC)

::: notes
RBAC dictates what a given user can manipulate in a given cluster
:::

---

## Observability

- Metrics: Promethus + Mimir (LTS)
- Logs: loki
- Dashboards: Grafana
- Alerting: PagerDuty
- ServiceDebugging: [Mizu](https://github.com/up9inc/mizu)

---

## Kubernetes runtime
- Dev: Read+Write
- Prod: Read only (Except a few functions like rollout restart etc)
- All traffic is encrypted / behind TLS
- Only images from selfhosted registry deployed
- Containers should not run as root (exceptions will occur)
-

::: notes
none
:::

---

## Documentation & Support

- Documentation: Github Pages
- Dedicated slack channel user community
- Support: Github Issues / Discussions
- Monthly stakeholder meetings


## Training

- Linux and Docker fundamentals
- Kubernetes objects
- Helm charts and libraries
- Flux
