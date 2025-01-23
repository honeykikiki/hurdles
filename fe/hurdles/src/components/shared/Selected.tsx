import { colors } from "@styles/colorPlatte";
import { radius } from "@styles/containerSize";
import { Typography } from "@styles/typography";
import { HTMLAttributes } from "react";
import { useBottomSheetContext } from "src/context/BottomSheetContext";
import styled from "@emotion/styled";
import Button from "./Button";
import Flex from "./Flex";
import Icons from "./Icons";
import Spacing from "./Spacing";
import MyText from "./Text";

type SelectType = "xs" | "sm" | "md" | "lg";

const SelectContainer = styled.div<{ size: SelectType }>`
  display: inline-flex;
  align-items: center;
  background-color: ${colors.selectedBg};
  border-radius: ${radius.md};
  width: fit-content;
  cursor: pointer;
  color: #666;

  ${({ size }) => {
    switch (size) {
      case "xs":
        return "padding: 6px 10px;";
      case "sm":
        return "padding: 8px 12px;";
      case "md":
        return "padding: 10px 14px;";

      // lg
      default:
        return "padding: 10px 18px;";
    }
  }}
`;

interface SelectedProps extends HTMLAttributes<HTMLDivElement> {
  title: string;
  currentItem: string;
  itemList: string[];
  size?: SelectType;
}

function Selected({
  title,
  currentItem,
  itemList,
  size = "md",
  ...props
}: SelectedProps) {
  const { open } = useBottomSheetContext();

  const Typography: Typography =
    size === "xs" ? "t7" : size === "sm" ? "t6" : size === "md" ? "t5" : "t4";

  return (
    <SelectContainer
      size={size}
      role="button"
      aria-haspopup="listbox"
      aria-expanded="false"
      onClick={() => {
        open({
          body: (
            <Flex direction="column" role="listbox">
              <MyText typography="t4" fontWeight="bold">
                {title}
              </MyText>
              <Spacing size={14} />
              {itemList.map((item, idx) => {
                const bSelected = item === currentItem;
                return (
                  <SelectedItem
                    key={item + idx}
                    bSelected={bSelected}
                    item={item}
                  />
                );
              })}
            </Flex>
          ),
        });
      }}
      {...props}
    >
      <MyText typography={Typography}>{title}</MyText>
      <Spacing size="md" direction="horizontal" />
      <Icons.ArrowBottom />
    </SelectContainer>
  );
}

function SelectedItem({
  item,
  bSelected,
}: {
  item: string;
  bSelected: boolean;
}) {
  return (
    <Button text={true} role="option" aria-selected={bSelected} full={true}>
      <Flex justify="space-between" align="center">
        <MyText
          color={bSelected ? "primary" : "textColor"}
          fontWeight={bSelected ? "bold" : "normal"}
        >
          {item}
        </MyText>
        {bSelected && <Icons.Check color="primary" />}
      </Flex>
    </Button>
  );
}

export default Selected;
