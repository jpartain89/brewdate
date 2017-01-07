#!/bin/bash

# Installer script for brewdate

if [[ "$(uname)" != "Darwin" ]]; then
    echo ""
    echo "Sorry, but this is only for macOS."
    echo "Exiting"
    exit 1
else
    USER_HOME="/Users/$(logname)"
fi

REPO_NAME="brewdate"
SCRIPT_NAME="install.sh"
REPO_OWNER="jpartain89"
REPO_GIT="$USER_HOME/git/$REPO_NAME"
USER_BIN="$USER_HOME/bin"
. "$USER_BIN/allunix"

echo "${CYAN}Running the $REPO_NAME $SCRIPT_NAME script.${NORMAL}"

if [[ $(which brewdate) != "$USER_BIN/$REPO_NAME" ]] && [[ $(which brewdate) != "" ]]; then
    echo "${NOTICE}Looks like $REPO_NAME is installed in the wrong spot ($(which brewdate))${NORMAL}"
    echo "${NOTICE}Fixing.${NORMAL}"
    rm "$(which brewdate)"
fi

if [[ ! -d "$REPO_GIT" ]]; then
    echo "${NOTICE}$REPO_GIT isn't downloaded. Fixing.${NORMAL}"
    git clone "https://$REPO_OWNER@github.com/$REPO_OWNER/$REPO_NAME.git" "$REPO_GIT"
fi

if [[ ! -h "$USER_BIN/$REPO_NAME" ]]; then
    echo "${NOTICE}Looks like the $REPO_NAME file is missing.${NORMAL}"
    echo "${NOTICE}Linking that to $USER_BIN.${NORMAL}"
    ln -s "$REPO_GIT/$REPO_NAME" "$USER_BIN/$REPO_NAME"
    sudo chmod +x "$USER_BIN/$REPO_NAME"
    sudo chown -R "$(logname):admin" "$USER_BIN/$REPO_NAME"
    echo ""
    RET=0
fi

if [[ $RET -eq 0 ]]; then
    echo "${OK}$REPO_NAME has been properly linked/installed.${NORMAL}"
    echo "${OK}Exiting 0.${NORMAL}"
    exit 0
else
    echo "${BAD}For some reason, it failed...???"
    echo "${BAD}Not currently setup for logging. Sorry..."
    exit 1
fi
