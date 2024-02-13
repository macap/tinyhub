# tinyhub

Configurable home page for your server or homelab with minimal footprint.

## [> DEMO <](https://macap.github.io/tinyhub/)

![Tinyhub screenshot](/docs/bg2.jpg)

![Tinyhub dark mode screenshot](/docs/dark.jpg)

## Quickstart

### Installation and configuration

Prerequisites: netcat (nc) should be installed on your machine.

Everything you need is in `tinyhub` dir in this repo:

### `index.http` file

This contains list of your links and theme in json, basic html structure, css and some javascript to generate menu items from json.

For basic usage just edit json defined inside `<script type="application/json" id="config"> ... </script>`

#### json structure

| key      | values              | comment                                                |
| -------- | ------------------- | ------------------------------------------------------ |
| theme    | bg1,bg2,bg3,bg4,bg5 | sets gradient background                               |
| autoDark | true, false         | if true will enable dark mode based on system settings |
| menu     | array of menu items | see below for menu item fields                         |

#### menu items

| key      | values                  | comment                                                          |
| -------- | ----------------------- | ---------------------------------------------------------------- |
| name     | string                  | displayed under icon                                             |
| url      | url                     | your link (target after clicking the icon)                       |
| logo     | image url               | url to image to be used as icon                                  |
| logoBg   | css color (optional)    | icon background color                                            |
| logoText | <emoji sign> (optional) | will be used instead of logo image - see router in my screenshot |

### `server.sh` script

replace `/home/maciek/dashboard/index.http` with absolute path to your `index.http` file and `80` with a port you want to serve your dashboard at (80 is default).

### Using with systemd

You will probably want to run this in background and start with the system. I'm using ubuntu so this is how its done with `systemd`:

`sudo cp dashboard.service /etc/systemd/system/`
`sudo systemctl enable dashboard`

but update script path in dashboard.service first.

## Why?

I have a home server with various services (often exposed at weird port numbers i can't remember) so i wanted do have one place with links to everything.

There are many different homelab/self-hosting dashboard solutions, but most of them are complex. I didn't feel like using docker container with nginx, node, frontend framework, build process, database to serve a list of links just for me.

Context: my home server is wyse 3040 with 8GB disk and 2GB RAM so i save ram whenever i can! :D

So i wondered - what is the easiest way to handle http request? Netcat!
I used netcat, added some html, fancy css and it works perfectly fine.
