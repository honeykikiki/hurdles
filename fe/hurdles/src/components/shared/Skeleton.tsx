import { Shimmer } from "@styles/animation/Shimmer";
import { colors } from "@styles/colorPlatte";
import { ButtonSize, buttonSizeMap } from "@styles/components/button";
import { container, ContainerSize, radius } from "@styles/containerSize";
import { Typography } from "@styles/typography";
import { css } from "@emotion/react";
import styled from "@emotion/styled";
import MyText from "./Text";

// SkeletonSize;

// function Skeleton({ children }: { children: React.ReactNode }) {
//   return <Container>{children}</Container>;
// }

const animation = css`
  animation: ${Shimmer} 1.5s infinite linear;
`;

const BaseSkeleton = styled.div<{ bFull?: boolean }>(
  {
    backgroundColor: colors.skeletonBg,
    borderRadius: radius.sm,
    // padding: "0 20px",
    position: "relative",
    overflow: "hidden",
  },
  ({ bFull }) =>
    bFull
      ? css`
          width: 100%;
        `
      : css`
          width: fit-content;
        `,
);

const ShimmerContainer = styled.div`
  position: absolute;
  left: -50%;
  top: 0;
  width: 50%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.15);
  filter: blur(5px);
  ${animation}
`;

function TextSkeleton({ typography }: { typography: Typography }) {
  return (
    <BaseSkeleton bFull={false}>
      <ShimmerContainer />
      <MyText typography={typography} color="skeletonBg">
        sk
      </MyText>
    </BaseSkeleton>
  );
}

function ImageSkeleton({ containerSize }: { containerSize: ContainerSize }) {
  return (
    <BaseSkeleton
      bFull={false}
      css={css`
        ${container[containerSize]}
      `}
    >
      <ShimmerContainer />
    </BaseSkeleton>
  );
}

function ButtonSkeleton({ buttonSize }: { buttonSize: ButtonSize }) {
  return (
    <BaseSkeleton
      bFull={false}
      css={css`
        ${buttonSizeMap[buttonSize]}
      `}
    >
      <ShimmerContainer />
      &nbsp;&nbsp;
    </BaseSkeleton>
  );
}

const Skeleton = BaseSkeleton as typeof BaseSkeleton & {
  Text: typeof TextSkeleton;
  Image: typeof ImageSkeleton;
  Button: typeof ButtonSkeleton;
};

Skeleton.Text = TextSkeleton;
Skeleton.Image = ImageSkeleton;
Skeleton.Button = ButtonSkeleton;

export default Skeleton;
