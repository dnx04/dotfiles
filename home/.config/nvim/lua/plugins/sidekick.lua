return {
  "folke/sidekick.nvim",
  cmd = "Sidekick",
  opts = {
    nes = { enabled = false },
    cli = {
      mux = { backend = "tmux", enabled = true },
    },
  },
  keys = {
    { "<leader>aa", function() require("sidekick.cli").toggle() end, desc = "Toggle AI CLI" },
    { "<leader>as", function() require("sidekick.cli").select({ filter = { installed = true } }) end, desc = "Select AI CLI" },
    { "<leader>ac", function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end, desc = "Toggle Claude" },
    { "<leader>ax", function() require("sidekick.cli").toggle({ name = "codex", focus = true }) end, desc = "Toggle Codex" },
    { "<leader>af", function() require("sidekick.cli").send({ msg = "{file}" }) end, desc = "Send File to AI" },
    { "<leader>av", function() require("sidekick.cli").send({ msg = "{selection}" }) end, mode = "x", desc = "Send Selection to AI" },
    { "<leader>ap", function() require("sidekick.cli").prompt() end, mode = { "n", "x" }, desc = "AI Prompts" },
    { "<leader>ad", function() require("sidekick.cli").close() end, desc = "Hide AI CLI" },
    { "<c-.>", function() require("sidekick.cli").focus() end, mode = { "n", "t", "i", "x" }, desc = "Focus AI CLI" },
  },
}
