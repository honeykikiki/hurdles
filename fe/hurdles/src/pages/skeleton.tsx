import Button from "@components/shared/Button";
import Skeleton from "@components/shared/Skeleton";
import Spacing from "@components/shared/Spacing";
import MyText from "@components/shared/Text";

function SkeletonPage() {
  return (
    <div>
      <Skeleton>
        <MyText>text</MyText>
      </Skeleton>

      <Spacing size={14} />
      <Skeleton.Text typography="t1" />

      <Spacing size={14} />
      <Skeleton.Image containerSize="lg" />
      {/* <ImageBox /> */}
      <Spacing size={14} />
      <Skeleton.Button buttonSize="lg" />
      <Spacing size={14} />
      <Button size="sm">button</Button>

      <Spacing size={14} />
    </div>
  );
}

export default SkeletonPage;
