import { Shimmer } from "@styles/animation/Shimmer";
import { colors } from "@styles/colorPlatte";
import { ButtonSize, buttonSizeMap } from "@styles/components/button";
import { ContainerSize, radius } from "@styles/containerSize";
import { Typography } from "@styles/typography";
import { css } from "@emotion/react";
import styled from "@emotion/styled";
import ImageBox from "./ImageBox";
import MyText from "./Text";

// SkeletonSize;

// function Skeleton({ children }: { children: React.ReactNode }) {
//   return <Container>{children}</Container>;
// }

const animation = css`
  animation: ${Shimmer} 2.2s infinite linear;
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
  width: 40%;
  height: 100%;
  background-color: rgba(174, 172, 172, 0.677);
  filter: blur(15px);
  ${animation}
`;

function TextSkeleton({ typography }: { typography: Typography }) {
  return (
    <BaseSkeleton bFull={false}>
      <ShimmerContainer />
      <MyText typography={typography} color="skeletonBg">
        myText myText
      </MyText>
    </BaseSkeleton>
  );
}

function ImageSkeleton({ containerSize }: { containerSize: ContainerSize }) {
  return (
    <BaseSkeleton bFull={true}>
      <ShimmerContainer />
      <ImageBox size={containerSize} bFull={true} fallback={<></>} />
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
