This is http://cmd.io hipchat command. You can pipe any text/command output into a hipchat room.

## Install

```
make deploy
```

## Configuration

Make sure you give your ssh key to ssh-agent: `ssh-add <path-to-github-ssh-key>`

Save your `GITHUB_USER` in the `.profile`
```
echo export GITHUB_USER=$(ssh -T git@github.com 2>&1 | sed 's/Hi \([^ ]*\)!.*/\1/') >> .profile
```

set your hipchat token, and room id/name in `.profile`
```
export HIPCHAT_TOKEN=<my40charlongtoken>
export HIPCHAT_ROOM=<myroomname>
```

Load your configuration
```
source .profile
```

## Moar configs

- HIPCHAT_MSG_COLOR: yellow, green, red, purple, gray
- HIPCHAT_MSG_FORMAT: text/html
## Usage

```
any command | ssh $GITHUB_USER@alpha.cmd.io hipchat
```
