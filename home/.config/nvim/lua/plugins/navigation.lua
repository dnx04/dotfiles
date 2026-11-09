-- Keep navigation identical on desktop and server.
local exclude = { ".git", ".venv", "venv", "node_modules", "__pycache__", ".cache", ".pytest_cache", ".ruff_cache", ".mypy_cache" }

return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = true },
      picker = {
        enabled = true,
        ui_select = true,
        layout = {
          preset = function()
            return vim.o.columns >= 120 and "default" or "vertical"
          end,
        },
        sources = {
          files = { hidden = true, ignored = false, exclude = exclude },
          grep = { hidden = true, ignored = false, exclude = exclude, live = true },
          explorer = {
            hidden = true,
            ignored = false,
            git_status = true,
            diagnostics = true,
            follow_file = true,
            layout = { preset = "sidebar", preview = false },
          },
        },
      },
    },
  },
}
