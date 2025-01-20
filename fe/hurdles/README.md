# sns-fe
 project

# 기술 스택
코어: React, TypeScript,
상태 관리: React-Query, Recoil
스타일링: emotion
패키지 매니저: Yarn Berry (with. pnp)

# Yarn Berry (with. pnp) 선택 이유
- 무거운 node_modules
- 비효울적인 의존성 검색
- 비효율적인 설치 (다른 버전의 패키지 중복 설치)
- 유령의존성

장점
- 효율적인 의존성 검색
- 엄격한 의존성 관리
- CI 시간 단축

# yarn berry 세팅
  npm create vite@latest .
  node_modules 삭제

  ❯ yarn set version stable
    - yarn berry 세팅
    - .yarnrc.yml 파일로 이동
    - nodeLinker: pnp > 작성
      - node_modules를 사용 하지않는다고 선언
  - yarn install
  - yarn dlx @yarnpkg/sdks vscode
  - .gitignore
  ```
  .pnp.*
  .yarn/*
  !.yarn/patches
  !.yarn/plugins
  !.yarn/releases
  !.yarn/sdks
  !.yarn/versions
  ```

# 세팅 순서
1. vite
- npm create vite@latest .

# ESLint 세팅
  - yarn add -D 
  eslint prettier 
  eslint-plugin-prettier 
  eslint-config-prettier 
  eslint-plugin-import 
  eslint-plugin-simple-import-sort 
  eslint-plugin-unused-imports 

  - Config 설정 분리
  <!-- - yarn add @yarnpkg/sdks vscode -->

  - eslint.config.js 세팅
    - "package.json 에서 eslintConfig 내부에 내용을 지우고" 중요
    - .eslintrc 파일을 추가하고
    - 하단의 내용을 추가해준다.

    ``` js
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
        { ignores: ['dist'] },
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
            "unused-imports/no-unused-imports": "error",
            "unused-imports/no-unused-vars": [
              "warn",
              {
                "vars": "all",
                "args": "none"
              }
            ],
            "eqeqeq": ["warn", "always"]
          },
        },
      )
    ```

# Prettier 세팅
  - .prettierrc

  ``` json
  {
    "useTabs": false,
    "printWidth": 80,
    "tabWidth": 2,
    "singleQuote": false,
    "trailingComma": "all",
    "endOfLine": "lf",
    "semi": true,
    "arrowParens": "always"
  }
  ```

  - yarn dlx @yarnpkg/sdks vscode



# emotion 세팅
- yarn add @emotion/react @emotion/styled
- yarn add -D @emotion/babel-plugin @babel/preset-react

- tsconfig.app.json 설정

    ``` json
    "compilerOptions": {
       "jsxImportSource": "@emotion/react",
      ...
    }
    ```


---------------------------------------------

# 오류 및 문제 해결

- vite => .env 파일 방식이 달라짐!!
- 문제 : vite에서는 .env 파일을 불러는오는 방식이 달라졌다!!
- 해결 방법: vite에서는 밑에 형식 처럼 해야한다. (기존 방식과 다르다!)
``` js
  // 불러오는 방법
  export const URL = import.meta.env.VITE_SERVER_URL ?? "";

  // .env 파일 설정
  VITE_SERVER_URL=http://localhost:8080/

```
