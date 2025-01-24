import Button from "@components/shared/Button";
import Card from "@components/shared/Card";
import Flex from "@components/shared/Flex";
import Icons from "@components/shared/Icons";
import ImageBox from "@components/shared/ImageBox";
import Spacing from "@components/shared/Spacing";
import MyText from "@components/shared/Text";
import { spacing } from "@styles/spacingPalette";
import { Restaurant } from "src/models/restaurant";
import { IMAGE_URL } from "src/remote/axios";
import { useNavigate } from "react-router-dom";

interface ResCardInstance {
  restaurant: Restaurant;
  filePath: string;
}

function ResCard({ restaurant, filePath }: ResCardInstance) {
  const nav = useNavigate();
  const handleCardDetail = () => {
    nav("/restaurant/" + restaurant.restaurantNo);
  };

  const handleLikeToggle = () => {
    // if (restaurant.pick == null) {
    // }
  };

  return (
    <Card onClick={handleCardDetail}>
      <ImageBox
        src={IMAGE_URL + filePath + "/" + (restaurant.fileSaveName ?? "")}
        bFull={true}
        shape="rounded"
      />
      <Flex
        direction="column"
        align="start"
        style={{ padding: `${spacing.md}px` }}
      >
        <MyText typography="t4">{restaurant.restaurantName}</MyText>
        <MyText typography="t7" color="textSubColor">
          {restaurant.restaurantCodeName ?? "미정"}
        </MyText>
        <Flex></Flex>

        <Spacing size={spacing.md} />
        <Flex align="center">
          {restaurant.pick === 0 ? (
            <Button text={true} onClick={handleLikeToggle}>
              <Icons.Heart color="danger" />
            </Button>
          ) : (
            <Button text={true} onClick={handleLikeToggle}>
              <Icons.Heart color="danger" />
            </Button>
          )}
          <Spacing size={spacing.sm} direction="horizontal" />
          <MyText typography="t6">{restaurant.reviewCnt}</MyText>

          <Spacing size={spacing.lg} direction="horizontal" />

          <MyText typography="t6">리뷰</MyText>
          <Spacing size={spacing.sm} direction="horizontal" />
          <MyText typography="t6">{restaurant.reviewCnt}</MyText>
        </Flex>
      </Flex>
    </Card>
  );
}

export default ResCard;
