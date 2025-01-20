import { spacing } from "@styles/spacingPalette";
import Badge from "./Badge";
import Flex from "./Flex";
import Icons from "./Icons";
import ImageBox from "./ImageBox";
import Spacing from "./Spacing";
import MyText from "./Text";

interface UserInfoProps {
  name: string;
  badgeText?: string;
  subContent?: string;
}

function UserInfo({ name, badgeText, subContent }: UserInfoProps) {
  return (
    <Flex align="center" css={{ padding: `0 ${spacing.layout}px` }}>
      <ImageBox size="xs" shape="circle" src="" fallback={<Icons.User />} />
      <Spacing size="sm" direction="horizontal" />
      <Flex direction="column">
        <Flex>
          <MyText typography="t6" fontWeight="500">
            {name}
          </MyText>
          {badgeText !== undefined ? (
            <>
              <Spacing size="sm" direction="horizontal" />
              <Badge size="sm">전체공개</Badge>
            </>
          ) : null}
        </Flex>
        {subContent !== undefined ? (
          <MyText typography="t7" color="textSubColor">
            1시간전
          </MyText>
        ) : null}
      </Flex>
    </Flex>
  );
}

export default UserInfo;
