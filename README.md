# Welcome to My Dotfiles!

Hi friend! Welcome to V2 of my dotfiles, where this time
I'm using Nix Home Manager to do things a better way.
I'm running Pop!\_OS 22.04 LTS on all my machines, but I also tested
on Ubuntu 20.04.06 LTS. I should hope Nix would make it
such that the OS doesn't affect anything, but let me know
if you're on another OS and get any weirdness.

## Usage

You're gonna need to install [Nix](https://nixos.org/download/) and [Home Manager](https://nix-community.github.io/home-manager/index.xhtml#ch-installation). Since I'm using Home Manager on a non-NixOS distro,
I'm using the standalone install method. Then clone
this repo into your home directory. Then back up the
default Home Manager config file with  
`mv $HOME/.config/home-manager/home.nix $HOME/.config/home-manager/home.nix.bak`  
and symlink in this repo's home.nix with  
`ln -s $HOME/.dotfiles/home.nix $HOME/.config/home-manager/home.nix`  
Finally, run `home-manager switch` and you should be
good to go!

## Imperative Sadness

There are a couple of things that I did imperatively
(mostly for my sanity).

#### NixGL

I installed [nixGL](https://github.com/nix-community/nixGL)
imperatively using the nix-channel method. It's a
wrapper that allows OpenGL to work with HM-installed
packages. For example, Alacritty needs it (`nixGL alacritty`), and
AwesomeWM is launched with it (`nixGL awesome`).
Wezterm would also need it, but for some reason the `GPU`
front end doesn't render text correctly on the version
in the Nixpkgs repo, so I'm using `WebGpu` and it works
fine without the nixGL wrapper. Yes, I could have
used Flakes to install NixGL and that would be
better but I didn't.

#### Zsh as Default Shell

I don't know of a good way to set the default user shell using home
manager (which is probably a good thing from a security perspective),
so I do it imperatively. Add the line  
`$HOME/.nix-profile/bin/zsh`  
to `/etc/shells`, then run  
`chsh -s $HOME/.nix-profile/bin/zsh`  
and that should take care of it. Might need to input sudo password.

#### AwesomeWM Session Option

I had to create an `awesome.desktop` file and put it in  
`/usr/share/xsessions/`  
to get the option to show up in my display manager. I've included the file in the repo, but since the file isn't going under the home directory, you'll need to imperatively set the symlink with  
`sudo ln -s $HOME/.dotfiles/awesome.desktop /usr/share/xsessions/awesome.desktop`

## Other Notes

#### Rofi

The rofi theme repo I'm using has some custom patched fonts,
so you just have to have them installed. That is all taken
care of by HM, but just wanted to note it. I spent far too much
time trying to get the glyphs in my powermenu to show up,
only to realized that I have to use those _exact_ fonts.

#### Doom Emacs

I'm a Neovim person, but I've dabbled a bit in Emacs (Doom, of course).
I went through all of the trouble of previously compiling Emacs
from source with native compilation, but Doom Emacs is still too slow
for my preferences. All this to say, my Doom Emacs config files are there,
but HM doesn't currently do anything with them. If I decide I want to use
Doom again in the future, I'll figure out how to declaratively set it up
with those configs. For now, they're just there for safe keeping.

#### AwesomeWM Wallpaper

I realize that changing my wallpaper in Awesome will introduce
a conflict, but for right now, I don't really care. I'll just keep
the same image across all my machines until I think of a more modular
way to set the wallpaper (and actually care enough to implement it).

## Final Thoughts

I don't really anticipate anyone else trying to use this repo,
but if you do, let me know. I'd love to hear your thoughts on it.
It's certainly not perfect, but I hope you enjoy!
