# UNO Synth Pro

https://www.ikmultimedia.com/products/unosynthpro/

## Presets

So many files. But the official Editor takes multiple clicks to switch them without overwriting hardware memory.

Luckily, it's easy to switch them via SysEx. That's what `load_unosyp.rb` script does. Especially if invoked in one click via https://github.com/ranger/ranger files preview while binded via `~/.config/ranger/scope.sh` (if empty, init via `ranger --copy-config=scope`)

```
handle_extension() {
  ...
        unosyp)
            ~/load_unosyp.rb "${FILE_PATH}" 2>&1
            exit 0 # https://github.com/ranger/ranger/issues/2719
            ;;
```

`load_unosyp.rb` requires `brew install gbevin/tools/sendmidi ruby` and contains hardcoded `/opt/homebrew` paths

SEQ & ARP settings do not get loaded yet.

## Controls

- https://patchstorage.com/uno-synth-pro-envelopes-control-length-scaling/

