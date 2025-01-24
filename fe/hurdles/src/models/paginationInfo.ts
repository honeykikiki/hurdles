export interface PageInfo<T> {
  currentPage: number;
  pageNo: number;
  recordCountPerPage: number;
  pageSize: number;
  totalRecordCount: number;
  lastPageNo: number;
  searchVo?: T;
}
