import { useParams } from "react-router-dom";

function RestaurantDetailPage22222() {
  const param = useParams();

  return (
    <div>
      DetailPage
      {param.id}
    </div>
  );
}

export default RestaurantDetailPage22222;
