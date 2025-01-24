import HomePage from "@pages/home";
import InfinityScroll from "@pages/InfinityScroll";
import RestaurantDetailPage from "@pages/restaurant/detail";
import SkeletonPage from "@pages/skeleton";
import { Route, Routes, Navigate } from "react-router-dom";

export default function Router() {
  return (
    <>
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/restaurant/:id" element={<RestaurantDetailPage />} />

        {/* <Route path="/myPage" element={<HomePage />} /> */}
        <Route path="*" element={<Navigate replace to="/" />} />

        {/*  삭제 */}
        <Route path="/infinity" element={<InfinityScroll />} />
        <Route path="/skeleton" element={<SkeletonPage />} />
      </Routes>
    </>
  );
}
