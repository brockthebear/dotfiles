const path = require('path');

module.exports = {
	"root": true,
	"parser": "@babel/eslint-parser",
	"parserOptions": {
		"ecmaFeatures": {
			"jsx": true
		},
		"ecmaVersion": 6,
		"sourceType": "module"
	},

	"plugins": [
		"flowtype",
		"import",
		"jest",
		"jsx-a11y",
		"lodash",
		"prettier",
		"react",
		"react-hooks",
		"no-jquery",
		"formatjs",
	],

	// We intentionally try to avoid extending other eslint configs for the following reasons:
	// 1. Explicit list of rules
	// 2. No unexpected rule changes from a package being upgraded
	// 3. Ability to include a comment about what each rule does so we don't have to go digging around
	"extends": [],

	"env": {
		"browser": true, // override with `node` for Node linting
		"commonjs": true,
		"es6": true
	},

	"globals": {
		"DEVELOPMENT": false, // replaced by build scripts
		"TESTING": false, // replaced by build scripts
		"module": false, // For Hot Module Reloading (module.hot.accepts)
		"Text": "off" // Must be explicitly used (i.e. window.Text) otherwise it will be confused with <Text/> from Racine
	},

	"overrides": [
		{
			"files": ["tests/**/*.js", "**/__tests__/**/*.js", "racine/**/*.test.js", "**/__mocks__/**/*.js", "cy_tests/**/*.js"],
			"env": {
				"jest": true,
				"node": true
			},
			"rules": {
				"no-restricted-syntax": "off", // allow tests to use * imports
			}
		},
		{
			"files": ["gulp/**/*.js", "grunt/**/*.js", "shell/**/*.js", "webpack/**/*.js" ],
			"env": {
				"browser": false,
				"node": true
			},
			"rules": {
				"no-console": "off",
				"lodash/import-scope": "off",
			}
		},
		{
			"files": ["cy_tests/**/*.js"],
			"rules": {
				"no-jquery/no-find": "off",
				"no-jquery/no-attr": "off",
			}
		}
	],

	// plugin settings
	"settings": {
		"import/resolver": {
			"webpack": {
				"config": path.resolve(__dirname, "./webpack/webpack.dev.js")
			},
			[path.resolve(__dirname, "./gulp/util/eslint-plugin-import/racine-resolver.js")]: {}
		},

		"react": {
			"version": "detect",
			"flowVersion": "0.126.1"
		},

		"flowtype": {
			"onlyFilesWithFlowAnnotation": true
		}
	},

	"rules": {
		// Possible errors
		"no-cond-assign": ["error", "always"],            // disallow assignment in conditional expressions
		"no-console": "error",                            // disallow use of console
		"no-constant-condition": "error",                 // disallow use of constant expressions in conditions
		"no-control-regex": "error",                      // disallow control characters in regular expressions
		"no-debugger": "error",                           // disallow use of debugger
		"no-dupe-args": "error",                          // disallow duplicate arguments in functions
		"no-dupe-keys": "error",                          // disallow duplicate keys when creating object literals
		"no-duplicate-case": "error",                     // disallow a duplicate case label
		"no-empty": "error",                              // disallow empty statements
		"no-empty-character-class": "error",              // disallow the use of empty character classes in regular expressions,
		"no-ex-assign": "error",                          // disallow assigning to the exception in a catch block
		"no-extra-boolean-cast": "error",                 // disallow double-negation boolean casts in a boolean context
		"no-func-assign": "error",                        // disallow overwriting functions written as function declarations
		"no-inner-declarations": "error",                 // disallow function or variable declarations in nested blocks,
		"no-invalid-regexp": "error",                     // disallow invalid regular expression strings in the RegExp constructor,
		"no-irregular-whitespace": "error",               // disallow irregular whitespace outside of strings and comments
		"no-negated-in-lhs": "error",                     // disallow negation of the left operand of an in expression
		"no-obj-calls": "error",                          // disallow the use of object properties of the global object (Math and JSON) as functions,
		"no-regex-spaces": "error",                       // disallow multiple spaces in a regular expression literal
		"no-sparse-arrays": "error",                      // disallow sparse arrays
		"no-unreachable": "error",                        // disallow unreachable statements after a return, throw, continue, or break statement
		"use-isnan": "error",                             // disallow comparisons with the value NaN
		"valid-typeof": "error",                          // Ensure that the results of typeof are compared against a valid string,

		// Best practices
		"eqeqeq": "error",                                // require the use of === and !==
		"guard-for-in": "error",                          // make sure for-in loops have an if statement
		"no-alert": "error",                              // disallow the use of alert, confirm, and prompt
		"no-caller": "error",                             // disallow use of arguments.caller or arguments.callee
		"no-labels": ["error", {                          // disallow use of labels for anything other then loops and switches
			"allowLoop": true,
			"allowSwitch": true
		}],
		"no-eval": "error",                               // disallow use of eval()
		"no-extend-native": "error",                      // disallow adding to native types
		"no-extra-bind": "error",                         // disallow unnecessary function binding
		"no-implied-eval": "error",                       // disallow use of eval()-like methods
		"no-iterator": "error",                           // disallow usage of __iterator__ property
		"no-lone-blocks": "error",                        // disallow unnecessary nested blocks
		"no-loop-func": "error",                          // disallow creation of functions within loops
		"no-multi-str": "error",                          // disallow use of multiline strings
		"no-native-reassign": "error",                    // disallow reassignments of native objects
		"no-new": "error",                                // disallow use of new operator when not part of the assignment or comparison
		"no-new-func": "error",                           // disallow use of new operator for Function object
		"no-new-wrappers": "error",                       // disallows creating new instances of String,Number, and Boolean
		"no-octal": "error",                              // disallow use of octal literals
		"no-octal-escape": "error",                       // disallow use of octal escape sequences in string literals, such as var foo = "Copyright \251";
		"no-proto": "error",                              // disallow usage of __proto__ property
		"no-redeclare": "error",                          // disallow declaring the same variable more then once
		"no-return-assign": "error",                      // disallow use of assignment in return statement
		"no-void": "error",                               // disallow use of void operator
		"no-with": "error",                               // disallow use of the with statement
		"radix": "error",                                 // require use of the second argument for parseInt()
		"strict": ["error", "never"],                     // controls location of Use Strict Directives
		"no-delete-var": "error",                         // disallow deletion of variables
		"no-shadow-restricted-names": "error",            // disallow shadowing of names such as arguments
		"no-undef": "error",                              // disallow use of undeclared variables unless mentioned in a /*global */ block
		"no-undef-init": "error",                         // disallow use of undefined when initializing variables
		"no-unused-vars": ["error", {                     // disallow declaration of variables that are not used in the code
			"vars": "all",
			"args": "none",
			"ignoreRestSiblings": true,
		}],

		// Style Enforcement
		"new-cap": ["error", { "newIsCap": true, "capIsNew": false }],
		"no-array-constructor": "error",
		"no-new-object": "error",
		"one-var": ["error", "never"],

		// ES6 rules
		"constructor-super": "error",                     // ensure calling of super() in constructors
		"no-class-assign": "error",                       // disallow modifying variables of class declarations
		"no-const-assign": "error",                       // disallow modifying variables that are declared using const
		"no-dupe-class-members": "error",                 // disallow duplicate name in class members
		"no-new-symbol": "error",                         // disallow use of the new operator with the Symbol object
		"no-this-before-super": "error",                  // disallow use of this/super before calling super() in constructors
		"no-var": "error",                                // require let or const instead of var
		// I would like to enable this ASAP
		// "object-shorthand": "error",

		// Import Rules
		"no-restricted-syntax": [                         // disallow "import *" (except for React)
			"error",
			{
				"selector": ":matches(ImportNamespaceSpecifier[local.name!='React'])", // for details, see https://github.com/eslint/eslint/issues/4865#issuecomment-392564091
				"message": "Import/export only modules you need"
			}
		],
		"import/dynamic-import-chunkname": "error",       // require webpackChunkName for dynamic imports
		"import/no-unresolved": "error",                  // disallow unresolved imports
		"import/no-deprecated": "warn",

		// React rules
		"react/jsx-curly-brace-presence": ["error", "never"], // eliminate redundant braces around JSX string literals
		"react/jsx-no-comment-textnodes": "error",        // prevent comment strings being accidentally injected into JSX
		"react/jsx-no-duplicate-props": "error",          // disallow duplicate properties in JSX
		"react/jsx-no-target-blank": "error",             // disallow <a> tags with target='_blank' that omit rel='noreferrer noopener'
		"react/jsx-no-undef": "error",                    // disallow undeclared variables in JSX
		"react/jsx-uses-vars": "error",                   // prevent variables used in JSX from being incorrectly marked as unused
		"react/no-access-state-in-setstate": "warn",      // disallow accessing this.state in setState()
		"react/no-deprecated": "error",                   // disallow usage of deprecated methods
		"react/no-did-mount-set-state": "error",          // disallow usage of setState in componentDidMount
		"react/no-did-update-set-state": "error",         // disallow usage of setState in componentDidUpdate
		"react/no-direct-mutation-state": "error",        // disallow direct mutation of this.state
		"react/no-find-dom-node": "warn",                 // disallow ReactDOM.findDOMNode (use refs instead, see https://github.com/yannickcr/eslint-plugin-react/issues/678#issue-165177220)
		"react/no-is-mounted": "error",                   // disallow usage of isMounted
		"react/no-render-return-value": "error",          // disallow usage of the return value of React.render
		"react/no-this-in-sfc": "error",                  // disallow accessing `this` in functional component
		"react/no-unescaped-entities": "error",           // disallow invalid characters from appearing in markup
		"react/no-unknown-property": "error",             // disallow usage of unknown DOM properties
		"react/no-unsafe": [                              // disallow usage of unsafe lifecycle methods
			"warn",
			{"checkAliases": true}
		],
		"react/no-will-update-set-state": "error",        // disallow calling setState() in componentWillUpdate()
		"react/prefer-es6-class": "error",                // enforce es6 classes for React Components
		"react/prop-types": ["error", { "ignore": ["children", "qa", "theme"] }], // require props validation in a React component definition
		"react/require-render-return": "error",           // enforce returning a value in render methods
		"react/self-closing-comp": ["error", { "html": false }], // disallow extra closing tags for components without children

		// Lodash rules
		"lodash/callback-binding": "error",
		"lodash/collection-method-value": "error",
		"lodash/collection-return": "error",
		"lodash/import-scope": ["error", "full"],
		"lodash/no-double-unwrap": "error",
		"lodash/no-extra-args": "error",
		"lodash/unwrap": "error",

		// Flowtype Rules
		"flowtype/define-flow-type": "error",
		"flowtype/delimiter-dangle": "off",
		"flowtype/no-weak-types": "off",
		"flowtype/require-parameter-type": "off",
		"flowtype/require-return-type": "off",
		"flowtype/require-valid-file-annotation": "off",
		"flowtype/type-id-match": ["error", "^((Type|Enum)[A-Z])"],
		"flowtype/use-flow-type": "error",
		"flowtype/valid-syntax": "error",
		"flowtype/no-types-missing-file-annotation": "error",

		// Jest Rules
		"jest/no-disabled-tests": "off",
		"jest/no-focused-tests": "error",
		"jest/no-identical-title": "error",

		// Accessibility
		"jsx-a11y/anchor-is-valid": "error",
		"jsx-a11y/alt-text": "error",
		"jsx-a11y/click-events-have-key-events": "warn",

		// React Hooks
		"react-hooks/rules-of-hooks": "error",
		"react-hooks/exhaustive-deps": "warn",

		// Prettier
		"prettier/prettier": "error",

		// jQuery
		// "no-jquery/no-ajax": "warn", Disabling for now, because the $.ajax API has functionality that is unsupported by our fetch helper
		"no-jquery/no-ajax-events": "warn",
		"no-jquery/no-animate": "warn",
		"no-jquery/no-attr": "warn",
		"no-jquery/no-bind": "warn",
		"no-jquery/no-class": "warn",
		"no-jquery/no-clone": "warn",
		"no-jquery/no-closest": "warn",
		"no-jquery/no-css": "warn",
		"no-jquery/no-data": "warn",
		"no-jquery/no-deferred": "warn",
		"no-jquery/no-delegate": "warn",
		"no-jquery/no-each": "warn",
		"no-jquery/no-extend": "warn",
		"no-jquery/no-fade": "warn",
		"no-jquery/no-filter": "warn",
		"no-jquery/no-find": "warn",
		"no-jquery/no-global-eval": "error",
		"no-jquery/no-grep": "warn",
		"no-jquery/no-has": "error",
		"no-jquery/no-html": "warn",
		"no-jquery/no-in-array": "warn",
		"no-jquery/no-is-array": "warn",
		"no-jquery/no-is-function": "warn",
		"no-jquery/no-is": "warn",
		"no-jquery/no-load": "warn",
		"no-jquery/no-map": "warn",
		"no-jquery/no-merge": "warn",
		"no-jquery/no-param": "warn",
		"no-jquery/no-parent": "warn",
		"no-jquery/no-parents": "warn",
		"no-jquery/no-parse-html": "warn",
		"no-jquery/no-prop": "warn",
		"no-jquery/no-proxy": "error",
		"no-jquery/no-ready": "warn",
		"no-jquery/no-serialize": "warn",
		"no-jquery/no-size": "warn",
		"no-jquery/no-sizzle": "warn",
		"no-jquery/no-slide": "warn",
		"no-jquery/no-submit": "warn",
		"no-jquery/no-text": "warn",
		"no-jquery/no-trigger": "warn",
		"no-jquery/no-trim": "warn",
		"no-jquery/no-val": "warn",
		"no-jquery/no-visibility": "warn",
		"no-jquery/no-when": "warn",
		"no-jquery/no-wrap": "error",

		// react-intl
		// To enforce best practices/prevent probable errors
		"formatjs/enforce-default-message": ["error", "literal"],
		"formatjs/enforce-placeholders": "error",
		"formatjs/no-id": "error",
		// To prevent using syntax not supported by Smartling
		// https://help.smartling.com/hc/en-us/articles/360008030994-ICU-MessageFormat
		"formatjs/no-multiple-plurals": "error",
		"formatjs/no-offset": "error",
		"formatjs/blacklist-elements": ["error", ["selectordinal"]]
	}
};
