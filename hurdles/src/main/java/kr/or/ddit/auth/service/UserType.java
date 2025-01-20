package kr.or.ddit.auth.service;


public enum UserType {
    ADMIN,
    OWNER,
    NORMAL;

    public static UserType fromCode(int code) {
    	UserType type = null;
    	switch (code) {
			case 0 -> type = ADMIN;
			case 1 -> type = OWNER;
			case 2 -> type = NORMAL;
			default ->
				throw new IllegalArgumentException("Unexpected value: " + type);
		}
    	
        return type;
    }
}