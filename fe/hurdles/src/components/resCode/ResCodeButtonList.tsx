import Button from "@components/shared/Button";
import ScrollContainer from "@components/shared/ScrollContainer";
import Skeleton from "@components/shared/Skeleton";
import useResCodeList from "@hooks/resCode/useResCodeList";
import { radius } from "@styles/containerSize";
import { spacing } from "@styles/spacingPalette";
import { useCallback, useState } from "react";
import { css } from "@emotion/react";

interface ResCodeButtonList {
  onNext: (list: number[]) => void;
}

function ResCodeButtonList({ onNext }: ResCodeButtonList) {
  const [selectCodeList, setSelectCodeList] = useState<number[]>([]);
  const { data: resCodeList, isLoading } = useResCodeList();

  const handleClick = useCallback(
    (resCodeNo: number) => {
      let newResCodeList: number[] = [];

      if (selectCodeList.includes(resCodeNo)) {
        newResCodeList = selectCodeList.filter((code) => code !== resCodeNo);
      } else {
        newResCodeList = [...selectCodeList, resCodeNo];
      }

      setSelectCodeList(newResCodeList);

      onNext(newResCodeList);
    },
    [onNext, selectCodeList],
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

      {isLoading ? <ResCodeSkeleton /> : null}
    </ScrollContainer>
  );
}

function ResCodeSkeleton() {
  return (
    <>
      {Array(8)
        .fill("")
        .map((_, idx) => (
          <Skeleton.Button key={idx} buttonSize="xs" />
        ))}
    </>
  );
}

export default ResCodeButtonList;
