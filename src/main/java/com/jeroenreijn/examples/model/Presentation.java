package com.jeroenreijn.examples.model;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

/**
 * Simple representation of a Presentation
 * @author Jeroen Reijn
 */
public class Presentation {

    private Long id;

    private String title;

    private String speakerName;

    private String summary;

    private String room;

    @DateTimeFormat(iso = ISO.DATE)
    private LocalDate startTime;

    @DateTimeFormat(iso = ISO.DATE)
    private LocalDate endTime;

    public Long getId() {
        return id;
    }

    public void setId(final Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(final String title) {
        this.title = title;
    }

    public String getSpeakerName() {
        return speakerName;
    }

    public void setSpeakerName(final String speakerName) {
        this.speakerName = speakerName;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(final String summary) {
        this.summary = summary;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(final String room) {
        this.room = room;
    }

    public LocalDate getStartTime() {
        return startTime;
    }

    public void setStartTime(final LocalDate startTime) {
        this.startTime = startTime;
    }

    public LocalDate getEndTime() {
        return endTime;
    }

    public void setEndTime(final LocalDate endTime) {
        this.endTime = endTime;
    }
}
