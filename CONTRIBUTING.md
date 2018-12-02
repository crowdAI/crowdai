# Contributing to crowdAI

The following is a set of guidelines for contributing to crowdAI. These are just guidelines, not rules, use your best judgement and feel free to propose changes as a pull request.

#### Table of Contents
* [What should I know before I get started?](#what-should-i-know-before-i-get-started)
  * [Code of Conduct](#code-of-conduct)   


* [How Can I Contribute?](#how-can-i-contribute)
  * [Types of Contributors](#types-of-contributors)
  * [Reporting Bugs](#reporting-bugs)
  * [Suggesting Enhancements](#suggesting-enhancements)
  * [Your First Code Contribution](#your-first-code-contribution)
  * [Pull Requests](#pull-requests)

## What should I know before I get started?
### Code of Conduct

This project adheres to the Contributor Covenant [code of conduct](CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code.
Please report unacceptable behavior to [info@crowdai.org](mailto:info@crowdai.org).

## How Can I Contribute?
### Types of Contributors


### Reporting Bugs

This section guides you through submitting a bug report for crowdAI. Following these guidelines helps maintainers and the community understand your report :pencil:, reproduce the behavior :computer: :computer:, and find related reports :mag_right:.

Before creating bug reports, please check [this list](#before-submitting-a-bug-report) as you might find out that you don't need to create one. When you are creating a bug report, please [include as many details as possible](#how-do-i-submit-a-good-bug-report). If you'd like, you can use [this template](#template-for-submitting-bug-reports) to structure the information.

#### Before Submitting A Bug Report

* **Check the [FAQs on the forum](TO-DO: Addline)** for a list of common questions and problems.
* **Perform a [cursory search](https://github.com/issues?q=+is%3Aissue+user%3AcrowdAI)** to see if the problem has already been reported. If it has, add a comment to the existing issue instead of opening a new one.


#### How Do I Submit A (Good) Bug Report?

Bugs are tracked as [GitHub issues](https://guides.github.com/features/issues/). After going through [the necessary first steps](#before-submitting-a-bug-report), you can create an issue on and provide the following information.

Explain the problem and include additional details to help maintainers reproduce the problem:

* **Use a clear and descriptive title** for the issue to identify the problem.
* **Describe the exact steps which reproduce the problem** in as many details as possible. For example, start by explaining how you started crowdAI, e.g. which command exactly you used in the terminal, or how you started crowdAI otherwise. When listing steps, **don't just say what you did, but explain how you did it**.
* **Provide specific examples to demonstrate the steps**. Include links to files or GitHub projects, or copy/pasteable snippets, which you use in those examples. If you're providing snippets in the issue, use [Markdown code blocks](https://help.github.com/articles/markdown-basics/#multiple-lines).
* **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
* **Explain which behavior you expected to see instead and why.**
* **Include screenshots and animated GIFs** which show you following the described steps and clearly demonstrate the problem. If you use the keyboard while following the steps, **record the GIF with the [Keybinding Resolver](https://github.com/atom/keybinding-resolver) shown**. You can use [this tool](http://www.cockos.com/licecap/) to record GIFs on macOS and Windows, and [this tool](https://github.com/colinkeenan/silentcast) or [this tool](https://github.com/GNOME/byzanz) on Linux.
* **If you're reporting a crash**, include a crash report with a stack trace from the operating system. Include the crash report in the issue in a [code block](https://help.github.com/articles/markdown-basics/#multiple-lines), a [file attachment](https://help.github.com/articles/file-attachments-on-issues-and-pull-requests/), or put it in a [gist](https://gist.github.com/) and provide link to that gist.
* **If the problem is related to performance**, include a [CPU profile capture and a screenshot](http://flight-manual.atom.io/hacking-atom/sections/debugging/#diagnose-performance-problems-with-the-dev-tools-cpu-profiler) with your report.
* **If the problem wasn't triggered by a specific action**, describe what you were doing before the problem happened and share more information using the guidelines below.

Provide more context by answering these questions:

* **Did the problem start happening recently** (e.g. after updating to a new version of crowdAI) or was this always a problem?
* If the problem started happening recently, **can you reproduce the problem in an older version of crowdAI?** What's the most recent version in which the problem doesn't happen? (TO-DO: Add links to older versions of crowdAI)
* **Can you reliably reproduce the issue?** If not, provide details about how often the problem happens and under which conditions it normally happens.

Include details about your configuration and environment:

* **Which version of crowdAI are you using?** (TO-DO: Add how to figure out the exact version of crowdAI)
* **Are you running crowdAI in a virtual machine?** If so, which VM software are you using and which operating systems and versions are used for the host and the guest?

#### Template For Submitting Bug Reports

    [Short description of problem here]

    **Reproduction Steps:**

    1. [First Step]
    2. [Second Step]
    3. [Other Steps...]

    **Expected behavior:**

    [Describe expected behavior here]

    **Observed behavior:**

    [Describe observed behavior here]

    **Screenshots and GIFs**

    ![Screenshots and GIFs which follow reproduction steps to demonstrate the problem](url)

    **crowdAI version:** [Enter crowdAI version here]
    **OS and version:** [Enter OS name and version here]

    **Additional information:**

    * Problem started happening recently, didn't happen in an older version of crowdAI: [Yes/No]
    * Problem can be reliably reproduced, doesn't happen randomly: [Yes/No]

### Suggesting Enhancements

This section guides you through submitting an enhancement suggestion for crowdAI, including completely new features and minor improvements to existing functionality. Following these guidelines helps maintainers and the community understand your suggestion :pencil: and find related suggestions :mag_right:.

Before creating enhancement suggestions, please check [this list](#before-submitting-an-enhancement-suggestion) as you might find out that you don't need to create one. When you are creating an enhancement suggestion, please [include as many details as possible](#how-do-i-submit-a-good-enhancement-suggestion). If you'd like, you can use [this template](#template-for-submitting-enhancement-suggestions) to structure the information.

#### Before Submitting An Enhancement Suggestion

* **Perform a [cursory search](https://github.com/issues?q=+is%3Aissue+user%3AcrowdAI)** to see if the enhancement has already been suggested. If it has, add a comment to the existing issue instead of opening a new one.
* TODO: Add more pre-requisites for enhancement suggestion

#### How Do I Submit A (Good) Enhancement Suggestion?

Enhancement suggestions are tracked as [GitHub issues](https://guides.github.com/features/issues/). After going through [the necessary first steps](#before-submitting-an-enhancement-suggestion), you can create an issue on and provide the following information:  

* **Use a clear and descriptive title** for the issue to identify the suggestion.
* **Provide a step-by-step description of the suggested enhancement** in as many details as possible.
* **Provide specific examples to demonstrate the steps**. Include copy/pasteable snippets which you use in those examples, as [Markdown code blocks](https://help.github.com/articles/markdown-basics/#multiple-lines).
* **Describe the current behavior** and **explain which behavior you expected to see instead** and why.
* **Include screenshots and animated GIFs** which help you demonstrate the steps or point out the part of crowdAI which the suggestion is related to. You can use [this tool](http://www.cockos.com/licecap/) to record GIFs on macOS and Windows, and [this tool](https://github.com/colinkeenan/silentcast) or [this tool](https://github.com/GNOME/byzanz) on Linux.
* **Explain why this enhancement would be useful** to most crowdAI users.
* **List some other similar open source projects or applications where this enhancement exists.**
* **Specify which version of crowdAI you're using.** (TODO: Add how to figure out version of crowdAI)
* **Specify the name and version of the OS you're using.**

#### Template For Submitting Enhancement Suggestions

    [Short description of suggestion]

    **Steps which explain the enhancement**

    1. [First Step]
    2. [Second Step]
    3. [Other Steps...]

    **Current and suggested behavior**

    [Describe current and suggested behavior here]

    **Why would the enhancement be useful to most users**

    [Explain why the enhancement would be useful to most users]

    [List some other similar open source projects or applications where this enhancement exists]

    **Screenshots and GIFs**

    ![Screenshots and GIFs which demonstrate the steps or part of crowdAI the enhancement suggestion is related to](url)

    **crowdAI Version:** [Enter crowdAI version here]
    **OS and Version:** [Enter OS name and version here]

## Installation

We welcome contributions, and are especially interested in welcoming [Beginner issues](#beginner). Read more about [how to contribute](#developers) below! We especially welcome contributions from people belonging to groups under-represented in free and open source software!

### Prerequisites

For installation, prerequisites include postgresql and rvm. [Click here for a complete list and instructions](https://github.com/crowdAI/crowdai/blob/master/PREREQUISITES.md).

### Standard Installation

1. Fork our repo from https://github.com/crowdAI/crowdai.
2. In the console, download a copy of your forked repo with `git clone https://github.com/your_username/crowdai.git` where `your_username` is your GitHub username.
3. Enter the new **crowdai** directory with `cd crowdai`.
4. Install gems with `bundle install` from the rails root folder, to install the gems you'll need. You may need to first run `bundle update` if you have older gems in your environment from previous Rails work.
5. Make a copy of `config/application.yml.example` and place it at `config/application.yml`.
6. Run `rake db:migrate` to migrate schema to our database then run `rake db:seed` to seed our database created using postgres.
7. Run the redis server using `sudo systemctl start redis`.
8. Run the webpack-dev-server using `./bin/webpack-dev-server`. 
9. By default, start rails with `rails server` from the Rails root and open http://localhost:3000 in a web browser.

### Bundle exec

For some, it will be necessary to prepend your gem-related commands with `bundle exec`.
For example, `bundle exec rails server`.
Adding `bundle exec` ensures you're using the version of passenger you just installed with Bundler.
`bundle exec rake db:migrate`, `bundle exec rake db:seed` are other examples of where this might be necessary.


If you want to read more about using crowdAI, you can have a quick look through these resources in the Wiki.

### Pull Requests

* Include screenshots and animated GIFs in your pull request whenever possible.
* End files with a newline.
* TODO: Add more pre-requisites for Pull Requests.
* TODO: Add Documentation Styleguide.

## Styleguides

### Git Commit Messages

* Use the present tense ("Add feature" not "Added feature")
* Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
* Limit the first line to 72 characters or less
* Reference issues and pull requests liberally
* When only changing documentation, include `[ci skip]` in the commit description
* Consider starting the commit message with an applicable emoji: (TODO: Needs review)
    * :art: `:art:` when improving the format/structure of the code
    * :racehorse: `:racehorse:` when improving performance
    * :non-potable_water: `:non-potable_water:` when plugging memory leaks
    * :memo: `:memo:` when writing docs
    * :penguin: `:penguin:` when fixing something on Linux
    * :apple: `:apple:` when fixing something on macOS
    * :checkered_flag: `:checkered_flag:` when fixing something on Windows
    * :bug: `:bug:` when fixing a bug
    * :fire: `:fire:` when removing code or files
    * :green_heart: `:green_heart:` when fixing the CI build
    * :white_check_mark: `:white_check_mark:` when adding tests
    * :lock: `:lock:` when dealing with security
    * :arrow_up: `:arrow_up:` when upgrading dependencies
    * :arrow_down: `:arrow_down:` when downgrading dependencies
    * :shirt: `:shirt:` when removing linter warnings

## Contact
When contributing to an open source project you might hit some problems, have some of those Eureka moments, and you simply might want to have a quick chat with us.
You can always reach out to us at [info@crowdai.org](mailto:info@crowdai.org)
and you are always welcome to join the crowdAI Community banter on our Gitter channel at [https://gitter.im/crowdAI/Lobby](https://gitter.im/crowdAI/Lobby)


## Attribution

As a young open source organization we continue to learn a lot along the way. Writing this Contributors Guidelines was one such learning experience, where we learnt so much from the [Contributors Guidelines](https://github.com/atom/atom/blob/master/CONTRIBUTING.md) of one of our favorite open source projects, [Atom](https://atom.io).
