package kr.or.honey.hurdles.vo;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class RestaurantVo {
    private int restaurantNo;
    private int restaurantCodeNo;
    private String restaurantCodeName;
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

    private boolean bPick; // 좋아요 체크 여부
    private int pickCount; // 좋아요 카운트
    private int reviewCount; // 리뷰 카운트

    private int[] codeList; // 검색용

    public void setBPick(int bPick) {
        this.bPick = bPick == 1;
    }
}
