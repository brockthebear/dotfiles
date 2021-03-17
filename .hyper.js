// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

/* cSpell:disable */

module.exports = {
	config: {
		// Choose either "stable" for receiving highly polished,
		// or "canary" for less polished but more frequent updates
		updateChannel: 'canary',

		windowSize: [960, 640],

		// default font size in pixels for all tabs
		fontSize: 14,

		// font family with optional fallbacks
		fontFamily:
			'"OperatorMono Nerd Font", "Operator Mono", Hack, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

		// terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
		cursorColor: 'rgba(248,28,229,0.8)',

		// `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
		cursorShape: 'BEAM',

		// set to true for blinking cursor
		cursorBlink: true,

		// color of the text
		foregroundColor: '#fff',

		// terminal background color
		backgroundColor: '#000',

		// border color (window, tabs)
		borderColor: '#333',

		// custom css to embed in the main window
		css: 'margin: "-8px 0px 0px 4px", font-smoothing: "antialiased"',

		// set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
		// default: `false` on Linux, `true` on Windows (ignored on macOS)
		showHamburgerMenu: '',

		// set to `false` if you want to hide the minimize, maximize and close buttons
		// additionally, set to `'left'` if you want them on the left, like in Ubuntu
		// default: `true` on windows and Linux (ignored on macOS)
		showWindowControls: '',

		// custom padding (css format, i.e.: `top right bottom left`)
		padding: '8px',

		// the full list. if you're going to provide the full color palette,
		// including the 6 x 6 color cubes and the grayscale map, just provide
		// an array here instead of a color map object
		colors: {
			black: '#000000',
			red: '#ff0000',
			green: '#33ff00',
			yellow: '#ffff00',
			blue: '#0066ff',
			magenta: '#cc00ff',
			cyan: '#00ffff',
			white: '#d0d0d0',
			lightBlack: '#808080',
			lightRed: '#ff0000',
			lightGreen: '#33ff00',
			lightYellow: '#ffff00',
			lightBlue: '#0066ff',
			lightMagenta: '#cc00ff',
			lightCyan: '#00ffff',
			lightWhite: '#ffffff',
		},

		verminal: {
			fontFamily:
				'"OperatorMono Nerd Font", "Operator Mono", Hack, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
			fontSize: 14,
			minimal: true,
			cursorColor: 'cyan',
		},

		wickedBorder: true,

		// the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
		// if left empty, your system's login shell will be used by default
		//
		// Windows
		// - Make sure to use a full path if the binary name doesn't work
		// - Remove `--login` in shellArgs
		//
		// Bash on Windows
		// - Example: `C:\\Windows\\System32\\bash.exe`
		//
		// Powershell on Windows
		// - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
		shell: '/bin/zsh',

		// for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
		// by default ['--login'] will be used
		shellArgs: ['--login'],

		// for environment variables
		env: {},

		// set to false for no bell
		bell: 'SOUND',

		// if true, selected text will automatically be copied to the clipboard
		copyOnSelect: false,

		// if true, on right click selected text will be copied or pasted if no
		// selection is present (true by default on Windows)
		// quickEdit: true

		// URL to custom bell
		// bellSoundURL: 'http://example.com/bell.mp3',

		// for advanced config flags please refer to https://hyper.is/#cfg

		hyperStatusLine: {
			dirtyColor: 'salmon',
			aheadColor: 'mediumaquamarine',
			footerTransparent: true,
		},

		hyperTabs: {
			tabIconsColored: true,
			trafficButtons: true,
			border: true,
			tabIcon: true,
			activityPulse: true,
			activityColor: 'salmon',
			// closeAlign: 'right',
		},

		syncSettings: {
			quiet: false,
			accelerators: {
				checkForUpdates: 'CmdOrCtrl+S',
				backupSettings: 'CmdOrCtrl+Shift+S',
			},
		},

		hypercwd: {
			initialWorkingDirectory: '~//projects',
		},

		hyperSearchUI: {
			inputBorderRadius: 8,
			buttonBorderRadius: 8,
			buttonMargin: 8,
			prevButton: '◀',
			nextButton: '▶',
		},

		hyperBorder: {
			borderColors: ['#fc1da7', '#fba506'],
			borderWidth: '6px',
		},

		// hyper-init config
		// https://github.com/daltonmenezes/hyper-init#readme
		init: [
			{
				rule: 'windows',
				commands: ['ls'],
				allowedShells: ['zsh'],
			},
		],
	},

	// a list of plugins to fetch and install from npm
	// format: [@org/]project[#version]
	// examples:
	//   `hyperpower`
	//   `@company/project`
	//   `project#1.0.1`
	plugins: [
		'gitrocket',
		'hyper-alt-click',
		'hyper-blink',
		'hyper-dnd-tabs',
		'hyper-drop-file',
		'hyper-hide-title',
		'hyper-search',
		'hyper-statusline',
		'hyper-sync-settings',
		'hyper-tabs-enhanced',
		'hyperalfred',
		'hypercwd',
		'hyperlinks',
		'hyperterm-close-on-left',
		'verminal',
		// 'hyper-snazzy',
		// 'hyper-sweet',
		// 'hyper-tab-icons',
		// 'hyperborder',
		// 'hyperterm-horizon',
	],

	// in development, you can create a directory under
	// `~/.hyper_plugins/local/` and include it here
	// to load it and avoid it being `npm install`ed
	localPlugins: [],

	keymaps: {
		// Example
		// 'window:devtools': 'cmd+alt+o',
	},
};
