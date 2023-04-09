function ColorMyPencils(color)
	--color = color or "kanagawa-wave"
    --color = color or "carbonfox"
    --color = color or "oxocarbon"
    --color = color or "kimbox"
    --require("kimbox").setup({ style="cool", transparent=true, ending_tildes=false })
    --color = color or "juliana"
    --color = color or "tokyodark"
    --vim.g.tokyodark_transparent_background = true
    --color = color or "vn-night"
    --color = color or "dracula"
    color = color or "calvera"

	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
