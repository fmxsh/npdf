return {
	-- TODO: Put the actual config here and remove it from the plugin itself. Let it just be a theme selector and applier.
	"fmxsh/color-theme.nvim",
	config = function()
		require("color-theme").setup()
	end,
}
