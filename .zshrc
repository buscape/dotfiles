export ZSH=~/.zsh

# Load all of the config files in ~/$ZSH/lib/ that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

# Load and run compinit
autoload -U compinit
compinit -i

# Set the global NPM-Package folder, so no root is required
# -> https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
NPM_PACKAGES="${HOME}/.npm-packages"

# Make node find "non-root" global packages
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

# Ensure binaries and man files are found
PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Load nvm
export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# set nvm version to stable
nvm use stable

# Load z
. ~/.zsh/lib/z.sh

# Simplest job-logger, usage: now Working on Feature X
now() {
    echo $(date "+%Y-%m-%d %H:%M:%S") - "$@" >> $HOME/Documents/job_log.txt
}
# Get computer boot time
boottime() {
  sysctl -a|grep kern.boottime
}
# Get display wake time from today
waketime() {
    syslog|grep DisplayDidWake| grep "$(date +"%b")\s$(date +"%e")" | head -n 1
}
# Get all display wake times
waketimes() {
    syslog|grep DisplayDidWake
}
