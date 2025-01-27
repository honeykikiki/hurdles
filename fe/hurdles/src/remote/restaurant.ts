import apiClient from "./axios";

interface GetRestaurantList {
  pageParam: number;
}

export async function getRestaurantList({ pageParam }: GetRestaurantList) {
  const { data } = await apiClient.get("/restaurant/list", {
    params: {
      pageNo: pageParam,
      recordCountPerPage: 10,
    },
  });

  return {
    filePath: data.filePath || "",
    paginationInfo: data.paginationInfo,
    items: data.items || [],
  };
}

interface GetRestaurant {
  restaurantNo: number;
  memberNo?: number;
}
export async function getRestaurant({ restaurantNo, memberNo }: GetRestaurant) {
  const { data } = await apiClient.get(`/restaurant/detail/${restaurantNo}`, {
    params: {
      memberNo,
    },
  });

  return data;
}
