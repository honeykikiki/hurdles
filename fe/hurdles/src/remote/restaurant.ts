import apiClient from "./axios";

interface GetRestaurant {
  pageParam: number;
}

export async function getRestaurant({ pageParam }: GetRestaurant) {
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
