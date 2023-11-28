# TCC Permissions Demo

## Purpose

This Xcode demo project demonstrates the lack of inheritance of TCC permissions from a macOS app to its app extensions.

Ultimately, I'd like to know how my app extensions may inherit granted TCC permission from their parent app.


## Why

My current WIP app contains an `AppIntentsExtension` that sets up Shortcuts actions using the [App Intents framework](https://developer.apple.com/documentation/appintents). These actions require the `kTCCServiceAccessibility` permission to run certain AppleScripts.

Granting the Accessibility permission to the main application does not automatically grant it to the included extension — the user must explicitly grant it to the `.appex` file. However, while the permission can be granted to the `.appex` via *System Settings → Privacy & Security → Accessibility*, doing so will **not** show the `.appex` in this preference panel (it only shows `.app` files).

The onboarding in my WIP app guides the user through the permissions process for the `.appex`, but due to the behavior described above, it resulted in a rejection by the App Review team.


## What it does

The project sets up a macOS 13.3 SwiftUI app containing an `AppIntentsExtension`. The app will show the state of the `kTCCServiceAccessibility` permission in its main window, its extension will provide a Shortcuts action named "Permission Status", which also outputs the state of the `kTCCServiceAccessibility` permission.


## What I expect to happen

Once the *Accessibility* permission is granted to the main app via *System Settings → Privacy & Security → Accessibility*, I expect both the main app and the extension's Shortcuts action to report *"kTCCServiceAccessibility granted: yes"*.


## What's actually happening

Once the *Accessibility* permission is granted to the main app via *System Settings → Privacy & Security → Accessibility*, the main app reports *"kTCCServiceAccessibility granted: yes"*, the extension's Shortcuts action reports *"kTCCServiceAccessibility granted: no"*.


## How to run

1. Import into Xcode and compile on macOS 13.3+.
1. Start the app.
    - The window will read *"kTCCServiceAccessibility granted: no"*.
1. Quit the app.
1. Open the Shortcuts editor, create a new workflow, add the action *TCC Permissions Demo → Permission Status* to it.
1. Run the workflow.
    - The action will return the string *"kTCCServiceAccessibility granted: no"*.
1. Open *System Settings → Privacy & Security → Accessibility*, and grant the app the `kTCCServiceAccessibility` permission.
1. Restart the app.
    - The window will now read *"kTCCServiceAccessibility granted: yes"*.
1. Run the Shortcuts workflow.
    - The action will still return the string *"kTCCServiceAccessibility granted: no"*.


## What I'd like to know

How can my app extension inherit granted TCC permission from its parent app? If that isn't possible:

- Is that by design or is it a bug?
- Is it possible for an extension to gain TCC permissions in a "clean" way?
- How can the `.appex` be made visible in the Settings panel?


## Author

Carlo Zottmann, https://c.zottmann.org, carlo@zottmann.org
