import Button from "@components/shared/Button";
import Icons from "@components/shared/Icons";
import Spacing from "@components/shared/Spacing";
import MyText from "@components/shared/Text";
import { MouseEvent, useState } from "react";

function PickButton({ bPick, count }: { bPick: boolean; count: number }) {
  const [pick, setPick] = useState(bPick);
  const [pickCount, setPickCount] = useState(count);
  // React.MouseEvent<HTMLButtonElement, MouseEvent>
  const handleLikeToggle = (e: MouseEvent) => {
    e.preventDefault();
    e.stopPropagation(); // 부모 이벤트 막기
    setPick(!pick);
    setPickCount((prevPickCount) =>
      pick ? prevPickCount - 1 : prevPickCount + 1,
    );
  };

  return (
    <>
      {pick ? (
        <Button text={true} onClick={handleLikeToggle}>
          <Icons.Heart size={20} color="danger" />
        </Button>
      ) : (
        <Button text={true} onClick={handleLikeToggle}>
          <Icons.Heart size={20} color="black" />
        </Button>
      )}
      <Spacing size="xs" direction="horizontal" />
      <MyText fontWeight="bold">{pickCount}</MyText>
    </>
  );
}

export default PickButton;
