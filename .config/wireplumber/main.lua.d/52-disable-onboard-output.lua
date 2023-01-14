rule = {
  matches = {
    {
      { "device.name", "equals", "alsa_card.pci-0000_0a_00.3" },
    },
  },
  apply_properties = {
    ["device.profile"] = "Analog stereo-input",
  },
}

table.insert(alsa_monitor.rules, rule)
