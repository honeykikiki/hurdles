import { getRestaurantList } from "src/remote/restaurant";
import { useInfiniteQuery } from "@tanstack/react-query";

function useRestaurant(query: number[]) {
  return useInfiniteQuery({
    queryKey: ["restaurants", query],
    queryFn: ({ pageParam }) => {
      return getRestaurantList({ pageParam, query });
    },
    initialPageParam: 1,
    getNextPageParam: (lastPage) => {
      const { paginationInfo } = lastPage;
      return paginationInfo.pageNo < paginationInfo.lastPageNo
        ? paginationInfo.pageNo + 1
        : undefined;
    },
    staleTime: 1000 * 60 * 1, // Cache for 5 minutes
  });
}

export default useRestaurant;
