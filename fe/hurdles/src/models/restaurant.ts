export interface Restaurant {
  restaurantNo: number;
  restaurantCodeNo: number;
  localNo: number;
  memberNo: number;
  fileNo: number;
  restaurantName: string;
  restaurantDes: string;
  restaurantAdd1: string;
  restaurantAdd2: string;
  restaurantTel: string;
  delyn: string;
  restaurantX: number;
  restaurantY: number;
  createDate: string;

  // 썸네일 파일
  fileSaveName?: string;

  // 사장님 이름
  memName?: string;

  restaurantCodeName: string; // 카테고리 명

  // 삭제할 이미지 id
  removeFileId?: number[];

  score?: number; // 레스토랑 평점
  reviewCnt?: number; // 리뷰 카운트

  pick?: number; // 0인경우 픽이 안되어 있는것임
}
