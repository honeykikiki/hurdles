import { colors } from "@styles/colorPlatte";
import { BadgeSize, badgeSizeMap } from "@styles/components/badge";
import styled from "@emotion/styled";

interface BadgeProps {
  size?: BadgeSize;
}

export const BaseBadge = styled.div<BadgeProps>(
  {
    backgroundColor: colors.primary,
    color: colors.onlyWhite,
    width: "fit-content",
    borderRadius: 20,
  },
  ({ size = "md" }) => badgeSizeMap[size],
);

const Badge = BaseBadge as typeof BaseBadge & {};

export default Badge;
