package com.happylopers.domain;

public class SearchCriteria extends Criteria{
    private String searchType;
    private String keyword;
    
    public String getSearchType() {
        return searchType;
    }
    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }
    public String getKeyword() {
        return keyword;
    }
    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
    
    @Override
    public String toString() {
        return super.toString()+ " 검색페이징 [검색타입 : "+searchType+", 키워드 : "+keyword+"]";
    }

}
