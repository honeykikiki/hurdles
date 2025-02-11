import apiClient from "./axios";

interface GetRestaurantList {
  pageParam: number;
  query: number[];
}

export async function getRestaurantList({
  pageParam,
  query,
}: GetRestaurantList) {
  const { data } = await apiClient.get("/res/list", {
    params: {
      pageNo: pageParam,
      recordCountPerPage: 10,
      codeList: query,
    },
    paramsSerializer: (params) => {
      return new URLSearchParams(params).toString();
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
  const { data } = await apiClient.get(`/res/detail/${restaurantNo}`, {
    params: {
      memberNo,
    },
  });

  return data;
}
