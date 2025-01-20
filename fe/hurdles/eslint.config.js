import js from '@eslint/js'
import globals from 'globals'
import reactHooks from 'eslint-plugin-react-hooks'
import reactRefresh from 'eslint-plugin-react-refresh'
import simpleImportSort from 'eslint-plugin-simple-import-sort'
import unusedImport from 'eslint-plugin-unused-imports'
import imports from 'eslint-plugin-import'
// import from 'simpl'
import tseslint from 'typescript-eslint'

export default tseslint.config(
  { ignores: ['dist', '.yarn/*', '**/*.test.tsx'] },
  {
    extends: [js.configs.recommended, ...tseslint.configs.recommended],
    files: ['**/*.{ts,tsx}'],
    languageOptions: {
      ecmaVersion: 2020,
      globals: globals.browser,
    },
    plugins: {
      'import': imports,
      'react-hooks': reactHooks,
      'react-refresh': reactRefresh,
      "simple-import-sort": simpleImportSort,
      "unused-imports": unusedImport
    },
    rules: {
      ...reactHooks.configs.recommended.rules,
      'react-refresh/only-export-components': [
        'warn',
        { allowConstantExport: true },
      ],
      "import/order": [
        "error",
        {
          "groups": ["builtin", "external", "internal", ["parent", "type"], "sibling", "index", "object"],
          "alphabetize": {
            "order": "asc",
            "caseInsensitive": true
          }
        }
      ],
      "@typescript-eslint/no-unused-vars": "warn",
      "no-unused-vars": "warn",

      "unused-imports/no-unused-imports": "error",
      "unused-imports/no-unused-vars": [
        "warn",
        {
          "vars": "all",
          "args": "none"
        }
      ],
      // "eqeqeq": ["warn", "always"]
    },
  },
)
