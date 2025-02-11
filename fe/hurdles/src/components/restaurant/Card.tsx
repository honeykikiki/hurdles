import Card from "@components/shared/Card";
import Flex from "@components/shared/Flex";
import ImageBox from "@components/shared/ImageBox";
import Spacing from "@components/shared/Spacing";
import MyText from "@components/shared/Text";
import PickButton from "@components/widgets/PickButton";
import { spacing } from "@styles/spacingPalette";
import { Restaurant } from "src/models/restaurant";
import { IMAGE_URL } from "src/remote/axios";
import { useNavigate } from "react-router-dom";

interface ResCardInstance {
  restaurant: Restaurant;
  filePath: string;
}

function ResCard({ restaurant }: ResCardInstance) {
  const nav = useNavigate();
  const handleCardDetail = () => {
    nav("/restaurant/" + restaurant.restaurantNo);
  };

  return (
    <Card onClick={handleCardDetail}>
      <ImageBox
        src={IMAGE_URL + "/" + (restaurant.fileSaveName ?? "")}
        bFull={true}
        shape="rounded"
      />
      <Flex
        direction="column"
        align="start"
        style={{ padding: `${spacing.md}px` }}
      >
        <MyText typography="t4">{restaurant.restaurantName}</MyText>
        <MyText typography="t6" color="textSubColor">
          {restaurant.restaurantCodeName ?? "미정"}
        </MyText>

        <Spacing size={spacing.md} />
        <Flex align="center">
          <PickButton
            bPick={restaurant.bPick ?? false}
            count={restaurant.pickCount}
            restaurantNo={restaurant.restaurantNo}
          />

          <Spacing size={spacing.lg} direction="horizontal" />

          <MyText typography="t5">리뷰</MyText>
          <Spacing size="xs" direction="horizontal" />
          <MyText typography="t5" fontWeight="bold">
            {restaurant.reviewCount}
          </MyText>
        </Flex>
      </Flex>
    </Card>
  );
}

export default ResCard;
