import Button from "@components/shared/Button";
import Icons from "@components/shared/Icons";
import Spacing from "@components/shared/Spacing";
import MyText from "@components/shared/Text";
import { MouseEvent, useState } from "react";

interface PickButtonProps {
  bPick: boolean;
  count: number;
  restaurantNo: number;
}

function PickButton({ bPick, count, restaurantNo }: PickButtonProps) {
  const [pick, setPick] = useState(bPick);
  const [pickCount, setPickCount] = useState(count);
  // React.MouseEvent<HTMLButtonElement, MouseEvent>
  const handleLikeToggle = (e: MouseEvent) => {
    e.preventDefault();
    e.stopPropagation(); // 부모 이벤트 막기

    try {
      // pick 이벤트 만들기
      setPick(!pick);
      setPickCount((prevPickCount) =>
        pick ? prevPickCount - 1 : prevPickCount + 1,
      );
    } catch (e) {
      console.log(e);
    }
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
