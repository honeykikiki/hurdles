import { ResCode } from "src/models/resCode";
import apiClient from "./axios";

export async function getResCodeList() {
  const { data } = await apiClient.get("/resCode/list");

  return data.items as ResCode[];
}
