import { getResCodeList } from "src/remote/resCode";
import { useQuery } from "@tanstack/react-query";

function useResCodeList() {
  return useQuery({ queryKey: ["resCode"], queryFn: getResCodeList });
}

export default useResCodeList;
