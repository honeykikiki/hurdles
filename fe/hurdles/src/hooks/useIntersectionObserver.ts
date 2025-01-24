import { RefObject, useEffect, useState } from "react";

/**
 * 돔 요소의 가시성을 판단하기 위한 훅
 * @param elementRef 엘리머트 돔
 * @param param1
 * @returns
 */
function useIntersectionObserver(
  elementRef: RefObject<Element>,
  { threshold = 0.1, root = null, rootMargin = "10%" },
) {
  const [entry, setEntry] = useState<IntersectionObserverEntry | null>(null);

  useEffect(() => {
    const node = elementRef?.current;
    console.log(node);

    if (!node || !window.IntersectionObserver) {
      // `ref`가 없거나 IntersectionObserver가 지원되지 않으면 종료
      return;
    }

    const observer = new IntersectionObserver(([entry]) => setEntry(entry), {
      threshold,
      root,
      rootMargin,
    });

    observer.observe(node);

    return () => observer.disconnect(); // 컴포넌트 언마운트 시 옵저버 해제
  }, [elementRef, root, rootMargin, threshold]);

  return entry;
}

export default useIntersectionObserver;
