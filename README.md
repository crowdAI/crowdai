![CrowdAI Logo](https://www.crowdai.org/assets/crowdai_logo_smile-e85e52e02f89493e355c1459d0409de859c0a239f7b177fd73731dca9cbf61fb.svg)

By [Salathé lab](http://plataformatec.com.br/).



### Development Standards

#### Responsiveness

crowdAI uses a combination of Rails variants and media queries built over a Twitter Bootstrap base. Rails Variants are used when a different layout is delivered by device, while media queries deliver different margins, padding, font-size etc.

crowdAI uses the following custom media queries (found in `_variables.scss`)

```
$breakpoints: (phone: 380px, tablet: 768px, desktop: 1024px);
```

They are used directly, eg:

```
@include media(">=phone", "<=tablet") { ... }
```
