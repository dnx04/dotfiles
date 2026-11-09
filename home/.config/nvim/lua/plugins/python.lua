return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyrefly = {
          before_init = function(_, config)
            config.init_options = config.init_options or {}
            local prefix = vim.env.CONDA_PREFIX or vim.env.VIRTUAL_ENV
            if prefix and vim.fn.executable(prefix .. "/bin/python") == 1 then
              config.init_options.pythonPath = prefix .. "/bin/python"
            end
            if vim.env.PYTHONPATH and vim.env.PYTHONPATH ~= "" then
              config.init_options.pyrefly = config.init_options.pyrefly or {}
              config.init_options.pyrefly.extraSearchPaths = vim.split(vim.env.PYTHONPATH, ":", { trimempty = true })
            end
          end,
        },
      },
    },
  },
}
