import { getRestaurant } from "src/remote/restaurant";
import { useQuery } from "@tanstack/react-query";

function useRestaurant() {
  return useQuery({ queryKey: ["restaurant"], queryFn: () => getRestaurant() });
}

export default useRestaurant;
