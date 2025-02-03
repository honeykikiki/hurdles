package kr.or.honey.hurdles.vo;

import lombok.Data;

import java.util.Date;

@Data
public class MenuVo {
    private int menuNo;
    private int restaurantNo;
    private int fileNo;
    private String menuName;
    private int menuPrice;
    private String menuDes;
    private String delyn;
    private Date createDate;
}
