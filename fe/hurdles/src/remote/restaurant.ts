import { Restaurant } from "src/models/restaurant";
import apiClient from "./axios";

export async function getRestaurant() {
  const { data } = await apiClient.get("/restaurant/list");

  return {
    filePath: (data.filePath as string) ?? "",
    paginationInfo: (data.paginationInfo as object) ?? "",
    items: (data.items as Restaurant[]) ?? [],
  };
}
