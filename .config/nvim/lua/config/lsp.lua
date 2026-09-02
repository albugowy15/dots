vim.lsp.config("vtsls", {
  single_file_support = false,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  settings = {
    complete_function_calls = false,
    typescript = {
      tsserver = {
        maxTsServerMemory = 2048,
        useSeparateSyntaxServer = false,
        useSyntaxServer = "never",
      },
      preferences = {
        includePackageJsonAutoImports = "off",
        includeCompletionsForModuleExports = false,
        updateImportsOnPaste = "off",
      },
    },
    vtsls = {
      enableMoveToFileCodeAction = false,
      autoUseWorkspaceTsdk = true,
      experimental = {
        completion = {
          entriesLimit = 10,
          enableServerSideFuzzyMatch = false,
        },
      },
      typescript = {
        updateImportsOnFileMove = { enabled = "always" },
        preferences = {
          includePackageJsonAutoImports = "off",
          includeCompletionsForModuleExports = false,
          updateImportsOnPaste = "off",
        },
        format = {
          enable = false,
        },
      },
    },
  },
})

vim.lsp.config("eslint", {
  settings = {
    format = false,
    run = "onSave",

    codeAction = {
      disableRuleComment = { enable = false },
      showDocumentation = { enable = false }
    },
  },
})

vim.lsp.config("biome", {
  single_file_support = false,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
    },
  },
})

vim.lsp.config("yamlls", {
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
    },
  },
  settings = {
    redhat = { telemetry = { enabled = false } },
    yaml = {
      keyOrdering = false,
      format = {
        enable = true,
      },
      validate = true,
      schemaStore = {
        enable = false,
        url = "",
      },
    },
  },
})

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      gofumpt = true,
      codelenses = {
        gc_details = false,
        generate = false,
        regenerate_cgo = false,
        run_govulncheck = false,
        test = false,
        tidy = false,
        upgrade_dependency = false,
        vendor = false,
      },
      analyses = {
        nilness = false,
        unusedparams = false,
        unusedwrite = false,
        useany = false,
      },
      usePlaceholders = false,
      completeUnimported = false,
      staticcheck = false,
      directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
      semanticTokens = false,
    },
  },
})

vim.lsp.config("denols", {
  filetypes = {
    "typescript",
  },
  workspace_required = true,
  root_markers = { "deno.json", "deno.jsonc" },
  settings = {
    suggest = {
      imports = {
        hosts = {
          ["https://deno.land"] = true,
        },
      },
    },
  },
})

vim.lsp.config("jsonls", {
  settings = {
    json = {
      format = {
        enable = false,
      },
      validate = { enable = true },
    },
  },
})

vim.lsp.config("rust_analyzer", {
  settings = {
    imports = {
      granularity = {
        group = "module",
      },
      prefix = "self",
    },
    cargo = {
      buildScripts = {
        enable = false,
      },
    },
    procMacro = {
      enable = false,
    },
  },
})

vim.lsp.config("clangd", {
  keys = {
    { "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
  },
  root_markers = {
    "compile_commands.json",
    "compile_flags.txt",
    "configure.ac", -- AutoTools
    "Makefile",
    "configure.ac",
    "configure.in",
    "config.h.in",
    "meson.build",
    "meson_options.txt",
    "build.ninja",
    ".git",
  },
  capabilities = {
    offsetEncoding = { "utf-16" },
  },
  cmd = {
    "clangd",
    "--header-insertion=never",
    "--completion-style=bundled",
    "--fallback-style=llvm",
  },
  init_options = {
    usePlaceholders = false,
    completeUnimported = false,
    clangdFileStatus = true,
  },
})

vim.lsp.config("tailwindcss", {
  filetypes = {
    "astro", "html", "css", "postcss", "sass", "scss",
    "javascript", "javascriptreact", "typescript", "typescriptreact",
    "svelte",
  },
  settings = {
    tailwindCSS = {
      validate = false,
      classAttributes = { "class", "className", "rootClassName", "class:list" },
      classFunctions = { "clsx", "cn" },
      completion = false,
      colorDecorators = false,
      codeActions = false,
      hovers = true,
    },
  },
})

vim.lsp.config("jdtls", {
  settings = {
    java = {
      format = {
        enabled = true,
        settings = {
          url = vim.fn.stdpath("config") .. "/eclipse-java-style.xml",
          profile = "GoogleStyle",
        },
      },
      saveActions = {
        organizeImports = true,
      },
    },
  },
})

-- vim.lsp.config("tsc", {
--   settings = {
--     typescript = {
--       inlayHints = {
--         parameterNames = { enabled = false },
--         parameterTypes = { enabled = false },
--         variableTypes = { enabled = false },
--         propertyDeclarationTypes = { enabled = false },
--         functionLikeReturnTypes = { enabled = false },
--         enumMemberValues = { enabled = false },
--       },
--       format = { enable = false },
--       tsserver = {
--         maxTsServerMemory = 6144,
--         useSeparateSyntaxServer = false,
--         useSyntaxServer = "never",
--       },
--       preferences = {
--         includePackageJsonAutoImports = "off",
--       },
--     },
--   },
-- })

vim.lsp.config("tsc", {
  -- tsc is the native Go-based TypeScript 7 server. This is a soft runtime
  -- limit that makes its GC reclaim memory more aggressively, not a hard cap.
  cmd_env = {
    GOMEMLIMIT = "2048MiB",
  },
  -- Do not let Neovim request the high-volume features below. Their server
  -- settings are also disabled, but removing the capabilities blocks requests
  -- from Neovim and other plugins after the client attaches.
  on_attach = function(client)
    client.server_capabilities.codeLensProvider = nil
    client.server_capabilities.inlayHintProvider = nil
    client.server_capabilities.semanticTokensProvider = nil
  end,
  settings = {
    ["js/ts"] = {
      -- Avoid downloading and indexing inferred @types packages.
      disableAutomaticTypeAcquisition = true,
      implementationsCodeLens = {
        enabled = false,
      },
      format = { enable = false },
      preferences = {
        -- Needed to complete imports from workspace packages in a monorepo.
        includePackageJsonAutoImports = "auto",
        includeCompletionsForModuleExports = false,
        updateImportsOnPaste = "off",
      },
      suggest = {
        -- Keep import completions, but omit the more expensive variants.
        autoImports = true,
        completeFunctionCalls = false,
        completeJSDocs = false,
        includeAutomaticOptionalChainCompletions = false,
        classMemberSnippets = { enabled = false },
        objectLiteralMethodSnippets = { enabled = false },
      },
      inlayHints = {
        enumMemberValues = {
          enabled = false
        },
        functionLikeReturnTypes = {
          enabled = false
        },
        parameterNames = {
          enabled = false,
        },
        parameterTypes = {
          enabled = false
        },
        propertyDeclarationTypes = {
          enabled = false
        },
        variableTypes = {
          enabled = false
        }
      },
      referencesCodeLens = {
        enabled = false,
      },
    }
  }
})

vim.lsp.enable({
  "astro",
  "bashls",
  -- "docker_language_server",
  -- "docker_compose_language_service",
  "gopls",
  "lua_ls",
  "rust_analyzer",
  "tailwindcss",
  "taplo",
  "tsc",
  -- "vtsls",
  "eslint",
  "lemminx",
  "yamlls",
})
