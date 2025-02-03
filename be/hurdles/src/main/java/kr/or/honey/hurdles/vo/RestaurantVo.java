package kr.or.honey.hurdles.vo;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class RestaurantVo {
    private int restaurantNo;
    private int restaurantCodeNo;
    private int localNo;
    private int memberNo;
    private int fileNo;
    private String restaurantName;
    private String restaurantDes;
    private String restaurantAdd1;
    private String restaurantAdd2;
    private String restaurantTel;
    private String delyn;
    private int restaurantX;
    private int restaurantY;
    private Date createDate;

    private String fileSaveName; // 파일 이름

    private List<MenuVo> menuList; // 파일 이름
}
