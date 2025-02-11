import ResCodeButtonList from "@components/resCode/ResCodeButtonList";
import ResCard from "@components/restaurant/Card";
import Frame from "@components/shared/Frame";
import Grid from "@components/shared/Grid";
import Skeleton from "@components/shared/Skeleton";
import Spacing from "@components/shared/Spacing";
import useRestaurant from "@hooks/restaurant/useRestaurantList";
import useIntersectionObserver from "@hooks/useIntersectionObserver";
import { spacing } from "@styles/spacingPalette";
import { useRef, useEffect, useState } from "react";

function HomePage() {
  const ref = useRef<HTMLDivElement | null>(null);
  const pageRef = useIntersectionObserver(ref, { rootMargin: "50px" });
  const isPageEnd = !!pageRef?.isIntersecting;
  const [query, setQuery] = useState<number[]>([]);

  const { data, fetchNextPage, hasNextPage, isFetching, isLoading } =
    useRestaurant(query);

  useEffect(() => {
    if (!isLoading && isPageEnd && hasNextPage) {
      fetchNextPage();
    }
  }, [fetchNextPage, hasNextPage, isLoading, isPageEnd]);

  const restaurantList = data?.pages.map(({ items }) => items).flat() ?? [];
  const filePath = data?.pages[0]?.filePath ?? "";

  return (
    <Frame title="메인" bBackButton={false}>
      <Spacing size={spacing.layout} />
      <ResCodeButtonList
        onNext={(list) => {
          setQuery(list);
        }}
      />
      <Spacing size={spacing.layout} />
      {restaurantList.length > 0 ? (
        <Grid gridTemplateColumns="1fr 1fr" gridGap={spacing.xl}>
          {restaurantList.map((res, idx) => (
            <ResCard
              key={`${res.restaurantNo}-${idx}`}
              restaurant={res}
              filePath={filePath}
            />
          ))}
        </Grid>
      ) : null}
      {/* 스켈레톤 만들기 */}
      {isFetching ? <ResonantSkeleton /> : null}
      <div ref={ref}></div>
    </Frame>
  );
}

const ResonantSkeleton = () => {
  return (
    <Grid gridTemplateColumns="1fr 1fr" gridGap={spacing.xl}>
      {Array(8)
        .fill("")
        .map((_, idx) => (
          <div key={idx}>
            <Skeleton.Image containerSize="half" />
            <Spacing size="sm" />
            <Skeleton.Text typography="t5" />
            <Spacing size="sm" />
            <Skeleton.Text typography="t7" />
          </div>
        ))}
    </Grid>
  );
};

export default HomePage;
