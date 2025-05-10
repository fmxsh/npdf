# NPDF - Neovim Plugin Development Framework

_NPDF_ is a modular Neovim configuration framework that uses the Lazy plugin manager. It is specifically built to support a plugin development environment.

All actively developed plugins are placed in a dedicated directory (local), while third-party plugins reside in a separate directory (remote).

A simple configuration flag allows the same setup to switch between development and production modes. In production mode, Neovim treats all plugins as remote — Lazy will fetch them from their repositories, ignoring local sources. This enables the exact same environment to be replicated on other machines without needing the development codebase.

## Intended use

You clone this repo, remove my components and replace with your own. Then upload your version of NPDF to your own repository. You can then use that as a base for your own Neovim configuration.

## Install

Neovim defaults to running `~/.config/nvim/init.lua` as the main configuration file. This is where you should set the path to your NPDF base directory.

The `~/.config/nvim/init.lua` should be as follows:

```lua

-- Path of the nvim config base dir
vim.opt.rtp:prepend(vim.fn.expand("~/dev/nvim"))

-- Start the base config
require("base-init")

```

In my case, the path is `~/dev/nvim`. Change it to whatever is the path of your NPDF root dir.

## Configuration

The file `./lua/user-config.lua` is the main configuration file. It is loaded by `base-init.lua` and contains all the settings for your Neovim instance.

### With regard to git

All plugin sources in `./plugins/sources/local` should be are git repositories.

The root of NPDF must be a git repository, and all repositories in `./plugins/sources/local` must be added as submodules to the NPDF repository.

### Options

**is_dev**: A boolean flag that indicates whether the configuration is in development mode. If set to `true`, the configuration will use local plugin sources. If set to `false`, it will treat all plugins as remote, meaning it will download them from their respective repositories. Use this option when you want to instantiate your configuration for usability on another machine... where you intend to use the configuration and not to develop it.

**plugin_sources_local**: defaults to `~/dev/nvim/plugins/sources/local`. Part of NPDF internal structure. You do not need to change this.

**plugin_specs**: defaults to `~/dev/nvim/plugins/specs`. Part of NPDF internal structure. You do not need to change this.

## Folder and file structure

The folder structure is designed to separate locally developed plugins from remote plugins by other developers or one's own finished plugins that are no longer relevant in a development context.

This folder structure is also designed to allow for seamless application of all specifications, both local and remote, as remote plugins. This means that if a non-development instance of the configuration is desired on another machine, the system treats all plugins as remote, meaning it downloads them all from GitHub by the default method of the _lazy_ plugin manager.

### `./lua/user-config.lua`

Some basic settings. See _Configuratoin_ section above.

### `./plugins/sources/local`

These are plugins being developed locally, meaning they aren't pulled from github by lazy.

Note: There is no `./plugins/sources/remote` folder, as all remote plugin sources are downloaded by lazy an put in the default location of lazy, which is `~/.local/share/nvim/lazy/`.

### `./plugins/specs`

A `lua/` folder exists to make each spec a lua module as is expected by `lazy`.

#### `./plugins/specs/lua/local`

The specifications of the plugins being developed locally are stored here. Even if the plugin is pushed to github and works as a remote plugin, the developer of the plugin still stores the specifications here.

#### `./plugins/specs/lua/remote`

The specifications of all plugins not being developed by the owner of this nvim-config-base are stored here.

Say, _Tree-sitter_ is a popular plugin and if used, its configuration specification is stored here.

### `./lua/`

System files of this base-config system.

## History

My config started with [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and I slowly but completely moved away from it making the config my own. There is almost nothing remaining of kickstart.nvim.

## My specific content in this repo

This is the primary configuration, meaning it holds my configuration in its completeness. Completeness entails it holds both the development structure for my personal plugins, as well as it is the functional configuration I use for my daily Neovim usage on my main machine.

Replications of this configuration can be made elsewhere by, but then the dedicated .

I use and develop my configuration under this directory alone.

This directory holds everything of my configuration that I both use and develop.

Instances of this configuration can be replicated elsewhere by

All my Neovim config exist in this directory
