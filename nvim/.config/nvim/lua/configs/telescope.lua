local options = {
  extensions = {
    fzf = {
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart case",
    },
    media = {
      backend = "ueberzug",
    },
  },
}

return options
