import { radius } from "@styles/containerSize";
import styled from "@emotion/styled";

// function Card({ children }: { children: React.ReactNode }) {
//   return <Container>{children}</Container>;
// }

const Card = styled.div`
  background-color: white;
  border-radius: ${radius.md};
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
`;

export default Card;
