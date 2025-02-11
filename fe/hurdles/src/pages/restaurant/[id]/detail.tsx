import { useParams } from "react-router-dom";

function RestaurantDetailPage() {
  const param = useParams();

  return (
    <div>
      DetailPage
      {param.id}
    </div>
  );
}

export default RestaurantDetailPage;
