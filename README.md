# NeoVim Build For Remote Machines
The purpose of this project is to create a portable tool to be used for coding
on remote machines. For best results, use it with the tmux config
provided.

This tool uses the combination of fuzzy finding with the plugin harpoon2,
among many other useful plugins that are compatible with most linux servers.
The complete list is below, along with terse descriptions of the important
aspects of the user interface. For more detailed descriptions see the github
of the plugin page.

**Important** This requires the installation of ripgrep! For most machines,
his must be built from scratch. See below for installation instructions before
proceeding.

# TL;DR
Type the following command `./setup.sh -t`

The `-t` will handle the tmux setup. If you like your existing tmux setup, leave
out the -t.

Add the following lines to the alias in your .zshrc or .bashrc (whichever
shell you prefer).
```
alias nv=~/nvim_remote/nvim.appimage
```

For compiling large projects, the compiler often likes a clean shell. GNU env
to the rescue. A minimal setup is included here. Add this to your rc file.
```
alias cleanshell='env -i bash --noprofile --rcfile ~/neovim_remote/.bashrc_simple'
```

Try splitting your tmux window with Ctrl-b | (if you are using this config) or
creating a new window with Ctrl-b c. With that new window, type cleanshell.

For the best user experience, install oh my zsh and use zsh. What else were
you even doing before?

Run `./clean_nvim.sh` to clear the setup from your machine.

If you are new to vim, learn one new trick per week.

## Walkthrough
Open tmux
```
tmux new-session -s my_session
```
**Notes**
Rename window and session (assuming the included tmux config)
```
:rew my_project_name
:res new_session_name
```
Navigate to your project folder and start using the file finder. Open neovim,
simply type `nv`. Hit `<Space>pf` and start typing the file name you are after.
Hit enter to open the file. Add this file to your harpoon buffer with
`<Space>add`. Search for a new file with the previous command. Add this new
file to your buffer. At this point you can cyle between your files with
`Ctrl-y/u/i/o`. Open the harpoon buffer to view the contents with `Ctrl-e`. You
can always reorder the content with regular vim commands -> `dd` to delete, `P` to
paste above, `p` to paste below, and `:wq` to save and quit.

Search for variable names using `<Space>ps`. If ripgrep is installed correctly,
it should open a grep prompt at the bottom of neovim. Search for a variable
name and the Telescope window should pop up, with a preview of the file. You
can also type in the prompt to further refine the search.

# Vim tips and tricks

## Motions
- ci<enclosing character> will delete what is inside the first match to the
closing pair. i.e. ci" will kill what is inside the brackets "" and place
the cursor in insert mode
- vi same as above but will highlight selection
- C-a will increment intelligently all at once
- g C-a will increment as a counter

Neovim Minimap can help navigate quickly through your file. Hit Ctrl-w
RightArrow to enter the Minimap window. Ctrl-w LeftArrow to come back to the
code window.

## Hotkey and Command Overview
### Remaps
leader = " "

Netrw: <leader>pv

## Tools
### Search - " ps"
 - Fast search using grep/ripgrep for string
 - - Hit space ps

### File explorerer
 - Fast file switching
   - Hit space pv
   - Hit space pf

## Plugin Telescope
Ripgrep Search: <leader>ps
Fuzzy finder: <leader>pf

### Harpoon2
- Add files: <leader>add
- Cycle left: Ctrl-t
- Cycle right: Ctrl-p
- Select files hotkeys: Ctrl-y/u/i/o (files 1-4)

### Treesitter
If there is an issue with tree-sitter try:

:TSUpdate or :TSUpdateSync

### Package Manager: Packer
:PackerSync updates all packages

### Surround
    Old text                    Command         New text
--------------------------------------------------------------------------------
    surr*ound_words             ysiw)           (surround_words)
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls

### Commentary
 - NORMAL mode
```
`gcc` - Toggles the current line using linewise comment
`gbc` - Toggles the current line using blockwise comment
`[count]gcc` - Toggles the number of line given as a prefix-count using linewise
`[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
`gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
`gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment
```
 - VISUAL mode
```
`gc` - Toggles the region using linewise comment
`gb` - Toggles the region using blockwise comment
```
**Extra Mappings**
To keep this README manageable, see nvim-commentary for extra mappings.

### Autoclose

### Minimap
:Minimap opens minimap
:MinimapClose closes minimap

**Note** There is a bug with the integration of Minimap and harpoon2. This is
currently being worked on. For best results, simply close minimap before using
features of harpoon and it works seamlessly.

### Transparent
:TransparentEnable

:TransparentDisable

:TransparentToggle

## Necessary Linux Packages
 - ripgrep
 - python3
   - can use python3-minimal apt-get package
   - python3 -m pip install --user --upgrade pynvim
 - code-minimap
   - can be installed with cargo install --locked code-minimap

## Extra Linux Packages
 - tree-sitter-cli

# Extra Instructions
## Installing ripgrep
On a machine with a rust compiler already installed, simply type
```
cargo install ripgrep
```

