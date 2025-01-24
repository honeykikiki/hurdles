import { keyframes } from "@emotion/react";

export const Shimmer = keyframes`
    0% {
      opacity: 0;
      transform: translateX(-250%),skewX(0deg);
    }
    50% {
      transform: translateX(-60%) skewX(-10deg);
      opacity: .75;
    }
    100% {
      transform: translate(250%) skewX(-10deg);
      opacity: 0;
    }
`;
