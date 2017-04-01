package app2.example.hp.com.myapplication;

import java.util.Date;

/**
 * Created by SIDDHARTH on 1/10/2016.
 */
public class Movies {
    private Long id;
    private String title;
    private Date releaseDateTheater;
    private int audienceScore;
    private String synopsis;
    private String urlThumbnail;
    private String urlSelf;
    private String urlCast;
    private String urlReview;
    private String urlSimilar;

    public Movies() {

    }

    public Movies(long id,
                  String title,
                  Date releaseDateTheater,
                  int audienceScore,
                  String synopsis,
                  String urlThumbnail,
                  String urlCast,
                  String urlReview,
                  String urlSimilar) {


        this.id = id;
        this.title = title;
        this.releaseDateTheater = releaseDateTheater;
        this.audienceScore = audienceScore;
        this.synopsis = synopsis;
        this.urlThumbnail = urlThumbnail;
        this.urlCast = urlCast;
        this.urlReview = urlReview;
        this.urlSimilar = urlSimilar;

    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void settitle(String title) {
        this.title = title;
    }

    public Date getReleaseDateTheater() {
        return releaseDateTheater;
    }

    public void setReleaseDateTheater(Date releaseDateTheater) {
        this.releaseDateTheater = releaseDateTheater;
    }

    public int getAudienceScore() {
        return audienceScore;
    }

    public void setAudienceScore(int audienceScore) {
        this.audienceScore = audienceScore;
    }

    public String getSynopsis() {
        return synopsis;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }

    public String getUrlCast() {
        return urlCast;
    }

    public void setUrlCast(String urlCast) {
        this.urlCast = urlCast;
    }

    public String getUrlReview() {
        return urlReview;
    }

    public void setUrlReview(String urlReview) {
        this.urlReview = urlReview;
    }

    public String getUrlThumbnail() {
        return urlThumbnail;
    }

    public void setUrlThumbnail(String urlThumbnail) {
        this.urlThumbnail = urlThumbnail;
    }

    public String getUrlSimilar() {
        return urlSimilar;
    }

    public void setUrlSimilar(String urlSimilar) {
        this.urlSimilar = urlSimilar;
    }

    public String toString() {
        return "ID" + id +
                "TITLE" + title +
                "DATE" + releaseDateTheater +
                "SYNOPSIS" + synopsis +
                "SCORE" + audienceScore +
                "URL_THUMBNAIL" + urlThumbnail;
    }


}