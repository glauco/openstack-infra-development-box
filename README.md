A Packer template based on Ubuntu 14.04-2, which pre-install the initial dependencies of [openstack-infra](https://git.openstack.org/openstack-infra/system-config) puppet modules.

## Bulding and testing locally

You will need to edit `openstack-infra-development.json` and romove the `atlas` post-process, as it is not possible to skip a certain preprocessor on packer build (yet).

```bash
packer build openstack-infra-development.json # go for a walk, it takes a while

vagrant box add test packer_virtualbox-iso_virtualbox.box
mkdir -p test
cd test
vagrant init test && vagrant up && vagrant ssh echo Success
```
