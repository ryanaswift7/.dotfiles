# Welcome to My Dotfiles!

Hi friend! Welcome to v2.5 of my dotfiles, where this time
I'm using Nix Home Manager to do things a better way.
I'm running Pop!\_OS 22.04 LTS on all my machines, but I also tested
on Ubuntu 20.04.06 LTS. I should hope Nix would make it
such that the OS doesn't affect anything, but let me know
if you're on another OS and get any weirdness.

## Step-by-step

#### 1. Install [Nix](https://github.com/nix-community/nixGL)

- Multi-user install recommended

#### 2. Install [Home Manager](https://nix-community.github.io/home-manager/index.xhtml#ch-installation)

- Standalone option, unless you're on NixOS
- Follow the `master` channel
- Only need to do steps 1 - 3

#### 3. Clone this repo

- `git clone https://github.com/ryanaswift7/.dotfiles.git`

#### 4. Backup default home.nix

- `mv $HOME/.config/home-manager/home.nix $HOME/.config/home-manager/home.nix.bak`

#### 5. Symlink in this repo's home.nix

- `ln -s $HOME/.dotfiles/home.nix $HOME/.config/home-manager/home.nix`

#### 6. Run first HM generation with new config

- `home-manager switch -b preHM` to backup conflicting/existing files with a `*.preHM` extension (recommended)
- Use `home-manager switch` if you know no conflicts are present

#### 7. Install [NixGL](https://github.com/nix-community/nixGL)

- nix-channel method

#### 8. Set Zsh as default shell

- Add the line `/home/{your username}/.nix-profile/bin/zsh` to `/etc/shells`
  - Note: you'll have to use the absolute path to your home folder in `/etc/shells`
- Then run `chsh -s $HOME/.nix-profile/bin/zsh`

#### 9. Symlink in desktop file

- `sudo ln -s $HOME/.dotfiles/awesome.desktop /usr/share/xsessions/awesome.desktop`

#### 10. (Optional) Install OpenConnect-SSO in the default Python environment

- `pip install openconnect-sso`

- Only necessary for using the VPN aliases

- (ISSUE) Running into glibc version issue when executing. No fix yet.

#### 11. Done!

- Logout then log back in under the AwesomeWM session
- May need to reboot

## Usage

This section contains a somewhat more detailed version of the above steps.

You're gonna need to install [Nix](https://nixos.org/download/) and [Home Manager](https://nix-community.github.io/home-manager/index.xhtml#ch-installation). Since I'm using Home Manager on a non-NixOS distro,
I'm using the standalone install method. Then clone
this repo into your home directory. Then back up the
default Home Manager config file with  
`mv $HOME/.config/home-manager/home.nix $HOME/.config/home-manager/home.nix.bak`  
and symlink in this repo's home.nix with  
`ln -s $HOME/.dotfiles/home.nix $HOME/.config/home-manager/home.nix`  
Finally, run `home-manager switch -b preHM` to backup any conflicting file paths with a `*.preHM` extension and you should be
good to go!

## Imperative Sadness

There are a couple of things that I did imperatively
(mostly for my sanity).

#### OpenConnect-SSO

I have not been able to find a way to install `openconnecct-sso` into the default user python environment, so this will have to be done imperatively with `pip install openconnect-sso`. This is only necessary for using the VPN aliases.

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
