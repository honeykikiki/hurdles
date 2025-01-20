import ResCard from "@components/restaurant/Card";
import Frame from "@components/shared/Frame";
import Grid from "@components/shared/Grid";
import Loader from "@components/shared/loader";
import Spacing from "@components/shared/Spacing";
import useRestaurant from "@hooks/restaurant/useRestaurantList";
import { spacing } from "@styles/spacingPalette";

function HomePage() {
  const { data, isLoading } = useRestaurant();

  if (isLoading === true || data === undefined) {
    return <Loader />;
  }

  const { items: restaurantList, filePath, paginationInfo } = data;
  console.log(paginationInfo);
  console.log(filePath);

  return (
    <Frame title="메인" bBackButton={false}>
      <Spacing size={spacing.layout} />
      <Grid gridTemplateColumns={"1fr 1fr"} gridGap={spacing.layout}>
        {restaurantList.map((restaurant) => (
          <ResCard restaurant={restaurant} filePath={filePath} />
        ))}
      </Grid>
    </Frame>
  );
}

export default HomePage;
