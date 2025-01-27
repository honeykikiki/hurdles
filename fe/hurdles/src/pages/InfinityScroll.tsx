import ResCard from "@components/restaurant/Card";
import Frame from "@components/shared/Frame";
import Grid from "@components/shared/Grid";
import Loader from "@components/shared/loader";
import Spacing from "@components/shared/Spacing";
import useRestaurant from "@hooks/restaurant/useRestaurantList";
import useIntersectionObserver from "@hooks/useIntersectionObserver";
import { spacing } from "@styles/spacingPalette";
import { useEffect, useRef } from "react";

function InfinityScroll() {
  const ref = useRef<HTMLDivElement | null>(null);
  const entry = useIntersectionObserver(ref, { threshold: 1.0 }); // 인피니트 옵저버
  const isPageEnd = entry?.isIntersecting ?? false; // 페이지 끝에 닿는 경우

  const {
    data,
    fetchNextPage, // 다음 페이지를 fetch 할 수 있다.
    hasNextPage, // 가져올 수 있는 다음 페이지가 있는 경우 true
    isFetchingNextPage, // fetchNextPage 메서드가 다음 페이지를 가져오는 동안 true
    isFetching,
    isLoading,
  } = useRestaurant({});

  useEffect(() => {
    if (isPageEnd && hasNextPage && !isFetchingNextPage) {
      // 여러번 중복으로 호출 방지
      const timerId = setTimeout(() => fetchNextPage(), 300);
      return () => clearTimeout(timerId);
    }
  }, [fetchNextPage, hasNextPage, isPageEnd, isFetchingNextPage]);

  if (isLoading === true || data === undefined) {
    // 로딩 중 || 데이터가 없는 경우
    return <Loader />;
  }

  const restaurantList = data?.pages.map(({ items }) => items).flat(); // 식당 목록
  const filePath = data.pages[0].filePath; // 파일 경로
  const paginationInfo = data.pages[0].paginationInfo; // 파일 경로
  console.log(data.pages); //  : 모든 페이지 데이터를 포함하는 배열이다.
  console.log(data.pageParams); //  : 모든 페이지 매개변수를 포함하는 배열이다.
  console.log(paginationInfo);

  return (
    <Frame title="메인" bBackButton={false}>
      <Spacing size={spacing.layout} />
      <Grid gridTemplateColumns={"1fr 1fr"} gridGap={spacing.layout}>
        {restaurantList?.map((res, idx) => {
          return (
            <ResCard
              key={res.restaurantNo + idx + res.restaurantName}
              restaurant={res}
              filePath={filePath ?? ""}
            />
          );
        })}
      </Grid>

      {(isFetching || isFetchingNextPage) && <Loader />}
      <div ref={ref}>옵저벙~</div>
    </Frame>
  );
}

export default InfinityScroll;
