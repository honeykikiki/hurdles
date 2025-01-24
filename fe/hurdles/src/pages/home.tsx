import ResCard from "@components/restaurant/Card";
import Frame from "@components/shared/Frame";
import Grid from "@components/shared/Grid";
import Skeleton from "@components/shared/Skeleton";
import Spacing from "@components/shared/Spacing";
import useRestaurant from "@hooks/restaurant/useRestaurantList";
import useIntersectionObserver from "@hooks/useIntersectionObserver";
import { spacing } from "@styles/spacingPalette";
import { useRef, useEffect, Suspense } from "react";

function HomePage() {
  const ref = useRef<HTMLDivElement | null>(null);
  const pageRef = useIntersectionObserver(ref, { rootMargin: "250px" });
  const isPageEnd = !!pageRef?.isIntersecting;

  const { data, fetchNextPage, hasNextPage, isFetching, isLoading } =
    useRestaurant();

  useEffect(() => {
    if (!isLoading && isPageEnd && hasNextPage) {
      fetchNextPage();
    }
  }, [fetchNextPage, hasNextPage, isLoading, isPageEnd]);

  const restaurantList = data?.pages.map(({ items }) => items).flat() ?? [];
  const filePath = data?.pages[0]?.filePath ?? "";

  return (
    <Suspense fallback={<div>suspense 테스트</div>}>
      <Frame title="메인" bBackButton={false}>
        <Spacing size={spacing.layout} />
        <Grid gridTemplateColumns="1fr 1fr" gridGap={spacing.xl}>
          {restaurantList.map((res, idx) => (
            <ResCard
              key={`${res.restaurantNo}-${idx}`}
              restaurant={res}
              filePath={filePath}
            />
          ))}
        </Grid>

        {/* 스켈레톤 만들기 */}
        {isFetching ? <ResonantSkeleton /> : null}
        <div ref={ref} style={{ height: "50px" }}></div>
      </Frame>
    </Suspense>
  );
}

const ResonantSkeleton = () => {
  return (
    <Grid gridTemplateColumns="1fr 1fr" gridGap={spacing.xl}>
      {Array(6)
        .fill("")
        .map(() => (
          <div>
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
