import { getRestaurantList } from "src/remote/restaurant";
import { useSuspenseInfiniteQuery } from "@tanstack/react-query";

function useRestaurant() {
  return useSuspenseInfiniteQuery({
    queryKey: ["restaurants"],
    queryFn: ({ pageParam }) => {
      return getRestaurantList({ pageParam });
    },
    initialPageParam: 1,
    getNextPageParam: (lastPage) => {
      const { paginationInfo } = lastPage;
      return paginationInfo.pageNo < paginationInfo.lastPageNo
        ? paginationInfo.pageNo + 1
        : undefined;
    },
    staleTime: 1000 * 60 * 5, // Cache for 5 minutes
    // refetchOnWindowFocus: false, // Prevent automatic refetching when window is refocused\
  });
}

export default useRestaurant;
