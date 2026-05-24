# GitHub Actions Runner Images

**Table of Contents**

- [About](#about)
- [Available Images](#available-images)
- [Announcements](#announcements)
- [Image Releases](#image-releases)
- [Software and Image Support](#software-and-image-support)
- [How to Interact with the Repo](#how-to-interact-with-the-repo)
- [FAQs](#faqs)

## About

This repository contains the source code used to create the VM images for [GitHub-hosted runners](https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners) used for Actions, as well as for [Hetzner Cloud](https://www.hetzner.com/de/cloud/).
To build a VM machine from this repo's source, see the [instructions](docs/create-image-and-azure-resources.md).

## Available Images

| Image | Included Software | Statuses of Latest Image Release | Latest Release |
| --------------------|--------------------|--------------------|--------------------|
| Ubuntu 24.04 | [ubuntu-24.04] | [![Ubuntu - Build template for Ubuntu 24.04](https://github.com/dwydler/runner-images-hetzner-cloud/actions/workflows/ubuntu_build-template-for-24.04.yml/badge.svg?branch=customize)](https://github.com/dwydler/runner-images-hetzner-cloud/actions/workflows/ubuntu_build-template-for-24.04.yml) | [![Latest Release](https://img.shields.io/github/v/release/dwydler/runner-images-hetzner-cloud?filter=ubuntu24*)](https://img.shields.io/github/v/release/dwydler/runner-images-hetzner-cloud?filter=ubuntu24*) |
| Ubuntu 22.04 | [ubuntu-22.04] | [![Ubuntu - Build template for Ubuntu 22.04](https://github.com/dwydler/runner-images-hetzner-cloud/actions/workflows/ubuntu_build-template-for-22.04.yml/badge.svg?branch=customize)](https://github.com/dwydler/runner-images-hetzner-cloud/actions/workflows/ubuntu_build-template-for-22.04.yml) | [![Latest Release](https://img.shields.io/github/v/release/dwydler/runner-images-hetzner-cloud?filter=ubuntu22*)](https://img.shields.io/github/v/release/dwydler/runner-images-hetzner-cloud?filter=ubuntu22*) |
| Ubuntu Slim | [ubuntu-slim] | [![Ubuntu - Build template for Ubuntu 24.04](https://github.com/dwydler/runner-images-hetzner-cloud/actions/workflows/docker-images.yml/badge.svg?branch=customize)](https://github.com/dwydler/runner-images-hetzner-cloud/actions/workflows/docker-images.yml) | |

[ubuntu-24.04]: https://github.com/dwydler/runner-images-hetzner-cloud/tree/customize/images/ubuntu/Ubuntu2404-Readme.md
[ubuntu-22.04]: https://github.com/dwydler/runner-images-hetzner-cloud/tree/customize/images/ubuntu/Ubuntu2204-Readme.md
[ubuntu-slim]: https://github.com/actions/runner-images/blob/main/images/ubuntu-slim/ubuntu-slim-Readme.md


## Announcements

See notable upcoming changes by viewing issues with the [Announcement](https://github.com/dwydler/runner-images-hetzner-cloud/labels/Announcement) label.

## Image Releases

*How to best follow along with changes*

1. Find the latest releases for this repository [here.](https://github.com/dwydler/runner-images-hetzner-cloud/releases)
2. Subscribe to the releases coming out of this repository, instructions [here.](https://docs.github.com/en/account-and-profile/managing-subscriptions-and-notifications-on-github/setting-up-notifications/configuring-notifications#configuring-your-watch-settings-for-an-individual-repository)
3. Upcoming changes: A pre-release is created when the deployment of an image has started. As soon as the deployment is finished, the pre-release is converted to a release. If you have subscribed to releases, you will get notified of pre-releases as well.

   - You can also track upcoming changes using the [awaiting-deployment](https://github.com/actions/runner-images/labels/awaiting-deployment) label.
4. For high impact changes, we will post these in advance to the GitHub Changelog on our [blog](https://github.blog/changelog/) and on [X](https://x.com/GHchangelog).
   - Ex: breaking changes, GA or deprecation of images

*Cadence*

- We typically deploy weekly updates to the software on the runner images.

## Software and Image Support

### Support Policy

- Tools and versions will typically be removed 6 months after they are deprecated or have reached end-of-life
- We support (at maximum) 2 GA images and 1 beta image at a time. We begin the deprecation process of the oldest image label once the newest OS image label has been released to GA.
- The images generally contain the latest versions of packages installed except for Ubuntu LTS where we mostly rely on the Canonical-provided repositories.

- Popular tools can have several versions installed side-by-side with the following strategy:

| Tool name | Installation strategy |
|-----------|-----------------------|
| Docker images | not more than 3 latest LTS OS\tool versions. New images or new versions of current images are added using the standard tool request process |
| Java      | all LTS versions |
| Node.js   | 3 latest LTS versions |
| Go        | 3 latest minor versions |
| Python <br/> Ruby | 5 most popular `major.minor` versions |
| PyPy      | 3 most popular `major.minor` versions |
| .NET Core | 2 latest LTS versions and 1 latest version. For each feature version only latest patch is installed. Note for [Ubuntu images see details.](./docs/dotnet-ubuntu.md) |
| GCC <br/> GNU Fortran <br/> Clang <br/> GNU C++ | 3 latest major versions |
| Android NDK | 1 latest non-LTS, 2 latest LTS versions |
| Xcode     | - only one major version of Xcode will be supported per macOS version <br/> - all minor versions of the supported major version will be available <br/> - beta and RC versions will be provided "as-is" in the latest available macOS image only no matter of beta/GA status of the image <br/> - when a new patch version is released, the previous patch version will be replaced |

### Package managers usage

We use third-party package managers to install software during the image generation process. The table below lists the package managers and the software installed.
> [!NOTE]
> Third-party repositories are re-evaluated every year to identify if they are still useful and secure.

| Operating system | Package manager                       | Third-party repos and packages |
| :---             |        :---:                          |                           ---: |
| Ubuntu           | [APT](https://wiki.debian.org/Apt)    | [Eclipse-Temurin (Adoptium)](https://packages.adoptium.net/artifactory/deb/) <br/> [Erlang](https://packages.erlang-solutions.com/ubuntu) <br/> [Firefox](http://ppa.launchpad.net/mozillateam/ppa/ubuntu) <br/> [git-lfs](https://packagecloud.io/install/repositories/github/git-lfs) <br/> [git](https://launchpad.net/~git-core/+archive/ubuntu/ppa) <br/> [Google Cloud CLI](https://packages.cloud.google.com/apt) <br/> [Heroku](https://cli-assets.heroku.com/channels/stable/apt) <br/> [HHvm](https://dl.hhvm.com/ubuntu) <br/> [MongoDB](https://repo.mongodb.org/apt/ubuntu) <br/> [Mono](https://download.mono-project.com/repo/ubuntu) <br/> [MS Edge](https://packages.microsoft.com/repos/edge) <br/> [PostgreSQL](https://apt.postgresql.org/pub/repos/apt/) <br/> [R](https://cloud.r-project.org/bin/linux/ubuntu)                                      |
| Ubuntu           | [APT](https://wiki.debian.org/Apt)    | [containers](https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable) (Ubuntu 20 only) <br/> [docker](https://download.docker.com/linux/ubuntu) (Ubuntu20 0nly) <br/> [Eclipse-Temurin (Adoptium)](https://packages.adoptium.net/artifactory/deb/) <br/> [Erlang](https://packages.erlang-solutions.com/ubuntu) <br/> [Firefox](https://ppa.launchpad.net/mozillateam/ppa/ubuntu) <br/> [git-lfs](https://packagecloud.io/install/repositories/github/git-lfs) <br/> [git](https://launchpad.net/~git-core/+archive/ubuntu/ppa) <br/> [Google Cloud CLI](https://packages.cloud.google.com/apt) <br/> [Heroku](https://cli-assets.heroku.com/channels/stable/apt) <br/> [HHvm](https://dl.hhvm.com/ubuntu) <br/> [MongoDB](https://repo.mongodb.org/apt/ubuntu) <br/> [Mono](https://download.mono-project.com/repo/ubuntu) <br/> [MS Edge](https://packages.microsoft.com/repos/edge) <br/> [PostgreSQL](https://apt.postgresql.org/pub/repos/apt/) <br/> [R](https://cloud.r-project.org/bin/linux/ubuntu)                                      |
| Ubuntu           | [APT](https://wiki.debian.org/Apt)    | [Eclipse-Temurin (Adoptium)](https://packages.adoptium.net/artifactory/deb/) <br/> [Erlang](https://packages.erlang-solutions.com/ubuntu) <br/> [Firefox](http://ppa.launchpad.net/mozillateam/ppa/ubuntu) <br/> [git-lfs](https://packagecloud.io/install/repositories/github/git-lfs) <br/> [git](https://launchpad.net/~git-core/+archive/ubuntu/ppa) <br/> [Google Cloud CLI](https://packages.cloud.google.com/apt) <br/> [Heroku](https://cli-assets.heroku.com/channels/stable/apt) <br/> [HHvm](https://dl.hhvm.com/ubuntu) <br/> [MongoDB](https://repo.mongodb.org/apt/ubuntu) <br/> [Mono](https://download.mono-project.com/repo/ubuntu) <br/> [MS Edge](https://packages.microsoft.com/repos/edge) <br/> [PostgreSQL](https://apt.postgresql.org/pub/repos/apt/) <br/> [R](https://cloud.r-project.org/bin/linux/ubuntu)                                      |
| Ubuntu           | [APT](https://wiki.debian.org/Apt)    | [Eclipse-Temurin (Adoptium)](https://packages.adoptium.net/artifactory/deb/) <br/> [Erlang](https://packages.erlang-solutions.com/ubuntu) <br/> [Firefox](http://ppa.launchpad.net/mozillateam/ppa/ubuntu) <br/> [git-lfs](https://packagecloud.io/install/repositories/github/git-lfs) <br/> [git](https://launchpad.net/~git-core/+archive/ubuntu/ppa) <br/> [Google Cloud CLI](https://packages.cloud.google.com/apt) <br/> [Heroku](https://cli-assets.heroku.com/channels/stable/apt) <br/> [HHvm](https://dl.hhvm.com/ubuntu) <br/> [MongoDB](https://repo.mongodb.org/apt/ubuntu) <br/> [Mono](https://download.mono-project.com/repo/ubuntu) <br/> [MS Edge](https://packages.microsoft.com/repos/edge) <br/> [PostgreSQL](https://apt.postgresql.org/pub/repos/apt/) <br/> [R](https://cloud.r-project.org/bin/linux/ubuntu)                                      |
|                  | [pipx](https://pypa.github.io/pipx)   | ansible-core <br/>yamllint     |
| Windows          | [Chocolatey](https://chocolatey.org)  | No third-party repos installed |
| macOS            | [Homebrew](https://brew.sh)           | [aws-cli v2](https://github.com/aws/homebrew-tap) </br> [azure/bicep](https://github.com/Azure/homebrew-bicep) </br> [mongodb/brew](https://github.com/mongodb/homebrew-brew)                                                  |
|                  | [pipx](https://pypa.github.io/pipx/)  | yamllint                       |

### Image Deprecation Policy

- Images begin the deprecation process of the oldest image label once a new GA OS version has been released.
- Deprecation process begins with an announcement that sets a date for deprecation
- As it gets closer to the date, GitHub begins doing scheduled brownouts of the image
- During this time there will be an Announcement pinned in the repo to remind users of the deprecation.
- Finally GitHub will deprecate the image and it will no longer be available

### Preinstallation Policy

In general, these are the guidelines we follow when deciding what to pre-install on our images:

- Popularity: widely-used tools and ecosystems will be given priority.
- Latest Technology: recent versions of tools will be given priority.
- Deprecation: end-of-life tools and versions will not be added.
- Licensing: MIT, Apache, or GNU licenses are allowed.
- Time & Space on the Image: we will evaluate how much time is saved and how much space is used by having the tool pre-installed.
- Support: If a tool requires the support of more than one version, we will consider the cost of this maintenance.

### Default Version Update Policy

- In general, once a new version is installed on the image, we announce the default version update 2 weeks prior to deploying it.
- For potentially dangerous updates, we may extend the timeline up to 1 month between the announcement and deployment.

## How to Interact with the Repo

- **Issues**: To file a bug report, or request tools to be added/updated, please [open an issue using the appropriate template](https://github.com/actions/runner-images/issues/new/choose)
- **Discussions**: If you want to share your thoughts about image configuration, installed software, or bring a new idea, please create a new topic in a [discussion](https://github.com/actions/runner-images/discussions) for a corresponding category. Before making a new discussion please make sure no similar topics were created earlier.
- For general questions about using the runner images or writing your Actions workflow, please open requests in the [GitHub Actions Community Forum](https://github.community/c/github-actions/41).

## FAQs

<details>
   <summary><b><i>What images are available for GitHub Actions and Azure DevOps?</b></i></summary>

The availability of images for GitHub Actions and Azure DevOps is the same. However, deprecation policies may differ. See documentation for more details:

- [GitHub Actions](https://docs.github.com/en/free-pro-team@latest/actions/reference/specifications-for-github-hosted-runners#supported-runners-and-hardware-resources)
- [Azure DevOps](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/hosted?view=azure-devops&tabs=yaml#software)

</details>

<details>
   <summary><b><i>What image version is used in my build?</b></i></summary>

Usually, image deployment takes 2-3 days, and documentation in the `main` branch is only updated when deployment is finished. To find out which image version and what software versions are used in a specific build, see `Set up job` (GitHub Actions) or `Initialize job` (Azure DevOps) step log.
<img width="1440" alt="actions-runner-image" src="https://github.com/actions/runner-images/assets/88318005/922a8bf5-3e4d-4265-9527-b3b51e6bf9c8">
</details>

<details>
   <summary><b><i>Looking for other Linux distributions?</b></i></summary>

We do not plan to offer other Linux distributions. We recommend using Docker if you'd like to build using other distributions with the hosted runner images. Alternatively, you can leverage [self-hosted runners] and fully customize your VM image to your needs.
</details>

<details>
   <summary><b><i>How does GitHub determine what tools are installed on the images?</b></i></summary>

For some tools, we always install the latest at the time of the deployment; for others, we pin the tool to specific version(s). For more details please see the [Preinstallation Policy](#preinstallation-policy)
</details>

<details>
   <summary><b><i>How do I request that a new tool be pre-installed on the image?</b></i></summary>
Please create an issue and get an approval from us to add this tool to the image before creating the pull request.
</details>

<details>
   <summary><b><i>What branch should I use to build custom image?</b></i></summary>
We strongly encourage customers to build their own images using the main branch.
This repository contains multiple branches and releases that serve as document milestones to reflect what software is installed in the images at certain point of time. Current builds are not idempotent and if one tries to build a runner image using the specific tag it is not guaranteed that the build will succeed.
</details>
