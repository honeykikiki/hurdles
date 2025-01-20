import Flex from "@components/shared/Flex";
import ImageBox from "@components/shared/ImageBox";
import Spacing from "@components/shared/Spacing";
import MyText from "@components/shared/Text";
import { spacing } from "@styles/spacingPalette";
import { Restaurant } from "src/models/restaurant";
import { IMAGE_URL } from "src/remote/axios";

interface ResCardInstance {
  restaurant: Restaurant;
  filePath: string;
}

function ResCard({ restaurant, filePath }: ResCardInstance) {
  return (
    <Flex direction="column">
      <ImageBox
        src={IMAGE_URL + filePath + "/" + (restaurant.fileSaveName ?? "")}
        bFull={true}
      />
      <Spacing size={spacing.md} />
      <Flex>
        <MyText>{restaurant.restaurantName}</MyText>
      </Flex>
    </Flex>
  );
}

export default ResCard;
