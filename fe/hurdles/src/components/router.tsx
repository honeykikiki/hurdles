import HomePage from "@pages/home";
import { Route, Routes, Navigate } from "react-router-dom";

interface RouterProps {}

export default function Router({}: RouterProps) {
  return (
    <>
      <Routes>
        <Route path="/" element={<HomePage />} />
        {/* <Route path="/myPage" element={<HomePage />} /> */}
        <Route path="*" element={<Navigate replace to="/" />} />
      </Routes>
    </>
  );
}
