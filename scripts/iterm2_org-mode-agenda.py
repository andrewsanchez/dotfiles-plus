#!/usr/bin/env python3

import iterm2
import AppKit

AppKit.NSWorkspace.sharedWorkspace().launchApplication_("iTerm2")


async def main(connection):
    app = await iterm2.async_get_app(connection)
    await app.async_activate()
    cmd = (
        "/usr/local/bin/emacsclient "
        "-t --eval "
        "'(org-agenda-list 1)' "
        "'(delete-other-windows)' "
        "'(if (boundp 'org-clocking-p) (org-clocking-p) (progn (org-agenda-clock-goto) (org-capture nil \"l\")))'"
    )
    await iterm2.Window.async_create(connection, command=cmd)


iterm2.run_until_complete(main, True)
