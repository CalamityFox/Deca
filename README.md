<div align="center">

### **WORK IN PROGRESS**

### **VERY UNSTABLE**
### **seriously do not use this**
</div>
<br>
<br>
<br>


<div align="center">
<img src="misc/media/deca-logo.svg" width="256"/>

<br>

<img src="misc/media/subtext.svg" width="400"/>
</div>

<br>

`deca` is an atomic/immutable Linux distro based on [Fedora](https://fedoraproject.org)'s [atomic desktops](https://docs.fedoraproject.org/en-US/atomic-desktops) using [rpm-ostree](https://coreos.github.io/rpm-ostree) and [bootc](https://bootc.dev). My main priorities are to make it as stable and reliable as possible, while having more private default settings than mainline Fedora and including the [Cinnamon](https://github.com/linuxmint/cinnamon) desktop.

All of `deca`'s code is kept in the [**run.yml**](.github/workflows/run.yml) workflow, including the faux-[containerfile](https://github.com/containers/common/blob/main/docs/Containerfile.5.md) **decaconf**. It pulls [fedora-bootc:latest](https://quay.io/fedora/fedora-bootc) and modifies it according to the **decaconf**, imports the files from [**/system**](system), rechunks the whole thing with [Chunkah](https://github.com/coreos/chunkah), and signs it with [Cosign](https://github.com/sigstore/cosign) before uploading it to GitHub's [Container Registry](https://github.blog/news-insights/product-news/introducing-github-container-registry).

You can rebase to it from any existing [rpm-ostree](https://coreos.github.io/rpm-ostree)/[bootc](https://bootc.dev) system:

```
# Pin current deployment
sudo ostree admin pin 0

# Rebase with rpm-ostree:
rpm-ostree rebase ostree-unverified-registry:ghcr.io/calamityfox/deca

# OR Rebase with bootc:
bootc switch --enforce-container-sigpolicy ghcr.io/calamityfox/deca
```
<br>

<div align="center">

[*calamityfox@purelymail.com*](mailto:calamityfox@purelymail.com) ([**age**](misc/keys/public-key.age), [**gpg**](misc/keys/public-key.gpg))

[<img src="misc/media/queer.svg" width="400"/>](https://www.media.mit.edu/publications/your-brain-on-chatgpt)

#

<img src="misc/media/terminallyonline.png" width="220"/>
<img src="misc/media/gendermalware.png" width="220"/>
<img src="misc/media/ancientinternetcreature.png" width="220"/>
<img src="misc/media/disabledpride.png" width="220"/>
<img src="misc/media/sourcecodeforlife.png" width="220"/> 
<img src="misc/media/dontrushme.png" width="220"/>
</div>
