import { css } from "@emotion/react";

export const colorPalette = css`
  :root {
    /* --primary: rgba(119, 205, 222, 1); */
    --primary: rgba(200, 141, 92, 1);
    --success: rgba(72, 207, 173, 1);
    --danger: rgba(255, 85, 85, 1);
    --gray: #e4e4e4;
    --gray-border: #c4c4c4;
    --danger-100: rgba(255, 85, 85, 0.1);
    --background: #ffffff;
    --text-color: #000000;
    --text-sub-color: #767676;
    --text-muted-color: #b0b0b0;

    --step-bar-bg: #d6d6d6;
    --selected-bg: #f2f3f6;

    --button-bg-color: #dedede;
    --input-border: #707070;
    --spacing: #dfe0df;
    --box: #e8e8e8;
    --hover: #f5f5f5;
    --icon: #8b8b8b;

    --white: #ffffff;
    --black: #000;

    --only-white: #ffffff;
    --only-black: #000;
  }

  /* 다크 모드 색상 설정 */
  [data-theme="dark"] {
    /* --primary: rgba(91, 156, 169, 1); */
    --success: rgba(58, 162, 136, 1);
    --danger: rgba(191, 64, 64, 1);
    --gray: #e4e4e4;
    --danger-100: rgba(191, 64, 64, 0.1);
    --background: #3c3c3c;
    --text-color: #ffffff;
    --text-sub-color: #a3a3a3;
    --text-muted-color: #5c5c5c;

    --step-bar-bg: #5a5a5a;
    --selected-bg: #4c4c4c;

    --button-bg-color: #4c4c4c;
    --input-border: #a8a8a8;
    --hover: #525252;

    --white: #3c3c3c;
    --black: #ffffff;
  }
`;

export const colors = {
  primary: "var(--primary)",
  success: "var(--success)",
  danger: "var(--danger)",
  gray: "var(--gray)",
  grayBorder: "var(--gray-border)",
  danger100: "var(--danger-100)",
  background: "var(--background)",
  textColor: "var(--text-color)",
  textSubColor: "var(--text-sub-color)",
  textMutedColor: "var(--text-muted-color)",

  stepBarBg: "var(--step-bar-bg)",
  selectedBg: "var(--selected-bg)",

  buttonBgColor: "var(--button-bg-color)",
  inputBorder: "var(--input-border)",
  spacing: "var(--spacing)",
  box: "var(--box)",
  hover: "var(--hover)",
  icon: "var(--icon)",

  white: "var(--white)",
  black: "var(--black)",
  onlyWhite: "var(--only-white)",
  onlyBlack: "var(--only-black)",
  transparent: "transparent",
};

export type Colors = keyof typeof colors;
