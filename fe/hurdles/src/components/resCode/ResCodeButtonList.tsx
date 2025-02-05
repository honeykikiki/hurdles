import Button from "@components/shared/Button";
import ScrollContainer from "@components/shared/ScrollContainer";
import useResCodeList from "@hooks/resCode/useResCodeList";
import { radius } from "@styles/containerSize";
import { spacing } from "@styles/spacingPalette";
import { useCallback, useState } from "react";
import { css } from "@emotion/react";

function ResCodeButtonList() {
  const [selectCodeList, setSelectCodeList] = useState<number[]>([]);
  const { data: resCodeList } = useResCodeList();

  const handleClick = useCallback(
    (resCodeNo: number) => {
      let newResCodeList = [];

      if (selectCodeList.includes(resCodeNo)) {
        newResCodeList = selectCodeList.filter((code) => code !== resCodeNo);
      } else {
        newResCodeList = [...selectCodeList, resCodeNo];
      }

      setSelectCodeList(newResCodeList);
    },
    [selectCodeList],
  );

  return (
    <ScrollContainer
      gap={spacing.md}
      css={css`
        padding: 0 ${spacing.layout}px;
      `}
    >
      {resCodeList?.map(({ restaurantCodeName, restaurantCodeNo }) => {
        const select = selectCodeList.includes(restaurantCodeNo);

        return (
          <Button
            key={restaurantCodeNo}
            size="xs"
            weak={select ? false : true}
            color={select ? "primary" : "gray"}
            aria-selected={select}
            // onClick={select ? undefined : () => onNext(category)}
            onClick={() => handleClick(restaurantCodeNo)}
            style={{ borderRadius: radius.lg }}
          >
            {restaurantCodeName}
          </Button>
        );
      })}
    </ScrollContainer>
  );
}

export default ResCodeButtonList;
