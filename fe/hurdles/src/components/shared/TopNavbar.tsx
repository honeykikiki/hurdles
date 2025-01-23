import { colors } from "@styles/colorPlatte";
import { spacing } from "@styles/spacingPalette";
import styled from "@emotion/styled";
import { Link } from "react-router-dom";
import Button from "./Button";
import Flex from "./Flex";
import Icons from "./Icons";
import MyText from "./Text";

interface TopNavbar {
  title: string;
  bBackButton: boolean;
  backButtonClick?: () => void;
  bAlert: boolean;
}

function TopNavbar({ title, bBackButton, backButtonClick, bAlert }: TopNavbar) {
  return (
    <Container id="navbar">
      <Flex align="center" justify="space-between">
        {bBackButton ? (
          <Button text={true} onClick={backButtonClick}>
            <Icons.Back />
          </Button>
        ) : (
          <Link to={"/"}>
            <Icons.Main />
          </Link>
        )}

        <MyTextCenter typography="t5" fontWeight="bold">
          {title}
        </MyTextCenter>

        {bAlert ? <Icons.Badge /> : null}
      </Flex>
    </Container>
  );
}

const Container = styled.header`
  padding: ${spacing.md}px ${spacing.layout}px;
  position: sticky;
  width: 100%;
  box-sizing: border-box;
  top: 0;
  left: 0;
  background-color: ${colors.background};
  /* border-bottom: 1px solid ${colors.grayBorder}; */
  /* background-color: rgba(255, 255, 255, 0.1); */
  /* backdrop-filter: blur(10px); */
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  /* border: 1px solid rgba(255, 255, 255, 0.4); */

  /* margin-bottom: 12px; // 전체적으로 네비 하단으로 12px마진이 있음 */
  z-index: var(--navbar-z-index);
`;

const MyTextCenter = styled(MyText)`
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  background-color: transparent;
`;

export default TopNavbar;
